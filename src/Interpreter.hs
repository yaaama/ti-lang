module Interpreter where

import Control.Monad (mapM_, when)
import Data.Bifunctor (Bifunctor(second))
import System.Environment (getArgs)

import Lexer (alexScanTokens)
import Parser
import TypeChecker (verify)
import Data.Text (splitOn)

-- Main

type Scope = [(String, VarValue)]
type Imports = [(String, VarValue)]
type Environment = ([Scope], [String])              -- Environment includes scopes (innermost first) and output strings

data Tile = Black | White | Tile [Tile] deriving (Show, Eq)
data VarValue = IntValue Int | BoolValue Bool | TileValue Tile deriving (Eq)

-- Scan top-level imports statically
scanImports :: [Statement] -> [String]
scanImports = foldr (\stmt acc -> acc ++ getFile stmt) []
    where 
        getFile :: Statement -> [String]
        getFile (ImportStmt file _) = [file]
        getFile _ = []

-- Parses a tile value if given a string representation of a tile
parseTile :: String -> VarValue
parseTile input = TileValue $ Tile $ map parseLine $ lines input
    where
        parseLine :: String -> Tile
        parseLine = Tile . map (toTileValue . read) . words

        toTileValue :: Int -> Tile
        toTileValue 0 = White
        toTileValue 1 = Black

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

executeStmt imps env@(scope : scopes, out) (VarDecl id expr) = (((id, eval env expr) : scope) : scopes, out)
executeStmt imps env (VarAssign id expr) = bind env [] (id, eval env expr)

executeStmt imps env@(scopes, out) (ForLoop id expr1 expr2 stmts) = restore env2
    where 
        (IntValue start) = eval env expr1
        (IntValue end) = eval env expr2

        env2 = 
            foldl (\env i -> execute imps (bind env [] (id, IntValue i)) stmts)         -- For each iteration, update the counter variable
                ([] : scopes, out) [start..end]                                         -- Add a new scope

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
        unparseValue (TileValue x) = show x

executeStmt imps (scope : scopes, out) (ImportStmt file id) = (((id, lookupImport imps file) : scope) : scopes, out)
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
eval env (TileDef exprs) = TileValue $ Tile $ map (makeTile . eval env) exprs
    where 
        makeTile :: VarValue -> Tile
        makeTile v = case v of
            IntValue 0 -> White
            IntValue 1 -> Black
            TileValue tile -> tile
            _ -> error "Invalid tile definition. Each value must be either 0, 1 or evaluate to 0 or 1"

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

eval env (HJoinOp expr1 expr2) = undefined
eval env (VJoinOp expr1 expr2) = undefined
eval env (RotateOp expr1 expr2) = undefined
eval env (ScaleOp expr1 expr2) = undefined

evalInt :: Environment -> Expr -> Int
evalInt env expr = x where (IntValue x) = eval env expr

evalBool :: Environment -> Expr -> Bool
evalBool env expr = x where (BoolValue x) = eval env expr

evalTile :: Environment -> Expr -> Tile
evalTile env expr = x where (TileValue x) = eval env expr

-- Implement required interface

main :: IO ()
main = do
    args <- getArgs
    let filePath = head args
    src <- readFile filePath
    let ast = parse . alexScanTokens $ src

    -- Run type check and log errors
    let typeErrs = verify ast
    mapM_ putStr typeErrs

    -- If there is no errors, interpret
    
    when (null typeErrs) $ do

        -- First, we scan for imports
        let files = scanImports ast

        print files

        -- Then, read imports
        fileContents <- mapM (\file -> 
            do
                content <- readFile $ file ++ ".tl"
                return (file, content)) files

        -- Parse imports into tile values
        let imps = map (second parseTile) fileContents
        
        -- Execute (imports - environment (scope, out) - ast)
        let (_, out) = execute imps ([[]], []) ast

        mapM_ putStr out
