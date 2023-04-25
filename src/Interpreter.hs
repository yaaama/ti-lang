module Interpreter where

import Data.Map (Map)
import Data.Map qualified as Map
import Lexer (alexScanTokens)
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

testExpr :: String -> VarValue
testExpr input = evalExpr Map.empty (parseExpr input)
  where
    parseExpr :: String -> Expr
    parseExpr input = case parse . alexScanTokens $ input of
      [Expr e] -> e
      _ -> error "Invalid input"

-- Testing expressions with this in GHCi
-- evalExpr Map.empty (parseExpr "1 + 2")

-- let parseExpr input = case parse . alexScanTokens $ input of
--                        [Expr e] -> e
--                        _ -> error "Invalid input"

-- Evaluates an integer expression
-- evalInt :: Expr -> Int
--
---- Math operators
---- evalInt (1 + 2) * (2 + 1)
---- evalInt (1 + 2) * evalInt (2 + 1)
---- (evalInt 1 + evalInt 2) * (evalInt 2 + evalInt 1)
---- (1 + 2) * (2 + 1)
---- 3 * 3
---- 9
--
-- evalInt (IntLit val) = val
-- evalInt (AddOp expr1 expr2) = evalInt expr1 + evalInt expr2
-- evalInt (SubOp expr1 expr2) = evalInt expr1 - evalInt expr2
-- evalInt (MulOp expr1 expr2) = evalInt expr1 * evalInt expr2
-- evalInt (DivOp expr1 expr2) = evalInt expr1 `div` evalInt expr2
-- evalInt (ModOp expr1 expr2) = evalInt expr1 `mod` evalInt expr2
--
---- ...
--
-- evalBool :: Expr -> Bool
-- evalBool TrueLit = True
-- evalBool FalseLit = False
-- evalBool (AndOp expr1 expr2) = evalBool expr1 && evalBool expr2
-- evalBool (OrOp expr1 expr2) = evalBool expr1 || evalBool expr2
