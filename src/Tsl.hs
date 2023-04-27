module Tsl where

import Control.Monad (mapM_, when)
import Data.Bifunctor (Bifunctor(second))
import Data.List (transpose, unwords, intercalate)
import Data.Char (digitToInt)
import System.Environment (getArgs)

import Lexer (alexScanTokens)
import Parser
import TypeChecker (verify)

-- Main

type Scope = [(String, VarValue)]
type Imports = [(String, VarValue)]
type Environment = ([Scope], [String])              -- Environment includes scopes (innermost first) and output strings

data VarValue = IntValue Int | BoolValue Bool | TileValue [[Int]] deriving (Eq)

-- Scan top-level imports statically
scanImports :: [Statement] -> [String]
scanImports = foldr (\stmt acc -> acc ++ getFile stmt) []
    where 
        getFile :: Statement -> [String]
        getFile (ImportStmt file _) = [file]
        getFile _ = []

-- Parses a tile value if given a string representation of a tile
parseTile :: String -> VarValue
parseTile input = TileValue $ map parseLine $ lines input
    where
        parseLine :: String -> [Int]
        parseLine = map digitToInt

-- Restore the environment after accessing children scopes
restore :: Environment -> Environment
restore (scopes, out) = (tail scopes, out)

-- Update a binding by finding a matching name up the scope chain
bind :: Environment -> [Scope] -> (String, VarValue) -> Environment
bind ([], out) prev (id, v) = (((id, v) : head prev) : tail prev, out)
bind (scope : scopes, out) prev (id, v) = 
    if found 
        then (prev ++ [nscope] ++ scopes, out)
        else bind (scopes, out) (prev ++ [scope]) (id, v) 
    where 
        (found, nscope) = bindScope scope [] (id, v)

        bindScope :: Scope -> Scope -> (String, VarValue) -> (Bool, Scope)
        bindScope [] prev (id, v) = (False, prev)
        bindScope (entry@(x, _) : scope) prev (id, v) = if id == x
            then (True, prev ++ [(id, v)] ++ scope)
            else bindScope scope (prev ++ [entry]) (id, v)

bindCurrentScope :: Environment -> (String, VarValue) -> Environment
bindCurrentScope (scope : scopes, out) (id, v) = (((id, v) : scope) : scopes, out)

-- Look up a variable up the scope chain
lookupVar :: Environment -> String -> VarValue
lookupVar ([], out) id = error "Unreachable"                      -- Not happening. Type checker already handled it
lookupVar (scope : scopes, out) id = case lookupScope scope id of
    Nothing -> lookupVar (scopes, out) id
    Just t -> t
    where 
        lookupScope :: Scope -> String -> Maybe VarValue
        lookupScope [] id = Nothing
        lookupScope ((x, v) : scope) id = if id == x then Just v else lookupScope scope id

-- Execute statements (code block)
execute :: Imports -> Environment -> [Statement] -> Environment
execute imps = foldr $ flip $ executeStmt imps

-- Execute individual statement
executeStmt :: Imports -> Environment -> Statement -> Environment

executeStmt imps env (VarDecl id expr) = bindCurrentScope env (id, eval env expr)
executeStmt imps env (VarAssign id expr) = bind env [] (id, eval env expr)

executeStmt imps env@(scopes, out) (ForLoop id expr1 expr2 stmts) = restore env2
    where
        (IntValue start) = eval env expr1
        (IntValue end) = eval env expr2

        env2 = foldl executeBody ([] : scopes, out) [start..end]

        executeBody :: Environment -> Int -> Environment
        executeBody env i = ([] : restored, out2)
            where (restored, out2) = restore $ execute imps (bindCurrentScope env (id, IntValue i)) stmts

executeStmt imps env@(scopes, out) (IfStmt expr stmts1 stmts2) 
    | cond = restore $ execute imps ([] : scopes, out) stmts1
    | otherwise = restore $ execute imps ([] : scopes, out) stmts2
    where 
        (BoolValue cond) = eval env expr

executeStmt imps env@(scopes, out) (OutputStmt expr) = (scopes, out ++ [unparseValue $ eval env expr])
    where
        unparseValue :: VarValue -> String
        unparseValue (IntValue x) = show x
        unparseValue (BoolValue True) = "true"
        unparseValue (BoolValue False) = "false"
        unparseValue (TileValue x) = intercalate "\n" (map (intercalate "" . map show) x)

executeStmt imps env (ImportStmt file id) = bindCurrentScope env (id, lookupImport imps file)
    where 
        lookupImport :: Imports -> String -> VarValue
        lookupImport [] file = error "Import statements must only be at top level"
        lookupImport ((x, v) : imps) file = if x == file then v else lookupImport imps file

-- Evaluate an expression
eval :: Environment -> Expr -> VarValue

eval env (IntLit x) = IntValue x
eval env TrueLit = BoolValue True
eval env FalseLit = BoolValue False
eval env (Var id) = lookupVar env id
eval env (TileDef x) = TileValue x

eval env (AddOp expr1 expr2) = IntValue $ evalInt env expr1 + evalInt env expr2
eval env (SubOp expr1 expr2) = IntValue $ evalInt env expr1 - evalInt env expr2
eval env (MulOp expr1 expr2) = IntValue $ evalInt env expr1 * evalInt env expr2
eval env (DivOp expr1 expr2) = IntValue $ evalInt env expr1 `div` evalInt env expr2
eval env (ModOp expr1 expr2) = IntValue $ evalInt env expr1 `mod` evalInt env expr2

