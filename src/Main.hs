module Main where

import Control.Monad (mapM_)
import System.Environment (getArgs)

import Interpreter
import Lexer (alexScanTokens)
import Parser (parse)
import TypeChecker (verify)

main :: IO ()
main = do
  args <- getArgs
  let filePath = head args
  src <- readFile filePath
  let typeErrs = verify . parse . alexScanTokens $ src
  mapM_ print typeErrs