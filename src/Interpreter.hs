module Interpreter where

import Data.Map (Map)
import Data.Map qualified as Map

import Parser

type VarMap = Map String VarValue

data VarValue = IntValue Int | BoolValue Bool | TileValue -- need a data type here
  deriving (Show)

execute :: [Statement] -> VarMap
execute = undefined
