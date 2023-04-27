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
    output      { Lexer.OutputKw }
    import      { Lexer.ImportKw }
    as          { Lexer.AsKw }


    -- Tile operators

    '~'         { Lexer.RotateOp }
    '**'        { Lexer.ScaleOp }
    '++'        { Lexer.HJoinOp }
    '::'        { Lexer.VJoinOp }
    '<>'        { Lexer.HReflectOp }
    '^^'        { Lexer.VReflectOp }
    '#'         { Lexer.BlankOp }
    '&'         { Lexer.TileAndOp }
    '|'         { Lexer.TileOrOp }
    '?'         { Lexer.TileNotOp }

    -- Comparison operators

    '=='        { Lexer.EqOp }
    '!='        { Lexer.NeqOp }
    '>'         { Lexer.GtOp }
    '<'         { Lexer.LtOp }
    '>='        { Lexer.GteOp }
    '<='        { Lexer.LteOp }

    -- Math operators

    '+'         { Lexer.AddOp }
    '-'         { Lexer.SubOp }
    '*'         { Lexer.MulOp }
    '/'         { Lexer.DivOp }
    '%'         { Lexer.ModOp }

    -- Boolean operators
    
    '&&'        { Lexer.AndOp }
    '||'        { Lexer.OrOp }
    '!'         { Lexer.NotOp }

    '='         { Lexer.AssignSym }
    '"'         { Lexer.QuoteSym }
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
%left '++' '::' '&' '|'
%left '~' '**'
%right '<>' '^^' '#' '?'
%right '!'

%%

Program : Program StatementOrExpr                               { $2 : $1 }         -- Program will be in reverse, but we can use foldr to interpret
    | {- empty -}                                               { [] }

StatementOrExpr : VariableAssignment                            { $1 }
    | ForLoop                                                   { $1 }
    | IfStatement                                               { $1 } 
    | ImportStatement                                           { $1 }
    | OutputStatement                                           { $1 }

OutputStatement : output Expression                             { OutputStmt $2 }

ImportStatement : import '"' id '"' as id                       { ImportStmt $3 $6 }

VariableAssignment : let id '=' Expression                      { VarDecl $2 $4 }
    | id '=' Expression                                         { VarAssign $1 $3 }

ForLoop : for id in Expression '..' Expression Block            { ForLoop $2 $4 $6 $7 }

IfStatement : if Expression Block                               { IfStmt $2 $3 [] }
    | if Expression Block else Block                            { IfStmt $2 $3 $5 }

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
    | Expression '&' Expression                                 { TileAndOp $1 $3 }
    | Expression '|' Expression                                 { TileOrOp $1 $3 }
    | '?' Expression                                            { TileNotOp $2 }
    | '<>' Expression                                           { HReflectOp $2 }
    | '^^' Expression                                           { VReflectOp $2 }
    | '#' Expression                                            { BlankOp $2 }
    | '!' Expression                                            { NotOp $2 }
    | '(' Expression ')'                                        { $2 }
    | id                                                        { Var $1 }
    | int                                                       { IntLit $1 }
    | true                                                      { TrueLit }
    | false                                                     { FalseLit }
    | TileDefinition                                            { TileDef $1 }

TileDefinition : '[' RowDefinitions ']'                         { $2 }

RowDefinitions : RowDefinitions RowDefinition                   { $1 ++ [$2] }
    | {- empty -}                                               { [] }

RowDefinition : '[' Ints ']'                                    { $2 }

Ints : Ints int                                                 { $1 ++ [$2] }
    | int                                                       { [$1] }

{
parseError :: [Lexer.Token] -> a
parseError _ = error "Parse error"

data Statement = 
    VarDecl String Expr
    | VarAssign String Expr
    | ForLoop String Expr Expr [Statement]
    | IfStmt Expr [Statement] [Statement]
    | OutputStmt Expr
    | ImportStmt String String
    deriving (Show)

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
    | HReflectOp Expr
    | VReflectOp Expr
    | BlankOp Expr
    | TileAndOp Expr Expr
    | TileOrOp Expr Expr
    | TileNotOp Expr
    | TileDef [[Int]]
    | TrueLit
    | FalseLit
    | Var String
    deriving (Show)
}
