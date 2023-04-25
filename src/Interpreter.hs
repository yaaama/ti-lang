module Interpreter where

import Data.Map (Map)
import Data.Map qualified as Map
import Parser

type VarMap = Map String VarValue

data VarValue = IntValue Int | BoolValue Bool | TileValue -- need a data type here
  deriving (Show)

execute :: [Statement] -> VarMap
execute = foldr execute' varMap
  where
    varMap = Map.empty

execute' :: Statement -> VarMap -> VarMap
execute' (VarDecl id expr) varMap =
  if Map.member id varMap
    then error $ "Identifier " ++ id ++ " has already been defined"
    else Map.insert id (eval expr) varMap

execute' (VarAssign id expr) varMap =
  if Map.notMember id varMap
    then error $ "Identifier " ++ id ++ " is not defined"
    else Map.insert id (eval expr) varMap

-- Evaluates an expression

evalInt :: Expr -> Int

-- Math operators
-- evalInt (1 + 2) * (2 + 1)
-- evalInt (1 + 2) * evalInt (2 + 1)
-- (evalInt 1 + evalInt 2) * (evalInt 2 + evalInt 1)
-- (1 + 2) * (2 + 1)
-- 3 * 3
-- 9

evalInt (IntLit val) = val
evalInt (AddOp expr1 expr2) = evalInt expr1 + evalInt expr2
evalInt (SubOp expr1 expr2) = evalInt expr1 - evalInt expr2
-- ...

evalBool :: Expr -> Bool
evalBool TrueLit = True
evalBool FalseLit = False
evalBool (AndOp expr1 expr2) = evalBool expr1 && evalBool expr2
