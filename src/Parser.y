{
module Parser where

import Lexer
}

%name langParser
%tokentype { Token }
%error { parseError }

%token
      tile                 { Token.Tile }
      let                  { Token.Let }
      for                  { Token.For }
      in                   { Token.In }
      print                { Token.Print }
      rotate               { Token.Rotate }
      hjoin                { Token.HJoin }
      vjoin                { Token.VJoin }
      true                 { Token.TTrue }
      false                { Token.TFalse }
      if                   { Token.If }
      else                 { Token.Else }
      eq                   { Token.Eq }
      neq                  { Token.NEq }
      gt                   { Token.GT }
      lt                   { Token.LT }
      gte                  { Token.GTE }
      lte                  { Token.LTE }
      add                  { Token.Add }
      sub                  { Token.Sub }
      mul                  { Token.Mul }
      div                  { Token.Div }
      mod                  { Token.Mod }
      and                  { Token.And }
      or                   { Token.Or }
      not                  { Token.Not }
      colon                { Token.Colon }
      assign               { Token.Assign }
      comma                { Token.Comma }
      dot                  { Token.Dot }
      lbracket             { Token.LBracket }
      rbracket             { Token.RBracket }
      lparen               { Token.LParen }
      rparen               { Token.RParen }
      lcurly               { Token.LCurly }
      rcurly               { Token.RCurly }
      int                  { Token.Int $$ }
      ident                { Token.Ident $$ }

%%

Program : Statement Program          { $1 : $2 }
         | {- empty -}               { [] }

Statement : TileDeclaration           { $1 }
           | LetDeclaration           { $1 }
           | ForLoop                  { $1 }
           | PrintStatement           { $1 }
           | RotateStatement          { $1 }
           | JoinStatement            { $1 }
           | IfStatement              { $1 }
           | Expression               { $1 }

TileDeclaration : tile ident lcurly Matrix rcurly    { TileDecl $2 $4 }

LetDeclaration : let ident assign Expression          { LetDecl $2 $4 }

ForLoop : for ident in Expression dot dot Expression Block    { ForLoop $2 $4 $6 $7 }

PrintStatement : print Expression     { PrintStmt $2 }

RotateStatement : rotate Expression    { RotateStmt $2 }

JoinStatement : hjoin Expression Expression    { HJoinStmt $2 $3 }
              | vjoin Expression Expression    { VJoinStmt $2 $3 }

IfStatement : if Expression Block else Block    { IfStmt $2 $3 $5 }

Block : lcurly Program rcurly    { $2 }

Expression : Term Expr    { Expr $1 $2 }

Expr : add Term Expr     { Add $2 : $3 }
      | sub Term Expr     { Sub $2 : $3 }
      | {- empty -}        { [] }

Term : Factor Term    { Term $1 $2 }

Term : mul Factor Term    { Mul $2 : $3 }
      | div Factor Term    { Div $2 : $3 }
      | mod Factor Term    { Mod $2 : $3 }
      | {- empty -}         { [] }

Factor : ident           { Var $1 }
       | int             { Int $1 }
       | Boolean         { Bool $1 }
       | Comparison      { Comp $1 }
       | lparen Expression rparen    { Parens $2 }
       | not Factor                  { Not $2 }

Boolean : true   { True }
        | false  { False }

Comparison : Expression ComparisonOp Expression    { Comparison $2 $1 $3 }

ComparisonOp : eq  { Eq }
             | neq { NEq }
             | gt  { GT }
             | lt  { LT }
             | gte { GTE }
             | lte { LTE }

Matrix : Row Matrix   { $1 : $2 }
       | {- empty -}  { [] }

Row : lbracket Elements rbracket    { $2 }

Elements : Expression Elements     { $1 : $2 }
          | {- empty -}             { [] }

Elements : comma Expression Elements    { $2 : $3 }
          | {- empty -}                 { [] }

{
parseError :: [Token] -> a
parseError _ = error "Parse error"

data Statement
  = TileDecl String [[Expression]]
  | LetDecl String Expression
  | ForLoop String Expression Expression [Statement]
  | PrintStmt Expression
  | RotateStmt Expression
  | HJoinStmt Expression Expression
  | VJoinStmt Expression Expression
  | IfStmt Expression [Statement] [Statement]
  | Expr Term [Expr]
  deriving (Show, Eq)

data Term
  = Term Factor [Term]
  deriving (Show, Eq)

data Expr
  = Add Expression
  | Sub Expression
  deriving (Show, Eq)

data Term
  = Mul Expression
  | Div Expression
  | Mod Expression
  deriving (Show, Eq)

data Factor
  = Var String
  | Int Int
  | Bool Bool
  | Comp Comparison
  | Parens Expression
  | Not Factor
  deriving (Show, Eq)

data Comparison
  = Comparison ComparisonOp Expression Expression
  deriving (Show, Eq)

data ComparisonOp = Eq | NEq | GT | LT | GTE | LTE
  deriving (Show, Eq)

type Expression = Statement
}
