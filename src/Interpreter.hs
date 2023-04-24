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

eval :: Expr -> VarValue
eval (IntLit val) = IntValue val
