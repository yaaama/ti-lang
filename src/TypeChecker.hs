module TypeChecker where

import Control.Monad (when, foldM, unless)
import Control.Monad.Trans.Writer (Writer, tell, runWriter)

import Parser

type TypeEnv = [(String, VarType)]
data VarType = IntType | TileType | BoolType | Undefined deriving (Eq)

unparseType :: VarType -> String
unparseType IntType = "Int"
unparseType TileType = "Tile"
unparseType BoolType = "Bool"

verify :: [Statement] -> [String]
verify stmts = errs where (_, errs) = runWriter (verifyBlock [] stmts)

verifyBlock :: TypeEnv -> [Statement] -> Writer [String] TypeEnv
verifyBlock env = foldr (
    \stmt acc -> do
        env <- acc
        verifyStmt env stmt) $ return env

getBinding :: TypeEnv -> String -> Writer [String] VarType
getBinding [] id = do
    tell ["Variable " ++ id ++ " has not been declared"]
    return Undefined
getBinding ((x, t) : env) id = if id == x then return t else getBinding env id

addBinding :: TypeEnv -> (String, VarType) -> Writer [String] TypeEnv
addBinding env (id, t) = if isDeclared env id 
    then do
        tell ["Variable " ++ id ++ " has already been declared"]
        return env
    else return ((id, t) : env)
    where 
        isDeclared :: TypeEnv -> String -> Bool
        isDeclared [] id = False
        isDeclared ((x, _):xs) id = (x == id) || isDeclared xs id

verifyStmt :: TypeEnv -> Statement -> Writer [String] TypeEnv

verifyStmt env (VarDecl id expr) = do
    t <- typeof env expr
    addBinding env (id, t)

verifyStmt env (VarAssign id expr) = do
    t <- getBinding env id
    t2 <- typeof env expr
    when (t /= Undefined && t /= t2) $ tell ["Incompatible type " ++ unparseType t2 ++ " assigned to variable " ++ id]
    return env

verifyStmt env (ForLoop id expr1 expr2 stmts) = do
    t1 <- typeof env expr1
    t2 <- typeof env expr2

    when (t1 /= IntType) $
        tell ["Expression that define range start must evaluate to type " ++ unparseType IntType]

    when (t2 /= IntType) $
        tell ["Expression that define range end must evaluate to type " ++ unparseType IntType]

    env2 <- addBinding env (id, IntType)
    verifyBlock env2 stmts
    return env

verifyStmt env (IfStmt expr stmts1 stmts2) = do
    t <- typeof env expr
    when (t /= BoolType) $ tell ["Condition must evaluate to type " ++ unparseType BoolType]
    verifyBlock env stmts1
    verifyBlock env stmts2
    return env

verifyStmt env (OutputStmt expr) = do
    t <- typeof env expr
    when (t /= TileType) $ tell ["Program must output an expression that evaluate to type " ++ unparseType TileType]
    return env

verifyStmt env (ImportStmt file id) = addBinding env (id, TileType)

typeof :: TypeEnv -> Expr -> Writer [String] VarType

typeof env (Var id) = getBinding env id
typeof env (IntLit _) = return IntType
typeof env TrueLit = return BoolType
typeof env FalseLit = return BoolType
typeof env (TileDef exprs) = do
    ts <- mapM (typeof env) exprs    
    let valid = foldr (\t acc -> (t == IntType || t == TileType) && acc) True ts
    unless valid $ 
        tell ["Tile definition must involve expressions that evaluate either to type " ++ unparseType IntType ++ " or " ++ unparseType TileType]

    return TileType

typeof env (AddOp expr1 expr2) = do 
    assertOperands env "+" ((expr1, IntType), (expr2, IntType))
    return IntType

typeof env (SubOp expr1 expr2) = do
    assertOperands env "-" ((expr1, IntType), (expr2, IntType))
    return IntType

typeof env (MulOp expr1 expr2) = do
    assertOperands env "*" ((expr1, IntType), (expr2, IntType))
    return IntType

typeof env (DivOp expr1 expr2) = do 
    assertOperands env "/" ((expr1, IntType), (expr2, IntType))
    return IntType

typeof env (ModOp expr1 expr2) = do
    assertOperands env "%" ((expr1, IntType), (expr2, IntType))
    return IntType

typeof env (AndOp expr1 expr2) = do
    assertOperands env "&&" ((expr1, BoolType), (expr2, BoolType))
    return BoolType

typeof env (OrOp expr1 expr2) = do
    assertOperands env "||" ((expr1, BoolType), (expr2, BoolType))
    return BoolType

typeof env (NotOp expr) = do
    t <- typeof env expr

    when (t /= BoolType) $
        tell ["'!' operator must be followed by an expression that evaluates to type " ++ unparseType BoolType]
    
    return BoolType

typeof env (GtOp expr1 expr2) = do
    assertOperands env ">" ((expr1, IntType), (expr2, IntType))
    return BoolType

typeof env (LtOp expr1 expr2) = do
    assertOperands env "<" ((expr1, IntType), (expr2, IntType))
    return BoolType

typeof env (GteOp expr1 expr2) = do
    assertOperands env ">=" ((expr1, IntType), (expr2, IntType))
    return BoolType

typeof env (LteOp expr1 expr2) = do
    assertOperands env "<=" ((expr1, IntType), (expr2, IntType))
    return BoolType

typeof env (EqOp expr1 expr2) = do
    t1 <- typeof env expr1
    t2 <- typeof env expr2

    when (t1 /= t2) $
        tell ["LHS expression and RHS expression of the '==' operator must both evaluate to the same type"]
    
    return BoolType

typeof env (NeqOp expr1 expr2) = do
    t1 <- typeof env expr1
    t2 <- typeof env expr2

    when (t1 /= t2) $
        tell ["LHS expression and RHS expression of the '!=' operator must both evaluate to the same type"]
    
    return BoolType

typeof env (HJoinOp expr1 expr2) = do
    assertOperands env "++" ((expr1, TileType), (expr2, TileType))
    return TileType

typeof env (VJoinOp expr1 expr2) = do
    assertOperands env "::" ((expr1, TileType), (expr2, TileType))
    return TileType

typeof env (RotateOp expr1 expr2) = do
    assertOperands env "~" ((expr1, TileType), (expr2, IntType))
    return TileType

typeof env (ScaleOp expr1 expr2) = do
    assertOperands env "**" ((expr1, TileType), (expr2, IntType))
    return TileType

assertOperands :: TypeEnv -> String -> ((Expr, VarType), (Expr, VarType)) -> Writer [String] ()
assertOperands env sign ((expr1, lt), (expr2, rt))  = do
    t1 <- typeof env expr1
    t2 <- typeof env expr2

    when (t1 /= lt) $
        tell ["LHS expression of the '" ++ sign ++ "' operator must evaluate to type " ++ unparseType lt]

    when (t2 /= rt) $
        tell ["RHS expresion of the '" ++ sign ++ "' operator must evaludate to type " ++ unparseType rt]
