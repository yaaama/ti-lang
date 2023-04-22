{-# OPTIONS_GHC -w #-}
module Parser where

import qualified Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23
	= HappyTerminal (Lexer.Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18
	| HappyAbsSyn19 t19
	| HappyAbsSyn20 t20
	| HappyAbsSyn21 t21
	| HappyAbsSyn22 t22
	| HappyAbsSyn23 t23

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,358) ([0,0,0,0,0,0,0,0,32768,21,35392,7,22528,1,30884,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,0,32768,31,0,0,0,14,0,0,0,0,0,32768,1,0,0,1536,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,16384,0,0,16384,1930,0,0,41984,120,0,0,34816,5,0,0,0,0,0,16384,1930,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,24576,0,0,0,63488,4097,0,0,24,256,0,0,12288,16,0,0,24576,0,0,0,0,0,0,0,30884,0,0,0,0,0,24576,0,0,0,0,8240,0,8192,0,0,0,0,32768,0,0,0,41984,120,0,0,35392,7,0,0,24704,0,0,0,1544,0,0,40960,64,0,0,2560,4,0,0,24704,0,0,0,1544,0,0,32768,96,0,0,2048,6,0,0,24704,0,0,0,1544,0,0,32768,96,0,0,2048,6,0,0,24704,0,0,16384,1930,0,0,41984,120,0,0,0,0,0,0,0,0,0,3584,0,0,0,32768,96,0,0,0,0,0,57344,0,0,0,384,0,0,0,24,0,0,32768,1,0,0,6144,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,0,0,0,1034,0,0,0,0,0,96,0,0,0,6144,0,0,0,384,0,0,0,0,0,0,0,0,0,0,0,30884,0,0,0,1544,0,128,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,57344,96,32768,21,51776,7,0,0,512,0,0,384,1,0,24576,0,0,0,384,4096,0,0,6144,256,0,0,0,1544,0,0,0,0,0,0,0,0,0,24,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6144,512,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","Program","Statement","VariableDeclaration","ForLoop","IfStatement","Expression","Block","MathExpression","MathTerm","Factor","TileExpression","TileTerm","TileTerm2","RowDefinitions","RowDefinition","CellDefinitions","CellDefinition","BooleanExpression","BooleanTerm","BooleanTerm2","let","for","in","if","else","print","'~'","'**'","'++'","'::'","'=='","'!='","'>'","'<'","'>='","'<='","'+'","'-'","'*'","'/'","'%'","'&&'","'||'","'!'","'='","'..'","'['","']'","'('","')'","'{'","'}'","true","false","int","id","%eof"]
        bit_start = st Prelude.* 60
        bit_end = (st Prelude.+ 1) Prelude.* 60
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..59]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (4) = happyGoto action_3
action_0 _ = happyReduce_2

action_1 (4) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (24) = happyShift action_18
action_2 (25) = happyShift action_19
action_2 (27) = happyShift action_20
action_2 (29) = happyShift action_21
action_2 (47) = happyShift action_22
action_2 (50) = happyShift action_23
action_2 (52) = happyShift action_24
action_2 (56) = happyShift action_25
action_2 (57) = happyShift action_26
action_2 (58) = happyShift action_27
action_2 (59) = happyShift action_28
action_2 (5) = happyGoto action_4
action_2 (6) = happyGoto action_5
action_2 (7) = happyGoto action_6
action_2 (8) = happyGoto action_7
action_2 (9) = happyGoto action_8
action_2 (11) = happyGoto action_9
action_2 (12) = happyGoto action_10
action_2 (13) = happyGoto action_11
action_2 (14) = happyGoto action_12
action_2 (15) = happyGoto action_13
action_2 (16) = happyGoto action_14
action_2 (21) = happyGoto action_15
action_2 (22) = happyGoto action_16
action_2 (23) = happyGoto action_17
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (24) = happyShift action_18
action_3 (25) = happyShift action_19
action_3 (27) = happyShift action_20
action_3 (29) = happyShift action_21
action_3 (47) = happyShift action_22
action_3 (50) = happyShift action_23
action_3 (52) = happyShift action_24
action_3 (56) = happyShift action_25
action_3 (57) = happyShift action_26
action_3 (58) = happyShift action_27
action_3 (59) = happyShift action_28
action_3 (60) = happyAccept
action_3 (5) = happyGoto action_4
action_3 (6) = happyGoto action_5
action_3 (7) = happyGoto action_6
action_3 (8) = happyGoto action_7
action_3 (9) = happyGoto action_8
action_3 (11) = happyGoto action_9
action_3 (12) = happyGoto action_10
action_3 (13) = happyGoto action_11
action_3 (14) = happyGoto action_12
action_3 (15) = happyGoto action_13
action_3 (16) = happyGoto action_14
action_3 (21) = happyGoto action_15
action_3 (22) = happyGoto action_16
action_3 (23) = happyGoto action_17
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_1

action_5 _ = happyReduce_3

action_6 _ = happyReduce_4

action_7 _ = happyReduce_5

action_8 (34) = happyShift action_56
action_8 (35) = happyShift action_57
action_8 _ = happyReduce_7

action_9 (36) = happyShift action_50
action_9 (37) = happyShift action_51
action_9 (38) = happyShift action_52
action_9 (39) = happyShift action_53
action_9 (40) = happyShift action_54
action_9 (41) = happyShift action_55
action_9 _ = happyReduce_12

action_10 (42) = happyShift action_47
action_10 (43) = happyShift action_48
action_10 (44) = happyShift action_49
action_10 _ = happyReduce_18

action_11 _ = happyReduce_22

action_12 (32) = happyShift action_45
action_12 (33) = happyShift action_46
action_12 _ = happyReduce_13

action_13 (30) = happyShift action_43
action_13 (31) = happyShift action_44
action_13 _ = happyReduce_28

action_14 _ = happyReduce_31

action_15 (45) = happyShift action_41
action_15 (46) = happyShift action_42
action_15 _ = happyReduce_14

action_16 _ = happyReduce_44

action_17 _ = happyReduce_52

action_18 (59) = happyShift action_40
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (59) = happyShift action_39
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (47) = happyShift action_22
action_20 (50) = happyShift action_23
action_20 (52) = happyShift action_24
action_20 (56) = happyShift action_25
action_20 (57) = happyShift action_26
action_20 (58) = happyShift action_27
action_20 (59) = happyShift action_28
action_20 (9) = happyGoto action_29
action_20 (11) = happyGoto action_9
action_20 (12) = happyGoto action_10
action_20 (13) = happyGoto action_11
action_20 (14) = happyGoto action_12
action_20 (15) = happyGoto action_13
action_20 (16) = happyGoto action_14
action_20 (21) = happyGoto action_38
action_20 (22) = happyGoto action_16
action_20 (23) = happyGoto action_17
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (47) = happyShift action_22
action_21 (50) = happyShift action_23
action_21 (52) = happyShift action_24
action_21 (56) = happyShift action_25
action_21 (57) = happyShift action_26
action_21 (58) = happyShift action_27
action_21 (59) = happyShift action_28
action_21 (9) = happyGoto action_37
action_21 (11) = happyGoto action_9
action_21 (12) = happyGoto action_10
action_21 (13) = happyGoto action_11
action_21 (14) = happyGoto action_12
action_21 (15) = happyGoto action_13
action_21 (16) = happyGoto action_14
action_21 (21) = happyGoto action_15
action_21 (22) = happyGoto action_16
action_21 (23) = happyGoto action_17
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (52) = happyShift action_35
action_22 (56) = happyShift action_25
action_22 (57) = happyShift action_26
action_22 (59) = happyShift action_36
action_22 (23) = happyGoto action_34
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (17) = happyGoto action_33
action_23 _ = happyReduce_36

action_24 (47) = happyShift action_22
action_24 (50) = happyShift action_23
action_24 (52) = happyShift action_24
action_24 (56) = happyShift action_25
action_24 (57) = happyShift action_26
action_24 (58) = happyShift action_27
action_24 (59) = happyShift action_28
action_24 (9) = happyGoto action_29
action_24 (11) = happyGoto action_30
action_24 (12) = happyGoto action_10
action_24 (13) = happyGoto action_11
action_24 (14) = happyGoto action_31
action_24 (15) = happyGoto action_13
action_24 (16) = happyGoto action_14
action_24 (21) = happyGoto action_32
action_24 (22) = happyGoto action_16
action_24 (23) = happyGoto action_17
action_24 _ = happyFail (happyExpListPerState 24)

action_25 _ = happyReduce_53

action_26 _ = happyReduce_54

action_27 _ = happyReduce_23

action_28 (24) = happyReduce_55
action_28 (25) = happyReduce_55
action_28 (27) = happyReduce_55
action_28 (29) = happyReduce_55
action_28 (34) = happyReduce_55
action_28 (35) = happyReduce_55
action_28 (36) = happyReduce_24
action_28 (37) = happyReduce_24
action_28 (38) = happyReduce_24
action_28 (39) = happyReduce_24
action_28 (40) = happyReduce_24
action_28 (41) = happyReduce_24
action_28 (42) = happyReduce_24
action_28 (43) = happyReduce_24
action_28 (44) = happyReduce_24
action_28 (45) = happyReduce_55
action_28 (46) = happyReduce_55
action_28 (47) = happyReduce_55
action_28 (50) = happyReduce_55
action_28 (52) = happyReduce_55
action_28 (53) = happyReduce_55
action_28 (54) = happyReduce_55
action_28 (55) = happyReduce_55
action_28 (56) = happyReduce_55
action_28 (57) = happyReduce_55
action_28 (58) = happyReduce_55
action_28 (59) = happyReduce_55
action_28 (60) = happyReduce_55
action_28 _ = happyReduce_33

action_29 (34) = happyShift action_56
action_29 (35) = happyShift action_57
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (36) = happyShift action_50
action_30 (37) = happyShift action_51
action_30 (38) = happyShift action_52
action_30 (39) = happyShift action_53
action_30 (40) = happyShift action_54
action_30 (41) = happyShift action_55
action_30 (53) = happyShift action_88
action_30 _ = happyReduce_12

action_31 (32) = happyShift action_45
action_31 (33) = happyShift action_46
action_31 (53) = happyShift action_87
action_31 _ = happyReduce_13

action_32 (45) = happyShift action_41
action_32 (46) = happyShift action_42
action_32 (53) = happyShift action_86
action_32 _ = happyReduce_14

action_33 (50) = happyShift action_84
action_33 (51) = happyShift action_85
action_33 (18) = happyGoto action_83
action_33 _ = happyFail (happyExpListPerState 33)

action_34 _ = happyReduce_45

action_35 (47) = happyShift action_22
action_35 (50) = happyShift action_23
action_35 (52) = happyShift action_24
action_35 (56) = happyShift action_25
action_35 (57) = happyShift action_26
action_35 (58) = happyShift action_27
action_35 (59) = happyShift action_28
action_35 (9) = happyGoto action_29
action_35 (11) = happyGoto action_9
action_35 (12) = happyGoto action_10
action_35 (13) = happyGoto action_11
action_35 (14) = happyGoto action_12
action_35 (15) = happyGoto action_13
action_35 (16) = happyGoto action_14
action_35 (21) = happyGoto action_32
action_35 (22) = happyGoto action_16
action_35 (23) = happyGoto action_17
action_35 _ = happyFail (happyExpListPerState 35)

action_36 _ = happyReduce_55

action_37 (34) = happyShift action_56
action_37 (35) = happyShift action_57
action_37 _ = happyReduce_6

action_38 (45) = happyShift action_41
action_38 (46) = happyShift action_42
action_38 (54) = happyShift action_82
action_38 (10) = happyGoto action_81
action_38 _ = happyReduce_14

action_39 (26) = happyShift action_80
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (48) = happyShift action_79
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (47) = happyShift action_22
action_41 (50) = happyShift action_23
action_41 (52) = happyShift action_24
action_41 (56) = happyShift action_25
action_41 (57) = happyShift action_26
action_41 (58) = happyShift action_27
action_41 (59) = happyShift action_28
action_41 (9) = happyGoto action_29
action_41 (11) = happyGoto action_9
action_41 (12) = happyGoto action_10
action_41 (13) = happyGoto action_11
action_41 (14) = happyGoto action_12
action_41 (15) = happyGoto action_13
action_41 (16) = happyGoto action_14
action_41 (21) = happyGoto action_15
action_41 (22) = happyGoto action_78
action_41 (23) = happyGoto action_17
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (47) = happyShift action_22
action_42 (50) = happyShift action_23
action_42 (52) = happyShift action_24
action_42 (56) = happyShift action_25
action_42 (57) = happyShift action_26
action_42 (58) = happyShift action_27
action_42 (59) = happyShift action_28
action_42 (9) = happyGoto action_29
action_42 (11) = happyGoto action_9
action_42 (12) = happyGoto action_10
action_42 (13) = happyGoto action_11
action_42 (14) = happyGoto action_12
action_42 (15) = happyGoto action_13
action_42 (16) = happyGoto action_14
action_42 (21) = happyGoto action_15
action_42 (22) = happyGoto action_77
action_42 (23) = happyGoto action_17
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (52) = happyShift action_61
action_43 (58) = happyShift action_27
action_43 (59) = happyShift action_62
action_43 (11) = happyGoto action_76
action_43 (12) = happyGoto action_10
action_43 (13) = happyGoto action_11
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (52) = happyShift action_61
action_44 (58) = happyShift action_27
action_44 (59) = happyShift action_62
action_44 (11) = happyGoto action_75
action_44 (12) = happyGoto action_10
action_44 (13) = happyGoto action_11
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (50) = happyShift action_23
action_45 (52) = happyShift action_72
action_45 (59) = happyShift action_73
action_45 (15) = happyGoto action_74
action_45 (16) = happyGoto action_14
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (50) = happyShift action_23
action_46 (52) = happyShift action_72
action_46 (59) = happyShift action_73
action_46 (15) = happyGoto action_71
action_46 (16) = happyGoto action_14
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (52) = happyShift action_61
action_47 (58) = happyShift action_27
action_47 (59) = happyShift action_62
action_47 (13) = happyGoto action_70
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (52) = happyShift action_61
action_48 (58) = happyShift action_27
action_48 (59) = happyShift action_62
action_48 (13) = happyGoto action_69
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (52) = happyShift action_61
action_49 (58) = happyShift action_27
action_49 (59) = happyShift action_62
action_49 (13) = happyGoto action_68
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (52) = happyShift action_61
action_50 (58) = happyShift action_27
action_50 (59) = happyShift action_62
action_50 (11) = happyGoto action_67
action_50 (12) = happyGoto action_10
action_50 (13) = happyGoto action_11
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (52) = happyShift action_61
action_51 (58) = happyShift action_27
action_51 (59) = happyShift action_62
action_51 (11) = happyGoto action_66
action_51 (12) = happyGoto action_10
action_51 (13) = happyGoto action_11
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (52) = happyShift action_61
action_52 (58) = happyShift action_27
action_52 (59) = happyShift action_62
action_52 (11) = happyGoto action_65
action_52 (12) = happyGoto action_10
action_52 (13) = happyGoto action_11
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (52) = happyShift action_61
action_53 (58) = happyShift action_27
action_53 (59) = happyShift action_62
action_53 (11) = happyGoto action_64
action_53 (12) = happyGoto action_10
action_53 (13) = happyGoto action_11
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (52) = happyShift action_61
action_54 (58) = happyShift action_27
action_54 (59) = happyShift action_62
action_54 (12) = happyGoto action_63
action_54 (13) = happyGoto action_11
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (52) = happyShift action_61
action_55 (58) = happyShift action_27
action_55 (59) = happyShift action_62
action_55 (12) = happyGoto action_60
action_55 (13) = happyGoto action_11
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (47) = happyShift action_22
action_56 (50) = happyShift action_23
action_56 (52) = happyShift action_24
action_56 (56) = happyShift action_25
action_56 (57) = happyShift action_26
action_56 (58) = happyShift action_27
action_56 (59) = happyShift action_28
action_56 (9) = happyGoto action_59
action_56 (11) = happyGoto action_9
action_56 (12) = happyGoto action_10
action_56 (13) = happyGoto action_11
action_56 (14) = happyGoto action_12
action_56 (15) = happyGoto action_13
action_56 (16) = happyGoto action_14
action_56 (21) = happyGoto action_15
action_56 (22) = happyGoto action_16
action_56 (23) = happyGoto action_17
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (47) = happyShift action_22
action_57 (50) = happyShift action_23
action_57 (52) = happyShift action_24
action_57 (56) = happyShift action_25
action_57 (57) = happyShift action_26
action_57 (58) = happyShift action_27
action_57 (59) = happyShift action_28
action_57 (9) = happyGoto action_58
action_57 (11) = happyGoto action_9
action_57 (12) = happyGoto action_10
action_57 (13) = happyGoto action_11
action_57 (14) = happyGoto action_12
action_57 (15) = happyGoto action_13
action_57 (16) = happyGoto action_14
action_57 (21) = happyGoto action_15
action_57 (22) = happyGoto action_16
action_57 (23) = happyGoto action_17
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (34) = happyShift action_56
action_58 (35) = happyShift action_57
action_58 _ = happyReduce_47

action_59 (34) = happyShift action_56
action_59 (35) = happyShift action_57
action_59 _ = happyReduce_46

action_60 (42) = happyShift action_47
action_60 (43) = happyShift action_48
action_60 (44) = happyShift action_49
action_60 _ = happyReduce_17

action_61 (52) = happyShift action_61
action_61 (58) = happyShift action_27
action_61 (59) = happyShift action_62
action_61 (11) = happyGoto action_95
action_61 (12) = happyGoto action_10
action_61 (13) = happyGoto action_11
action_61 _ = happyFail (happyExpListPerState 61)

action_62 _ = happyReduce_24

action_63 (42) = happyShift action_47
action_63 (43) = happyShift action_48
action_63 (44) = happyShift action_49
action_63 _ = happyReduce_16

action_64 (40) = happyShift action_54
action_64 (41) = happyShift action_55
action_64 _ = happyReduce_51

action_65 (40) = happyShift action_54
action_65 (41) = happyShift action_55
action_65 _ = happyReduce_50

action_66 (40) = happyShift action_54
action_66 (41) = happyShift action_55
action_66 _ = happyReduce_49

action_67 (40) = happyShift action_54
action_67 (41) = happyShift action_55
action_67 _ = happyReduce_48

action_68 _ = happyReduce_21

action_69 _ = happyReduce_20

action_70 _ = happyReduce_19

action_71 (30) = happyShift action_43
action_71 (31) = happyShift action_44
action_71 _ = happyReduce_27

action_72 (50) = happyShift action_23
action_72 (52) = happyShift action_72
action_72 (59) = happyShift action_73
action_72 (14) = happyGoto action_94
action_72 (15) = happyGoto action_13
action_72 (16) = happyGoto action_14
action_72 _ = happyFail (happyExpListPerState 72)

action_73 _ = happyReduce_33

action_74 (30) = happyShift action_43
action_74 (31) = happyShift action_44
action_74 _ = happyReduce_26

action_75 (40) = happyShift action_54
action_75 (41) = happyShift action_55
action_75 _ = happyReduce_30

action_76 (40) = happyShift action_54
action_76 (41) = happyShift action_55
action_76 _ = happyReduce_29

action_77 (34) = happyReduce_44
action_77 (35) = happyReduce_44
action_77 (45) = happyReduce_44
action_77 (46) = happyReduce_44
action_77 _ = happyReduce_43

action_78 (34) = happyReduce_44
action_78 (35) = happyReduce_44
action_78 (45) = happyReduce_44
action_78 (46) = happyReduce_44
action_78 _ = happyReduce_42

action_79 (47) = happyShift action_22
action_79 (50) = happyShift action_23
action_79 (52) = happyShift action_24
action_79 (56) = happyShift action_25
action_79 (57) = happyShift action_26
action_79 (58) = happyShift action_27
action_79 (59) = happyShift action_28
action_79 (9) = happyGoto action_93
action_79 (11) = happyGoto action_9
action_79 (12) = happyGoto action_10
action_79 (13) = happyGoto action_11
action_79 (14) = happyGoto action_12
action_79 (15) = happyGoto action_13
action_79 (16) = happyGoto action_14
action_79 (21) = happyGoto action_15
action_79 (22) = happyGoto action_16
action_79 (23) = happyGoto action_17
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (52) = happyShift action_61
action_80 (58) = happyShift action_27
action_80 (59) = happyShift action_62
action_80 (11) = happyGoto action_92
action_80 (12) = happyGoto action_10
action_80 (13) = happyGoto action_11
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (28) = happyShift action_91
action_81 _ = happyReduce_10

action_82 (4) = happyGoto action_90
action_82 _ = happyReduce_2

action_83 _ = happyReduce_35

action_84 (19) = happyGoto action_89
action_84 _ = happyReduce_39

action_85 _ = happyReduce_32

action_86 _ = happyReduce_56

action_87 _ = happyReduce_34

action_88 _ = happyReduce_25

action_89 (50) = happyShift action_23
action_89 (51) = happyShift action_101
action_89 (52) = happyShift action_72
action_89 (58) = happyShift action_102
action_89 (59) = happyShift action_73
action_89 (14) = happyGoto action_99
action_89 (15) = happyGoto action_13
action_89 (16) = happyGoto action_14
action_89 (20) = happyGoto action_100
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (24) = happyShift action_18
action_90 (25) = happyShift action_19
action_90 (27) = happyShift action_20
action_90 (29) = happyShift action_21
action_90 (47) = happyShift action_22
action_90 (50) = happyShift action_23
action_90 (52) = happyShift action_24
action_90 (55) = happyShift action_98
action_90 (56) = happyShift action_25
action_90 (57) = happyShift action_26
action_90 (58) = happyShift action_27
action_90 (59) = happyShift action_28
action_90 (5) = happyGoto action_4
action_90 (6) = happyGoto action_5
action_90 (7) = happyGoto action_6
action_90 (8) = happyGoto action_7
action_90 (9) = happyGoto action_8
action_90 (11) = happyGoto action_9
action_90 (12) = happyGoto action_10
action_90 (13) = happyGoto action_11
action_90 (14) = happyGoto action_12
action_90 (15) = happyGoto action_13
action_90 (16) = happyGoto action_14
action_90 (21) = happyGoto action_15
action_90 (22) = happyGoto action_16
action_90 (23) = happyGoto action_17
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (54) = happyShift action_82
action_91 (10) = happyGoto action_97
action_91 _ = happyFail (happyExpListPerState 91)

action_92 (40) = happyShift action_54
action_92 (41) = happyShift action_55
action_92 (49) = happyShift action_96
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (34) = happyShift action_56
action_93 (35) = happyShift action_57
action_93 _ = happyReduce_8

action_94 (32) = happyShift action_45
action_94 (33) = happyShift action_46
action_94 (53) = happyShift action_87
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (40) = happyShift action_54
action_95 (41) = happyShift action_55
action_95 (53) = happyShift action_88
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (52) = happyShift action_61
action_96 (58) = happyShift action_27
action_96 (59) = happyShift action_62
action_96 (11) = happyGoto action_103
action_96 (12) = happyGoto action_10
action_96 (13) = happyGoto action_11
action_96 _ = happyFail (happyExpListPerState 96)

action_97 _ = happyReduce_11

action_98 _ = happyReduce_15

action_99 (32) = happyShift action_45
action_99 (33) = happyShift action_46
action_99 _ = happyReduce_41

action_100 _ = happyReduce_38

action_101 _ = happyReduce_37

action_102 _ = happyReduce_40

action_103 (40) = happyShift action_54
action_103 (41) = happyShift action_55
action_103 (54) = happyShift action_82
action_103 (10) = happyGoto action_104
action_103 _ = happyFail (happyExpListPerState 103)

action_104 _ = happyReduce_9

happyReduce_1 = happySpecReduce_2  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_2 : happy_var_1
	)
happyReduction_1 _ _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_0  4 happyReduction_2
happyReduction_2  =  HappyAbsSyn4
		 ([]
	)

happyReduce_3 = happySpecReduce_1  5 happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  5 happyReduction_4
happyReduction_4 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_1  5 happyReduction_5
happyReduction_5 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_2  5 happyReduction_6
happyReduction_6 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (PrintStmt happy_var_2
	)
happyReduction_6 _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  5 happyReduction_7
happyReduction_7 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn5
		 (Expr happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happyReduce 4 6 happyReduction_8
happyReduction_8 ((HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexer.Ident happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (VarDecl happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_9 = happyReduce 7 7 happyReduction_9
happyReduction_9 ((HappyAbsSyn10  happy_var_7) `HappyStk`
	(HappyAbsSyn11  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexer.Ident happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (ForLoop happy_var_2 happy_var_4 happy_var_6 happy_var_7
	) `HappyStk` happyRest

happyReduce_10 = happySpecReduce_3  8 happyReduction_10
happyReduction_10 (HappyAbsSyn10  happy_var_3)
	(HappyAbsSyn21  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (IfStmt happy_var_2 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happyReduce 5 8 happyReduction_11
happyReduction_11 ((HappyAbsSyn10  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	(HappyAbsSyn21  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (IfElseStmt happy_var_2 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_12 = happySpecReduce_1  9 happyReduction_12
happyReduction_12 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn9
		 (MathExpr happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  9 happyReduction_13
happyReduction_13 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn9
		 (TileExpr happy_var_1
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_1  9 happyReduction_14
happyReduction_14 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn9
		 (BoolExpr happy_var_1
	)
happyReduction_14 _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  10 happyReduction_15
happyReduction_15 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (happy_var_2
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  11 happyReduction_16
happyReduction_16 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (AddOp happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  11 happyReduction_17
happyReduction_17 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (SubOp happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  11 happyReduction_18
happyReduction_18 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  12 happyReduction_19
happyReduction_19 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (MulOp happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  12 happyReduction_20
happyReduction_20 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (DivOp happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  12 happyReduction_21
happyReduction_21 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (ModOp happy_var_1 happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  12 happyReduction_22
happyReduction_22 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  13 happyReduction_23
happyReduction_23 (HappyTerminal (Lexer.IntLit happy_var_1))
	 =  HappyAbsSyn13
		 (IntLit happy_var_1
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  13 happyReduction_24
happyReduction_24 (HappyTerminal (Lexer.Ident happy_var_1))
	 =  HappyAbsSyn13
		 (MathVar happy_var_1
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  13 happyReduction_25
happyReduction_25 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (happy_var_2
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  14 happyReduction_26
happyReduction_26 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (HJoinOp happy_var_1 happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  14 happyReduction_27
happyReduction_27 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (VJoinOp happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  14 happyReduction_28
happyReduction_28 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  15 happyReduction_29
happyReduction_29 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (RotateOp happy_var_1 happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  15 happyReduction_30
happyReduction_30 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (ScaleOp happy_var_1 happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  15 happyReduction_31
happyReduction_31 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  16 happyReduction_32
happyReduction_32 _
	(HappyAbsSyn17  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (TileDef happy_var_2
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  16 happyReduction_33
happyReduction_33 (HappyTerminal (Lexer.Ident happy_var_1))
	 =  HappyAbsSyn16
		 (TileVar happy_var_1
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  16 happyReduction_34
happyReduction_34 _
	(HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (happy_var_2
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_2  17 happyReduction_35
happyReduction_35 (HappyAbsSyn18  happy_var_2)
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_2 : happy_var_1
	)
happyReduction_35 _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_0  17 happyReduction_36
happyReduction_36  =  HappyAbsSyn17
		 ([]
	)

happyReduce_37 = happySpecReduce_3  18 happyReduction_37
happyReduction_37 _
	(HappyAbsSyn19  happy_var_2)
	_
	 =  HappyAbsSyn18
		 (happy_var_2
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_2  19 happyReduction_38
happyReduction_38 (HappyAbsSyn20  happy_var_2)
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_2 : happy_var_1
	)
happyReduction_38 _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_0  19 happyReduction_39
happyReduction_39  =  HappyAbsSyn19
		 ([]
	)

happyReduce_40 = happySpecReduce_1  20 happyReduction_40
happyReduction_40 (HappyTerminal (Lexer.IntLit happy_var_1))
	 =  HappyAbsSyn20
		 (CellValue happy_var_1
	)
happyReduction_40 _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  20 happyReduction_41
happyReduction_41 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn20
		 (CellExpr happy_var_1
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  21 happyReduction_42
happyReduction_42 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (AndOp happy_var_1 happy_var_3
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_3  21 happyReduction_43
happyReduction_43 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (OrOp happy_var_1 happy_var_3
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  21 happyReduction_44
happyReduction_44 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn21
		 (happy_var_1
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_2  22 happyReduction_45
happyReduction_45 (HappyAbsSyn23  happy_var_2)
	_
	 =  HappyAbsSyn22
		 (NotOp happy_var_2
	)
happyReduction_45 _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_3  22 happyReduction_46
happyReduction_46 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn22
		 (EqOp happy_var_1 happy_var_3
	)
happyReduction_46 _ _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_3  22 happyReduction_47
happyReduction_47 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn22
		 (NeqOp happy_var_1 happy_var_3
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_3  22 happyReduction_48
happyReduction_48 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn22
		 (GtOp happy_var_1 happy_var_3
	)
happyReduction_48 _ _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_3  22 happyReduction_49
happyReduction_49 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn22
		 (LtOp happy_var_1 happy_var_3
	)
happyReduction_49 _ _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_3  22 happyReduction_50
happyReduction_50 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn22
		 (GteOp happy_var_1 happy_var_3
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_3  22 happyReduction_51
happyReduction_51 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn22
		 (LteOp happy_var_1 happy_var_3
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_1  22 happyReduction_52
happyReduction_52 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn22
		 (happy_var_1
	)
happyReduction_52 _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_1  23 happyReduction_53
happyReduction_53 _
	 =  HappyAbsSyn23
		 (TrueLit
	)

happyReduce_54 = happySpecReduce_1  23 happyReduction_54
happyReduction_54 _
	 =  HappyAbsSyn23
		 (FalseLit
	)

happyReduce_55 = happySpecReduce_1  23 happyReduction_55
happyReduction_55 (HappyTerminal (Lexer.Ident happy_var_1))
	 =  HappyAbsSyn23
		 (BoolVar happy_var_1
	)
happyReduction_55 _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_3  23 happyReduction_56
happyReduction_56 _
	(HappyAbsSyn21  happy_var_2)
	_
	 =  HappyAbsSyn23
		 (happy_var_2
	)
happyReduction_56 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 60 60 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	Lexer.LetKw -> cont 24;
	Lexer.ForKw -> cont 25;
	Lexer.InKw -> cont 26;
	Lexer.IfKw -> cont 27;
	Lexer.ElseKw -> cont 28;
	Lexer.PrintFn -> cont 29;
	Lexer.RotateOp -> cont 30;
	Lexer.ScaleOp -> cont 31;
	Lexer.HJoinOp -> cont 32;
	Lexer.VJoinOp -> cont 33;
	Lexer.EqOp -> cont 34;
	Lexer.NeqOp -> cont 35;
	Lexer.GtOp -> cont 36;
	Lexer.LtOp -> cont 37;
	Lexer.GteOp -> cont 38;
	Lexer.LteOp -> cont 39;
	Lexer.AddOp -> cont 40;
	Lexer.SubOp -> cont 41;
	Lexer.MulOp -> cont 42;
	Lexer.DivOp -> cont 43;
	Lexer.ModOp -> cont 44;
	Lexer.AndOp -> cont 45;
	Lexer.OrOp -> cont 46;
	Lexer.NotOp -> cont 47;
	Lexer.AssignSym -> cont 48;
	Lexer.RangeSym -> cont 49;
	Lexer.LBracketSym -> cont 50;
	Lexer.RBracketSym -> cont 51;
	Lexer.LParenSym -> cont 52;
	Lexer.RParenSym -> cont 53;
	Lexer.LCurlySym -> cont 54;
	Lexer.RCurlySym -> cont 55;
	Lexer.TrueLit -> cont 56;
	Lexer.FalseLit -> cont 57;
	Lexer.IntLit happy_dollar_dollar -> cont 58;
	Lexer.Ident happy_dollar_dollar -> cont 59;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 60 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Lexer.Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parse tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


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
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
