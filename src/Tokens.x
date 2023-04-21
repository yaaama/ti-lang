{
module Lexer where

import Data.Char (isSpace, isAlpha, isDigit)
}

%wrapper "basic"

$digit = 0-9
$alpha = [a-zA-Z]
$alphanum = [$alpha $digit]

tokens :-

$white+              ;
"//" .*              ;
tile                 { \_ -> Tile }
let                  { \_ -> Let }
for                  { \_ -> For }
in                   { \_ -> In }
print                { \_ -> Print }
rotate               { \_ -> Rotate }
hjoin                { \_ -> HJoin }
vjoin                { \_ -> VJoin }
true                 { \_ -> TTrue }
false                { \_ -> TFalse }
if                   { \_ -> If }
else                 { \_ -> Else }
==                   { \_ -> Eq }
!=                   { \_ -> NEq }
>                    { \_ -> GT }
\<                    { \_ -> LT }
\>=                   { \_ -> GTE }
\<=                   { \_ -> LTE }
\+                    { \_ -> Add }
\-                    { \_ -> Sub }
\*                    { \_ -> Mul }
\/                    { \_ -> Div }
\%                    { \_ -> Mod }
\&&                   { \_ -> And }
\|\|                   { \_ -> Or }
\!                    { \_ -> Not }
\:                    { \_ -> Colon }
\=                    { \_ -> Assign }
\,                    { \_ -> Comma }
\.                    { \_ -> Dot }
\[                    { \_ -> LBracket }
\]                    { \_ -> RBracket }
\(                    { \_ -> LParen }
\)                    { \_ -> RParen }
"{"                    { \_ -> LCurly }
"}"                    { \_ -> RCurly }
$digit+                { \s -> Int (read s) }
$alpha $alphanum*      { \s -> Ident s }

{

data Token =
      Tile
    | Let
    | For
    | In
    | Print
    | Rotate
    | HJoin
    | VJoin
    | TTrue
    | TFalse
    | If
    | Else
    | Eq
    | NEq
    | GT
    | LT
    | GTE
    | LTE
    | Add
    | Sub
    | Mul
    | Div
    | Mod
    | And
    | Or
    | Not
    | Colon
    | Assign
    | Comma
    | Dot
    | LBracket
    | RBracket
    | LParen
    | RParen
    | LCurly
    | RCurly
    | Int Int
    | Ident String
    deriving (Eq, Show)
}
