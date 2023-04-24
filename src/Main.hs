module Main where

import Interpreter
import Lexer (alexScanTokens)
import Parser (parse)
import System.Environment (getArgs)

main :: IO ()
main = do
  args <- getArgs
  let filePath = head args
  src <- readFile filePath
  print $ parse . alexScanTokens $ src