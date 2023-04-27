module Interpreter2 where

import Data.Map (Map)
import Data.Map qualified as Map
import Debug.Trace
import Lexer (Token, alexScanTokens)
import Parser

type VarMap = Map String VarValue

data VarValue = IntValue Int | BoolValue Bool | TileValue -- need a data type here
  deriving (Show, Eq)

execute :: [Statement] -> VarMap
execute = foldr execute' Map.empty

execute' :: Statement -> VarMap -> VarMap
execute' (VarDecl id expr) varMap =
  if Map.member id varMap
    then error $ "Identifier " ++ id ++ " has already been defined"
    else Map.insert id (evalExpr varMap expr) varMap
execute' (VarAssign id expr) varMap =
  if Map.notMember id varMap
    then error $ "Identifier " ++ id ++ " is not defined"
    else Map.insert id (evalExpr varMap expr) varMap
execute' (IfStmt condExpr trueStmts falseStmts) varMap =
  executeIf varMap condExpr trueStmts falseStmts
execute' (ForLoop id startExpr endExpr loopStmts) varMap =
  executeFor varMap id startExpr endExpr loopStmts

executeIf :: VarMap -> Expr -> [Statement] -> [Statement] -> VarMap
executeIf varMap condExpr trueStmts falseStmts =
  case evalExpr varMap condExpr of
    BoolValue True -> execute (trueStmts ++ [VarAssign "state" (Var "state")])
    BoolValue False -> execute (falseStmts ++ [VarAssign "state" (Var "state")])
    _ -> error "If condition should be a boolean expression"

executeFor :: VarMap -> String -> Expr -> Expr -> [Statement] -> VarMap
executeFor varMap id startExpr endExpr loopStmts =
  case (evalExpr varMap startExpr, evalExpr varMap endExpr) of
    (IntValue startVal, IntValue endVal) ->
      foldr executeLoop varMap [startVal .. endVal]
    _ -> error "For loop start and end should be integers"
  where
    executeLoop iterVal varMap =
      let varMapWithIter = Map.insert id (IntValue iterVal) varMap
          updatedVarMap = execute (loopStmts ++ [VarAssign "state" (Var "state")])
       in Map.delete id updatedVarMap

-- Will check for variable binding
lookupVar :: VarMap -> String -> VarValue
lookupVar var x = case Map.lookup x var of
  Just v -> v
  Nothing -> error $ "Unbound variable! " ++ x

-- Main function to evaluate expressions
evalExpr :: VarMap -> Expr -> VarValue
-- Literals
evalExpr varm (IntLit val) = IntValue val
evalExpr varm TrueLit = BoolValue True
evalExpr varm FalseLit = BoolValue False
evalExpr varm (Var x) = lookupVar varm x
-- Math operations
evalExpr varm (AddOp expr1 expr2) = evalMathOp varm (+) expr1 expr2
evalExpr varm (SubOp expr1 expr2) = evalMathOp varm (-) expr1 expr2
evalExpr varm (MulOp expr1 expr2) = evalMathOp varm (*) expr1 expr2
evalExpr varm (DivOp expr1 expr2) = evalMathOp varm div expr1 expr2
evalExpr varm (ModOp expr1 expr2) = evalMathOp varm mod expr1 expr2
-- Boolean operations
evalExpr varm (AndOp expr1 expr2) = evalBoolOp varm (&&) expr1 expr2
evalExpr varm (OrOp expr1 expr2) = evalBoolOp varm (||) expr1 expr2
evalExpr varm (NotOp expr) = evalNotOp varm expr
-- Comparison operators
evalExpr varm (EqOp expr1 expr2) = evalEqOp varm expr1 expr2
evalExpr varm (NeqOp expr1 expr2) = evalNeqOp varm expr1 expr2
evalExpr varm (GtOp expr1 expr2) = evalGtOp varm expr1 expr2
evalExpr varm (LtOp expr1 expr2) = evalLtOp varm expr1 expr2
evalExpr varm (GteOp expr1 expr2) = evalGteOp varm expr1 expr2
evalExpr varm (LteOp expr1 expr2) = evalLteOp varm expr1 expr2

-- Functions to evaluate the comparison operators
evalEqOp, evalNeqOp, evalGtOp, evalLtOp, evalGteOp, evalLteOp :: VarMap -> Expr -> Expr -> VarValue
evalEqOp varm expr1 expr2 = BoolValue (evalExpr varm expr1 == evalExpr varm expr2)
evalNeqOp varm expr1 expr2 = BoolValue (evalExpr varm expr1 /= evalExpr varm expr2)
evalGtOp varm = evalCompOp varm (>)
evalLtOp varm = evalCompOp varm (<)
evalGteOp varm = evalCompOp varm (>=)
evalLteOp varm = evalCompOp varm (<=)

evalCompOp :: VarMap -> (Int -> Int -> Bool) -> Expr -> Expr -> VarValue
evalCompOp varm op expr1 expr2 =
  case (evalExpr varm expr1, evalExpr varm expr2) of
    (IntValue v1, IntValue v2) -> BoolValue (op v1 v2)
    _ -> error "Both operands should be integers for comparison operations"

-- Function to handle math operations
evalMathOp :: VarMap -> (Int -> Int -> Int) -> Expr -> Expr -> VarValue
evalMathOp varm op expr1 expr2 =
  case (evalExpr varm expr1, evalExpr varm expr2) of
    (IntValue v1, IntValue v2) -> IntValue (op v1 v2)
    _ -> error "Both operands should be integers for math operations"

-- Evaluates boolean operation
evalBoolOp :: VarMap -> (Bool -> Bool -> Bool) -> Expr -> Expr -> VarValue
evalBoolOp varm op expr1 expr2 =
  case (evalExpr varm expr1, evalExpr varm expr2) of
    (BoolValue v1, BoolValue v2) -> BoolValue (op v1 v2)
    _ -> error "Both operands should be booleans for boolean operations"

-- Evaluates the NOT operator
evalNotOp :: VarMap -> Expr -> VarValue
evalNotOp varm expr =
  case evalExpr varm expr of
    BoolValue v -> BoolValue (not v)
    _ -> error "Operand should be a boolean for the 'not' operator"

-- Can test statements using this in GHCI
-- runProgram "let x = 10"
runProgram :: String -> VarMap
runProgram input = execute (parse . alexScanTokens $ input)

-- Testing expressions in Ghci
testEvalExpr :: String -> VarValue
testEvalExpr input =
  let tokens = alexScanTokens input
      expr = case parse tokens of
        [Expr e] -> e
        _ -> error $ "Invalid input: " ++ show tokens
   in evalExpr Map.empty expr

-- Lets you test the lexer
testLexer :: String -> [Lexer.Token]
testLexer = alexScanTokens

-- Testing parser
testParser :: String -> [Statement]
testParser input =
  let tokens = alexScanTokens input
   in parse tokens

main :: IO ()
main = do
  let program =
        unlines
          [ "let sum = 0",
            "",
            " sum = sum + 1"
          ]
  print $ runProgram program
