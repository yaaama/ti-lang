module TypeChecker where

import Parser

type TypeEnv = [(String, VarType)]
data VarType = IntType | TileType | BoolType deriving (Eq)

unparseType :: VarType -> String
unparseType IntType = "Int"
unparseType TileType = "Tile"
unparseType BoolType = "Bool"

getBinding :: String -> TypeEnv -> VarType
getBinding id [] = error $ "Variable " ++ id ++ " is not defined."
getBinding id ((x, t) : env) = if id == x then t else getBinding id env

addBinding :: (String, VarType) -> TypeEnv -> TypeEnv
addBinding = addBinding' []

addBinding' :: TypeEnv -> (String, VarType) -> TypeEnv -> TypeEnv
addBinding' prev (id, t) [] = (id, t) : prev
addBinding' prev (id, t) (binding@(x, _) : env) = 
    if id == x 
        then error $ "Variable " ++ id ++ " has already been defined."
        else addBinding' (binding : prev) (id, t) env  

check' :: TypeEnv -> [Statement] -> TypeEnv
check' = foldr inspect

inspect :: Statement -> TypeEnv -> TypeEnv
inspect (VarDecl id expr) env = addBinding (id, typeof env expr) env

inspect (VarAssign id expr) env = 
    if newT == t 
        then env
        else error $ "Incompatible type " ++ 
            unparseType newT ++ " assigned to variable " ++ id
    where
        newT = typeof env expr 
        t = getBinding id env

inspect (ForLoop id startExpr endExpr body) env
    | startT /= IntType = error $ "Expression defining range start must be of type " ++ unparseType IntType
    | endT /= IntType = error $ "Expression defining range end must be of type " ++ unparseType IntType
    | otherwise = check' (addBinding (id, IntType) env) body
    where
        startT = typeof env startExpr
        endT = typeof env endExpr

typeof :: TypeEnv -> Expr -> VarType
typeof = undefined