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

-- Order of precendence
-- 1. && || (left)
-- 2. == != (left)
-- 3. > < >= <= (non-assoc)
-- 4. + - (left)
-- 5. * / % (left)
-- 6. ++ :: (left)
-- 7. ~ ** (left)
-- 8. ! 
-- 9. ()

%left '&&' '||'
%nonassoc '==' '!=' '>' '<' '>=' '<='
%left '+' '-'
%left '*' '/' '%'
%left '++' '::'
%left '~' '**'
%right '!'

%%

Program : Program Statement                                     { $2 : $1 }
    | {- empty -}                                               { [] }

Statement : VariableDeclaration                                 { $1 }
    | ForLoop                                                   { $1 }
    | IfStatement                                               { $1 } 
    | print Expression                                          { PrintStmt $2 }                           
    | Expression                                                { Expr $1 }

VariableDeclaration : let id '=' Expression                     { VarDecl $2 $4 }

ForLoop : for id in Expression '..' Expression Block            { ForLoop $2 $4 $6 $7 }

IfStatement : if Expression Block                               { IfStmt $2 $3 }
    | if Expression Block else Block                            { IfElseStmt $2 $3 $5 }

Block : '{' Program '}'                                         { $2 }

Expression : Expression '&&' Expression                         { AndOp $1 $3 }                 
    | Expression '||' Expression                                { OrOp $1 $3 }
    | Expression '==' Expression                                { EqOp $1 $3 }
    | Expression '!=' Expression                                { NeqOp $1 $3 }
    | Expression '>' Expression                                 { GtOp $1 $3 }
    | Expression '<' Expression                                 { LtOp $1 $3 }
    | Expression '>=' Expression                                { GteOp $1 $3 }
    | Expression '<=' Expression                                { LteOp $1 $3 }
    | Expression '+' Expression                                 { AddOp $1 $3 }
    | Expression '-' Expression                                 { SubOp $1 $3 }
    | Expression '*' Expression                                 { MulOp $1 $3 }
    | Expression '/' Expression                                 { DivOp $1 $3 }
    | Expression '%' Expression                                 { ModOp $1 $3 }
    | Expression '++' Expression                                { HJoinOp $1 $3 }
    | Expression '::' Expression                                { VJoinOp $1 $3 }
    | Expression '~' Expression                                 { RotateOp $1 $3 }
    | Expression '**' Expression                                { ScaleOp $1 $3 }
    | '!' Expression                                            { NotOp $2 }
    | '(' Expression ')'                                        { $2 }
    | id                                                        { Var $1 }
    | int                                                       { IntLit $1 }
    | true                                                      { TrueLit }
    | false                                                     { FalseLit }
    | TileDefinition                                            { TileDef $1 }

TileDefinition : '[' RowDefinitions ']'                         { $2 }

RowDefinitions : RowDefinitions Expression                      { $2 : $1 }
    | {- empty -}                                               { [] }

{
parseError :: [Lexer.Token] -> a
parseError _ = error "Parse error"

data Statement = 
    VarDecl String Expr
    | ForLoop String Expr Expr [Statement]
    | IfStmt Expr [Statement]
    | IfElseStmt Expr [Statement] [Statement]
    | PrintStmt Expr
    | Expr Expr
    deriving Show

data Expr = 
     AddOp Expr Expr
    | SubOp Expr Expr
    | MulOp Expr Expr
    | DivOp Expr Expr
    | ModOp Expr Expr
    | IntLit Int
    | AndOp Expr Expr
    | OrOp Expr Expr
    | NotOp Expr
    | EqOp Expr Expr
    | NeqOp Expr Expr
    | GtOp Expr Expr
    | LtOp Expr Expr
    | GteOp Expr Expr
    | LteOp Expr Expr
    | HJoinOp Expr Expr
    | VJoinOp Expr Expr
    | RotateOp Expr Expr
    | ScaleOp Expr Expr
    | TileDef [Expr]
    | TrueLit
    | FalseLit
    | Var String
    deriving Show
}
