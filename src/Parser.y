{
module Parser where

import qualified Lexer
}

%name parse
%tokentype { Lexer.Token }
%error { parseError }

%token
    let         { Lexer.LetKw }
    for         { Lexer.ForKw }
    in          { Lexer.InKw }
    if          { Lexer.IfKw }
    else        { Lexer.ElseKw }

    print       { Lexer.PrintFn }

    '~'         { Lexer.RotateOp }
    '**'        { Lexer.ScaleOp }
    '++'        { Lexer.HJoinOp }
    '::'        { Lexer.VJoinOp }

    '=='        { Lexer.EqOp }
    '!='        { Lexer.NeqOp }
    '>'         { Lexer.GtOp }
    '<'         { Lexer.LtOp }
    '>='        { Lexer.GteOp }
    '<='        { Lexer.LteOp }

    '+'         { Lexer.AddOp }
    '-'         { Lexer.SubOp }
    '*'         { Lexer.MulOp }
    '/'         { Lexer.DivOp }
    '%'         { Lexer.ModOp }

    '&&'        { Lexer.AndOp }
    '||'        { Lexer.OrOp }
    '!'         { Lexer.NotOp }

    '='         { Lexer.AssignSym }
    '..'        { Lexer.RangeSym }
    '['         { Lexer.LBracketSym }
    ']'         { Lexer.RBracketSym }
    '('         { Lexer.LParenSym }
    ')'         { Lexer.RParenSym }
    '{'         { Lexer.LCurlySym }
    '}'         { Lexer.RCurlySym }

    true        { Lexer.TrueLit }
    false       { Lexer.FalseLit }
    int         { Lexer.IntLit $$ }
    id          { Lexer.Ident $$ }
  
%%

Program : Program Statement                                     { $2 : $1 }
    | {- empty -}                                               { [] }

Statement : VariableDeclaration                                 { $1 }
    | ForLoop                                                   { $1 }
    | IfStatement                                               { $1 } 
    | print Expression                                          { PrintStmt $2 }                           
    | Expression                                                { Expr $1 }

VariableDeclaration : let id '=' Expression                     { VarDecl $2 $4 }

ForLoop : for id in MathExpression '..' MathExpression Block    { ForLoop $2 $4 $6 $7 }

IfStatement : if BooleanExpression Block                        { IfStmt $2 $3 }
    | if BooleanExpression Block else Block                     { IfElseStmt $2 $3 $5 }

Expression : MathExpression                                     { MathExpr $1 }
    | TileExpression                                            { TileExpr $1 }
    | BooleanExpression                                         { BoolExpr $1 }

Block : '{' Program '}'                                         { $2 }

MathExpression : MathExpression '+' MathTerm                    { AddOp $1 $3 }
    | MathExpression '-' MathTerm                               { SubOp $1 $3 }
    | MathTerm                                                  { $1 }

MathTerm : MathTerm '*' Factor                                  { MulOp $1 $3 }
    | MathTerm '/' Factor                                       { DivOp $1 $3 }
    | MathTerm '%' Factor                                       { ModOp $1 $3 }
    | Factor                                                    { $1 }

Factor : int                                                    { IntLit $1 }
    | id                                                        { MathVar $1 }
    | '(' MathExpression ')'                                    { $2 }

TileExpression : TileExpression '++' TileTerm                   { HJoinOp $1 $3 }
    | TileExpression '::' TileTerm                              { VJoinOp $1 $3 }
    | TileTerm                                                  { $1 }

TileTerm : TileTerm '~' MathExpression                          { RotateOp $1 $3 }
    | TileTerm '**' MathExpression                              { ScaleOp $1 $3 }
    | TileTerm2                                                 { $1 }

TileTerm2 : '[' RowDefinitions ']'                              { TileDef $2 }
    | id                                                        { TileVar $1 }
    | '(' TileExpression ')'                                    { $2 }

RowDefinitions : RowDefinitions RowDefinition                   { $2 : $1 }
    | {- empty -}                                               { [] }

RowDefinition : '[' CellDefinitions ']'                         { $2 }

CellDefinitions : CellDefinitions CellDefinition                { $2 : $1 }
    | {- empty -}                                               { [] }

CellDefinition : int                                            { CellValue $1 }                                        
    | TileExpression                                            { CellExpr $1 }

BooleanExpression : BooleanExpression '&&' BooleanTerm          { AndOp $1 $3 }
    | BooleanExpression '||' BooleanTerm                        { OrOp $1 $3 }
    | BooleanTerm                                               { $1 }

BooleanTerm : '!' BooleanTerm2                                  { NotOp $2 }
    | Expression '==' Expression                                { EqOp $1 $3 }
    | Expression '!=' Expression                                { NeqOp $1 $3 }
    | MathExpression '>' MathExpression                         { GtOp $1 $3 }
    | MathExpression '<' MathExpression                         { LtOp $1 $3 }
    | MathExpression '>=' MathExpression                        { GteOp $1 $3 }
    | MathExpression '<=' MathExpression                        { LteOp $1 $3 }
    | BooleanTerm2                                              { $1 }

BooleanTerm2 : true                                             { TrueLit }
    | false                                                     { FalseLit }
    | id                                                        { BoolVar $1 }
    | '(' BooleanExpression ')'                                 { $2 }

{
parseError :: [Lexer.Token] -> a
parseError _ = error "Parse error"

data Statement = 
    VarDecl String Expr
    | ForLoop String MathExpr MathExpr [Statement]
    | IfStmt BoolExpr [Statement]
    | IfElseStmt BoolExpr [Statement] [Statement]
    | PrintStmt Expr
    | Expr Expr
    deriving Show

data Expr = 
    MathExpr MathExpr
    | TileExpr TileExpr
    | BoolExpr BoolExpr
    deriving Show

data MathExpr = 
    AddOp MathExpr MathExpr
    | SubOp MathExpr MathExpr
    | MulOp MathExpr MathExpr
    | DivOp MathExpr MathExpr
    | ModOp MathExpr MathExpr
    | IntLit Int
    | MathVar String
    deriving Show

data TileExpr = 
    HJoinOp TileExpr TileExpr
    | VJoinOp TileExpr TileExpr
    | RotateOp TileExpr TileExpr
    | ScaleOp TileExpr TileExpr
    | TileVar String
    | TileDef Matrix
    deriving Show

type Matrix = [[CellDef]]

data CellDef = 
    CellValue Int
    | CellExpr TileExpr
    deriving Show

data BoolExpr =
    AndOp BoolExpr BoolExpr
    | OrOp BoolExpr BoolExpr
    | NotOp BoolExpr
    | EqOp Expr Expr
    | NeqOp Expr Expr
    | GtOp MathExpr MathExpr
    | LtOp MathExpr MathExpr
    | GteOp MathExpr MathExpr
    | LteOp MathExpr MathExpr
    | TrueLit
    | FalseLit
    | BoolVar String
    deriving Show
}