eval env (GtOp expr1 expr2) = BoolValue $ evalInt env expr1 > evalInt env expr2
eval env (LtOp expr1 expr2) = BoolValue $ evalInt env expr1 < evalInt env expr2
eval env (GteOp expr1 expr2) = BoolValue $ evalInt env expr1 >= evalInt env expr2
eval env (LteOp expr1 expr2) = BoolValue $ evalInt env expr1 <= evalInt env expr2

eval env (AndOp expr1 expr2) = BoolValue $ evalBool env expr1 && evalBool env expr2
eval env (OrOp expr1 expr2) = BoolValue $ evalBool env expr2 || evalBool env expr2
eval env (NotOp expr) = BoolValue $ not $ evalBool env expr

eval env (EqOp expr1 expr2) = BoolValue $ eval env expr1 == eval env expr2
eval env (NeqOp expr1 expr2) = BoolValue $ eval env expr1 /= eval env expr2

eval env (HJoinOp expr1 expr2) = 
    if lh /= 0 && lh /= rh
        then error $ "Cannot horizontally join tiles of different heights. Left height: " ++ show lh ++ ". Right height: " ++ show rh
        else TileValue $ if lh == 0 then rTile else zipWith (++) lTile rTile
    where
        lTile = evalTile env expr1
        rTile = evalTile env expr2

        lh = length lTile
        rh = length rTile

eval env (VJoinOp expr1 expr2) = 
    if lw /= 0 && lw /= rw
        then error $ "Cannot vertically join tiles of different widths. Left width: " ++ show lw ++ ". Right width: " ++ show rw
        else TileValue $ lTile ++ rTile
    where
        lTile = evalTile env expr1
        rTile = evalTile env expr2

        lw = if null lTile then 0 else length $ head lTile
        rw = if null rTile then 0 else length $ head rTile

eval env (RotateOp expr1 expr2) = 
    if deg `notElem` [0, 90, 180, 270] 
        then error "Can only rotate a tile by a multiple of 90"
        else TileValue $ foldr (\_ acc -> transpose . reverse $ acc) tile [1..(deg `div` 90)]
    where 
        tile = evalTile env expr1
        deg = evalInt env expr2 `mod` 360

eval env (ScaleOp expr1 expr2) = 
    if factor <= 0 
        then error "Scale factor must be a positive integer"
        else TileValue $ concatMap (replicate factor . concatMap (replicate factor)) tile
    where
        tile = evalTile env expr1
        factor = evalInt env expr2

eval env (HReflectOp expr) = TileValue $ map reverse tile where tile = evalTile env expr
eval env (VReflectOp expr) = TileValue $ reverse tile where tile = evalTile env expr
eval env (BlankOp expr) = TileValue $ map (map (const 0)) tile where tile = evalTile env expr

eval env (TileAndOp expr1 expr2) = TileValue $ zipWith (zipWith (\a b -> boolToInt $ intToBool a && intToBool b)) lTile rTile
    where 
        lTile = evalTile env expr1
        rTile = evalTile env expr2

eval env (TileOrOp expr1 expr2) = TileValue $ zipWith (zipWith (\a b -> boolToInt $ intToBool a || intToBool b)) lTile rTile
    where 
        lTile = evalTile env expr1
        rTile = evalTile env expr2

eval env (TileNotOp expr) = TileValue $ map (map (\ c -> if c == 1 then 0 else 1)) tile
    where 
        tile = evalTile env expr

eval env (SnipOp expr1 expr2 expr3 expr4) =
    if col < 0 || row < 0
        then error "Snip start col and snip start row must be integers greater than 0"
        else TileValue $ map (takeFrom col size) $ takeFrom row size tile
    where
        tile = evalTile env expr1
        col = evalInt env expr2
        row = evalInt env expr3
        size = evalInt env expr4

        takeFrom ::  Int -> Int -> [a] -> [a]
        takeFrom n c xs = take c $ drop n xs 


evalInt :: Environment -> Expr -> Int
evalInt env expr = x where (IntValue x) = eval env expr

evalBool :: Environment -> Expr -> Bool
evalBool env expr = x where (BoolValue x) = eval env expr

evalTile :: Environment -> Expr -> [[Int]]
evalTile env expr = x where (TileValue x) = eval env expr

intToBool :: Int -> Bool
intToBool 1 = True
intToBool 0 = False

boolToInt :: Bool -> Int
boolToInt True = 1
boolToInt False = 0

-- Implement required interface

main :: IO ()
main = do
    args <- getArgs
    let filePath = head args
    src <- readFile filePath
    let ast = parse . alexScanTokens $ src

    -- Run type check and log errors
    let typeErrs = verify ast

    mapM_ putStrLn typeErrs

    -- If there is no errors, interpret
    
    when (null typeErrs) $ do

        -- First, we scan for imports
        let files = scanImports ast

        -- Then, read imports
        fileContents <- mapM (\file -> 
            do
                content <- readFile $ file ++ ".tl"
                return (file, content)) files

        -- Parse imports into tile values
        let imps = map (second parseTile) fileContents
        
        -- Execute (imports - environment (scope, out) - ast)
        let (_, out) = execute imps ([[]], []) ast

        mapM_ putStrLn out
