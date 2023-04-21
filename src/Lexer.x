{
module Lexer where
}

%wrapper "basic"

$digit = 0-9
$alpha = [a-zA-Z]
$alphanum = [$alpha $digit]

tokens :-

$white+;
\/\/.*;

-- Keywords

let                 { \_ -> KwLet }
for                 { \_ -> KwFor }
in                  { \_ -> KwIn }
if                  { \_ -> KwIf }
else                { \_ -> KwElse }

-- Built in operations

rotate              { \_ -> OpRotate }
scale               { \_ -> OpScale }
hjoin               { \_ -> OpHJoin }
vjoin               { \_ -> OpVJoin }
tile                { \_ -> OpTile }
print               { \_ -> OpPrint }

-- Symbols

-- Comparisons

==                  { \_ -> SymEq }
!=                  { \_ -> SymNeq }
>                   { \_ -> SymGt }
<                   { \_ -> SymLt }
>=                  { \_ -> SymGte }
<=                  { \_ -> SymLte }

-- Maths

\+                  { \_ -> SymAdd }
\-                  { \_ -> SymSub }
\*                  { \_ -> SymMul }
\/                  { \_ -> SymDiv }
%                   { \_ -> SymMod }

-- Boolean

&&                  { \_ -> SymAnd }
\|\|                { \_ -> SymOr }
!                   { \_ -> SymNot }

-- Misc

:                   { \_ -> SymColon }
=                   { \_ -> SymAssign }
\,                  { \_ -> SymComma }
\.\.                { \_ -> SymRange }
\[                  { \_ -> SymLBracket }
\]                  { \_ -> SymRBracket }
\(                  { \_ -> SymLParen }
\)                  { \_ -> SymRParen }
\{                  { \_ -> SymLCurly }
\}                  { \_ -> SymRCurly }

-- Literals

true                { \_ -> LitTrue }
false               { \_ -> LitFalse }
$digit+             { \s -> LitInt (read s) }

-- Identifier

$alpha $alphanum*   { \s -> Ident s }

{

data Token = KwLet
    | KwFor
    | KwIn
    | KwIf
    | KwElse
    | OpRotate
    | OpScale
    | OpHJoin
    | OpVJoin
    | OpTile
    | OpPrint
    | LitTrue
    | LitFalse
    | LitInt Int
    | SymEq
    | SymNeq
    | SymGt
    | SymLt
    | SymGte
    | SymLte
    | SymAdd
    | SymSub
    | SymMul
    | SymDiv
    | SymMod
    | SymAnd
    | SymOr
    | SymNot
    | SymColon
    | SymAssign
    | SymComma
    | SymRange
    | SymLBracket
    | SymRBracket
    | SymLParen
    | SymRParen
    | SymLCurly
    | SymRCurly
    | Ident String
    deriving (Show)
    
}
