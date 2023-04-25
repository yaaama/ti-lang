module TypeChecker where

import Parser

type TypeEnv = [(String, VarType)]
data VarType = IntType | TileType | BoolType deriving (Eq)

type CheckerErrors = [String]
type CheckerState = (TypeEnv, CheckerErrors)

unparseType :: VarType -> String
unparseType IntType = "Int"
unparseType TileType = "Tile"
unparseType BoolType = "Bool"

getBinding :: String -> TypeEnv -> Maybe VarType
getBinding id [] = Nothing
getBinding id ((x, t) : env) = if id == x then Just t else getBinding id env

verify :: [Statement] -> CheckerErrors
verify stmts = err ++ tErrs
    where
        verifyOutputStmtPosn stmts 
            | null stmts = []
            | length (filter isOutputStmt stmts) /= 1 = ["Program must contain exactly one output statement"]
            | not . isOutputStmt . last $ stmts = ["Program must have its last statement as an output statement"]
            | otherwise = []
            where 
                isOutputStmt (OutputStmt _) = True
                isOutputStmt _ = False

        err = verifyOutputStmtPosn stmts 
        (_, tErrs) = verifyBlock ([], []) stmts

-- TODO: This is very messy and impartial. Needed to use Write monad to reduce the complexity
-- Need to implement expression typing too

verifyBlock :: CheckerState -> [Statement] -> CheckerState
verifyBlock = foldr $ flip verifyStmt

verifyStmt :: CheckerState -> Statement -> CheckerState

verifyStmt state@(env, errs) (VarDecl id expr) = case getBinding id env of
    Just _ -> (env, ("Variable " ++ id ++ " has already been declared") : errs)
    Nothing -> 
        case typeof state expr of
            Left errs2 -> (env, errs2)
            Right t -> ((id, t) : env, errs)

verifyStmt state@(env, errs) (VarAssign id expr) = case getBinding id env of
    Nothing -> (env, ("Variable " ++ id ++ " has not been declared") : errs)
    Just t -> 
        case typeof state expr of
            Left errs2 -> (env, errs2)
            Right t2 
                | t2 == t -> state
                | otherwise -> (env, ("Incompatible type " ++ unparseType t2 ++ " assigned to variable " ++ id) : errs)  

verifyStmt state@(env, errs) (ForLoop id expr1 expr2 stmts) = case typeof state expr1 of
    Left errs2 -> (env, errs2)
    Right t1 
        | t1 /= IntType -> (env, ("Expression that defines range start must evaluate to type " ++ unparseType IntType) : errs)
        | otherwise -> 
            case typeof state expr2 of 
                Left errs3 -> (env, errs3)
                Right t2
                    | t2 /= IntType -> (env, ("Expression that defines range end must evaluate to type " ++ unparseType IntType) : errs)
                    | otherwise -> 
                        case getBinding id env of
                            Just _ -> (env, ("Variable " ++ id ++ " has already been declared") : errs)
                            Nothing -> state
                        where 
                            (_, errs) = verifyBlock ((id, IntType) : env, errs) stmts

verifyStmt state@(env, errs) (IfStmt expr stmts1 stmts2) = case typeof state expr of
    Left errs2 -> (env, errs2)
    Right t1 
        | t1 /= BoolType -> (env, ("Condition must evaluate to type " ++ unparseType BoolType) : errs)
        | otherwise -> (env, errs1 ++ errs2)
        where
            (_, errs1) = verifyBlock state stmts1
            (_, errs2) = verifyBlock state stmts2

verifyStmt state@(env, errs) (OutputStmt expr) = case typeof state expr of
    Left errs2 -> (env, errs2)
    Right t1 
        | t1 /= TileType -> (env, ("Program must output an expression that evaluate to type " ++ unparseType TileType) : errs)
        | otherwise -> state

typeof :: CheckerState -> Expr -> Either CheckerErrors VarType
typeof state@(env, errs) (AddOp expr1 expr2) = undefined