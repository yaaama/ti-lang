module Main where
import System.Environment (getArgs)
import Parser (parse)
import Lexer (alexScanTokens)
import Interpreter

main :: IO ()
main = do
    args <- getArgs
    let filePath = head args
    src <- readFile filePath
    print $ parse . alexScanTokens $ src
    