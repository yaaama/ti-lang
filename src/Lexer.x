{
module Lexer where
}

%wrapper "basic"

$digit = 0-9
$alpha = [a-zA-Z]
$id = [$alpha \_ $digit]

tokens :-

$white+;
\/\/.*;

-- Keywords

let                 { \_ -> LetKw }
for                 { \_ -> ForKw }
in                  { \_ -> InKw }
if                  { \_ -> IfKw }
else                { \_ -> ElseKw }

-- Built in functions

print               { \_ -> PrintFn }

-- Ops

-- Tiles

\~                  { \_ -> RotateOp }
\*\*                { \_ -> ScaleOp }
\+\+                { \_ -> HJoinOp }
::                  { \_ -> VJoinOp }

-- Comparisons

==                  { \_ -> EqOp }
!=                  { \_ -> NeqOp }
>                   { \_ -> GtOp }
\<                  { \_ -> LtOp }
>=                  { \_ -> GteOp }
\<=                 { \_ -> LteOp }

-- Maths

\+                  { \_ -> AddOp }
\-                  { \_ -> SubOp }
\*                  { \_ -> MulOp }
\/                  { \_ -> DivOp }
\%                   { \_ -> ModOp }

-- Boolean

&&                  { \_ -> AndOp }
\|\|                { \_ -> OrOp }
!                   { \_ -> NotOp }

-- Symbols

=                   { \_ -> AssignSym }
\.\.                { \_ -> RangeSym }
\[                  { \_ -> LBracketSym }
\]                  { \_ -> RBracketSym }
\(                  { \_ -> LParenSym }
\)                  { \_ -> RParenSym }
\{                  { \_ -> LCurlySym }
\}                  { \_ -> RCurlySym }

-- Literals

true                { \_ -> TrueLit }
false               { \_ -> FalseLit }
$digit+             { \s -> IntLit (read s) }

-- Identifier

$alpha $id*   { \s -> Ident s }

{

data Token = 
    LetKw
    | ForKw
    | InKw
    | IfKw
    | ElseKw
    | PrintFn
    | TrueLit
    | FalseLit
    | IntLit Int
    | RotateOp
    | ScaleOp
    | HJoinOp
    | VJoinOp
    | EqOp
    | NeqOp
    | GtOp
    | LtOp
    | GteOp
    | LteOp
    | AddOp
    | SubOp
    | MulOp
    | DivOp
    | ModOp
    | AndOp
    | OrOp
    | NotOp
    | AssignSym
    | RangeSym
    | LBracketSym
    | RBracketSym
    | LParenSym
    | RParenSym
    | LCurlySym
    | RCurlySym
    | Ident String
    deriving Show
}
