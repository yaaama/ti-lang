{-# OPTIONS_GHC -w #-}
module Parser where

import qualified Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14
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

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,270) ([0,0,0,0,0,0,0,688,18432,241,5504,16384,1930,0,0,0,0,0,0,0,0,0,0,0,0,0,61440,8191,0,0,0,0,0,0,32768,0,0,0,4,0,20992,60,0,36864,482,0,32768,3860,0,0,0,0,0,50464,3,0,0,0,0,0,0,0,0,0,0,0,0,0,65528,1039,0,0,3072,0,0,0,0,61440,8191,0,32768,65535,128,16384,0,0,0,0,128,0,0,20992,60,0,36864,482,0,32768,3860,0,0,30884,0,0,50464,3,0,10496,30,0,18432,241,0,16384,1930,0,0,15442,0,0,58000,1,0,5248,15,0,41984,120,0,8192,965,0,0,7721,0,0,61768,0,0,35392,7,0,20992,60,63488,1023,0,49152,8191,0,0,30,0,0,240,0,0,1920,0,0,15360,448,0,57344,3585,0,0,31759,0,0,57464,3,0,960,31,0,7680,248,0,61440,1984,0,32768,15879,0,0,12,0,0,96,0,0,0,0,0,0,0,0,0,32768,3860,0,0,30884,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,7296,15,344,41984,124,0,0,16,32768,65535,4,0,65532,7,0,0,35392,7,0,0,0,0,0,0,49152,32767,0,0,0,0,0,65520,4127,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","Program","Statement","VariableDeclaration","ForLoop","IfStatement","Block","Expression","TileDefinition","RowDefinitions","RowDefinition","CellDefinitions","let","for","in","if","else","print","'~'","'**'","'++'","'::'","'=='","'!='","'>'","'<'","'>='","'<='","'+'","'-'","'*'","'/'","'%'","'&&'","'||'","'!'","'='","'..'","'['","']'","'('","')'","'{'","'}'","true","false","int","id","%eof"]
        bit_start = st Prelude.* 51
        bit_end = (st Prelude.+ 1) Prelude.* 51
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..50]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (4) = happyGoto action_3
action_0 _ = happyReduce_2

action_1 (4) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (15) = happyShift action_10
action_2 (16) = happyShift action_11
action_2 (18) = happyShift action_12
action_2 (20) = happyShift action_13
action_2 (38) = happyShift action_14
action_2 (41) = happyShift action_15
action_2 (43) = happyShift action_16
action_2 (47) = happyShift action_17
action_2 (48) = happyShift action_18
action_2 (49) = happyShift action_19
action_2 (50) = happyShift action_20
action_2 (5) = happyGoto action_4
action_2 (6) = happyGoto action_5
action_2 (7) = happyGoto action_6
action_2 (8) = happyGoto action_7
action_2 (10) = happyGoto action_8
action_2 (11) = happyGoto action_9
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (15) = happyShift action_10
action_3 (16) = happyShift action_11
action_3 (18) = happyShift action_12
action_3 (20) = happyShift action_13
action_3 (38) = happyShift action_14
action_3 (41) = happyShift action_15
action_3 (43) = happyShift action_16
action_3 (47) = happyShift action_17
action_3 (48) = happyShift action_18
action_3 (49) = happyShift action_19
action_3 (50) = happyShift action_20
action_3 (51) = happyAccept
action_3 (5) = happyGoto action_4
action_3 (6) = happyGoto action_5
action_3 (7) = happyGoto action_6
action_3 (8) = happyGoto action_7
action_3 (10) = happyGoto action_8
action_3 (11) = happyGoto action_9
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_1

action_5 _ = happyReduce_3

action_6 _ = happyReduce_4

action_7 _ = happyReduce_5

action_8 (21) = happyShift action_28
action_8 (22) = happyShift action_29
action_8 (23) = happyShift action_30
action_8 (24) = happyShift action_31
action_8 (25) = happyShift action_32
action_8 (26) = happyShift action_33
action_8 (27) = happyShift action_34
action_8 (28) = happyShift action_35
action_8 (29) = happyShift action_36
action_8 (30) = happyShift action_37
action_8 (31) = happyShift action_38
action_8 (32) = happyShift action_39
action_8 (33) = happyShift action_40
action_8 (34) = happyShift action_41
action_8 (35) = happyShift action_42
action_8 (36) = happyShift action_43
action_8 (37) = happyShift action_44
action_8 _ = happyReduce_7

action_9 _ = happyReduce_36

action_10 (50) = happyShift action_27
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (50) = happyShift action_26
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (38) = happyShift action_14
action_12 (41) = happyShift action_15
action_12 (43) = happyShift action_16
action_12 (47) = happyShift action_17
action_12 (48) = happyShift action_18
action_12 (49) = happyShift action_19
action_12 (50) = happyShift action_20
action_12 (10) = happyGoto action_25
action_12 (11) = happyGoto action_9
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (38) = happyShift action_14
action_13 (41) = happyShift action_15
action_13 (43) = happyShift action_16
action_13 (47) = happyShift action_17
action_13 (48) = happyShift action_18
action_13 (49) = happyShift action_19
action_13 (50) = happyShift action_20
action_13 (10) = happyGoto action_24
action_13 (11) = happyGoto action_9
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (38) = happyShift action_14
action_14 (41) = happyShift action_15
action_14 (43) = happyShift action_16
action_14 (47) = happyShift action_17
action_14 (48) = happyShift action_18
action_14 (49) = happyShift action_19
action_14 (50) = happyShift action_20
action_14 (10) = happyGoto action_23
action_14 (11) = happyGoto action_9
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (12) = happyGoto action_22
action_15 _ = happyReduce_39

action_16 (38) = happyShift action_14
action_16 (41) = happyShift action_15
action_16 (43) = happyShift action_16
action_16 (47) = happyShift action_17
action_16 (48) = happyShift action_18
action_16 (49) = happyShift action_19
action_16 (50) = happyShift action_20
action_16 (10) = happyGoto action_21
action_16 (11) = happyGoto action_9
action_16 _ = happyFail (happyExpListPerState 16)

action_17 _ = happyReduce_34

action_18 _ = happyReduce_35

action_19 _ = happyReduce_33

action_20 _ = happyReduce_32

action_21 (21) = happyShift action_28
action_21 (22) = happyShift action_29
action_21 (23) = happyShift action_30
action_21 (24) = happyShift action_31
action_21 (25) = happyShift action_32
action_21 (26) = happyShift action_33
action_21 (27) = happyShift action_34
action_21 (28) = happyShift action_35
action_21 (29) = happyShift action_36
action_21 (30) = happyShift action_37
action_21 (31) = happyShift action_38
action_21 (32) = happyShift action_39
action_21 (33) = happyShift action_40
action_21 (34) = happyShift action_41
action_21 (35) = happyShift action_42
action_21 (36) = happyShift action_43
action_21 (37) = happyShift action_44
action_21 (44) = happyShift action_69
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (41) = happyShift action_67
action_22 (42) = happyShift action_68
action_22 (13) = happyGoto action_66
action_22 _ = happyFail (happyExpListPerState 22)

action_23 _ = happyReduce_30

action_24 (21) = happyShift action_28
action_24 (22) = happyShift action_29
action_24 (23) = happyShift action_30
action_24 (24) = happyShift action_31
action_24 (25) = happyShift action_32
action_24 (26) = happyShift action_33
action_24 (27) = happyShift action_34
action_24 (28) = happyShift action_35
action_24 (29) = happyShift action_36
action_24 (30) = happyShift action_37
action_24 (31) = happyShift action_38
action_24 (32) = happyShift action_39
action_24 (33) = happyShift action_40
action_24 (34) = happyShift action_41
action_24 (35) = happyShift action_42
action_24 (36) = happyShift action_43
action_24 (37) = happyShift action_44
action_24 _ = happyReduce_6

action_25 (21) = happyShift action_28
action_25 (22) = happyShift action_29
action_25 (23) = happyShift action_30
action_25 (24) = happyShift action_31
action_25 (25) = happyShift action_32
action_25 (26) = happyShift action_33
action_25 (27) = happyShift action_34
action_25 (28) = happyShift action_35
action_25 (29) = happyShift action_36
action_25 (30) = happyShift action_37
action_25 (31) = happyShift action_38
action_25 (32) = happyShift action_39
action_25 (33) = happyShift action_40
action_25 (34) = happyShift action_41
action_25 (35) = happyShift action_42
action_25 (36) = happyShift action_43
action_25 (37) = happyShift action_44
action_25 (45) = happyShift action_65
action_25 (9) = happyGoto action_64
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (17) = happyShift action_63
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (39) = happyShift action_62
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (38) = happyShift action_14
action_28 (41) = happyShift action_15
action_28 (43) = happyShift action_16
action_28 (47) = happyShift action_17
action_28 (48) = happyShift action_18
action_28 (49) = happyShift action_19
action_28 (50) = happyShift action_20
action_28 (10) = happyGoto action_61
action_28 (11) = happyGoto action_9
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (38) = happyShift action_14
action_29 (41) = happyShift action_15
action_29 (43) = happyShift action_16
action_29 (47) = happyShift action_17
action_29 (48) = happyShift action_18
action_29 (49) = happyShift action_19
action_29 (50) = happyShift action_20
action_29 (10) = happyGoto action_60
action_29 (11) = happyGoto action_9
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (38) = happyShift action_14
action_30 (41) = happyShift action_15
action_30 (43) = happyShift action_16
action_30 (47) = happyShift action_17
action_30 (48) = happyShift action_18
action_30 (49) = happyShift action_19
action_30 (50) = happyShift action_20
action_30 (10) = happyGoto action_59
action_30 (11) = happyGoto action_9
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (38) = happyShift action_14
action_31 (41) = happyShift action_15
action_31 (43) = happyShift action_16
action_31 (47) = happyShift action_17
action_31 (48) = happyShift action_18
action_31 (49) = happyShift action_19
action_31 (50) = happyShift action_20
action_31 (10) = happyGoto action_58
action_31 (11) = happyGoto action_9
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (38) = happyShift action_14
action_32 (41) = happyShift action_15
action_32 (43) = happyShift action_16
action_32 (47) = happyShift action_17
action_32 (48) = happyShift action_18
action_32 (49) = happyShift action_19
action_32 (50) = happyShift action_20
action_32 (10) = happyGoto action_57
action_32 (11) = happyGoto action_9
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (38) = happyShift action_14
action_33 (41) = happyShift action_15
action_33 (43) = happyShift action_16
action_33 (47) = happyShift action_17
action_33 (48) = happyShift action_18
action_33 (49) = happyShift action_19
action_33 (50) = happyShift action_20
action_33 (10) = happyGoto action_56
action_33 (11) = happyGoto action_9
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (38) = happyShift action_14
action_34 (41) = happyShift action_15
action_34 (43) = happyShift action_16
action_34 (47) = happyShift action_17
action_34 (48) = happyShift action_18
action_34 (49) = happyShift action_19
action_34 (50) = happyShift action_20
action_34 (10) = happyGoto action_55
action_34 (11) = happyGoto action_9
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (38) = happyShift action_14
action_35 (41) = happyShift action_15
action_35 (43) = happyShift action_16
action_35 (47) = happyShift action_17
action_35 (48) = happyShift action_18
action_35 (49) = happyShift action_19
action_35 (50) = happyShift action_20
action_35 (10) = happyGoto action_54
action_35 (11) = happyGoto action_9
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (38) = happyShift action_14
action_36 (41) = happyShift action_15
action_36 (43) = happyShift action_16
action_36 (47) = happyShift action_17
action_36 (48) = happyShift action_18
action_36 (49) = happyShift action_19
action_36 (50) = happyShift action_20
action_36 (10) = happyGoto action_53
action_36 (11) = happyGoto action_9
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (38) = happyShift action_14
action_37 (41) = happyShift action_15
action_37 (43) = happyShift action_16
action_37 (47) = happyShift action_17
action_37 (48) = happyShift action_18
action_37 (49) = happyShift action_19
action_37 (50) = happyShift action_20
action_37 (10) = happyGoto action_52
action_37 (11) = happyGoto action_9
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (38) = happyShift action_14
action_38 (41) = happyShift action_15
action_38 (43) = happyShift action_16
action_38 (47) = happyShift action_17
action_38 (48) = happyShift action_18
action_38 (49) = happyShift action_19
action_38 (50) = happyShift action_20
action_38 (10) = happyGoto action_51
action_38 (11) = happyGoto action_9
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (38) = happyShift action_14
action_39 (41) = happyShift action_15
action_39 (43) = happyShift action_16
action_39 (47) = happyShift action_17
action_39 (48) = happyShift action_18
action_39 (49) = happyShift action_19
action_39 (50) = happyShift action_20
action_39 (10) = happyGoto action_50
action_39 (11) = happyGoto action_9
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (38) = happyShift action_14
action_40 (41) = happyShift action_15
action_40 (43) = happyShift action_16
action_40 (47) = happyShift action_17
action_40 (48) = happyShift action_18
action_40 (49) = happyShift action_19
action_40 (50) = happyShift action_20
action_40 (10) = happyGoto action_49
action_40 (11) = happyGoto action_9
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (38) = happyShift action_14
action_41 (41) = happyShift action_15
action_41 (43) = happyShift action_16
action_41 (47) = happyShift action_17
action_41 (48) = happyShift action_18
action_41 (49) = happyShift action_19
action_41 (50) = happyShift action_20
action_41 (10) = happyGoto action_48
action_41 (11) = happyGoto action_9
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (38) = happyShift action_14
action_42 (41) = happyShift action_15
action_42 (43) = happyShift action_16
action_42 (47) = happyShift action_17
action_42 (48) = happyShift action_18
action_42 (49) = happyShift action_19
action_42 (50) = happyShift action_20
action_42 (10) = happyGoto action_47
action_42 (11) = happyGoto action_9
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (38) = happyShift action_14
action_43 (41) = happyShift action_15
action_43 (43) = happyShift action_16
action_43 (47) = happyShift action_17
action_43 (48) = happyShift action_18
action_43 (49) = happyShift action_19
action_43 (50) = happyShift action_20
action_43 (10) = happyGoto action_46
action_43 (11) = happyGoto action_9
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (38) = happyShift action_14
action_44 (41) = happyShift action_15
action_44 (43) = happyShift action_16
action_44 (47) = happyShift action_17
action_44 (48) = happyShift action_18
action_44 (49) = happyShift action_19
action_44 (50) = happyShift action_20
action_44 (10) = happyGoto action_45
action_44 (11) = happyGoto action_9
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (21) = happyShift action_28
action_45 (22) = happyShift action_29
action_45 (23) = happyShift action_30
action_45 (24) = happyShift action_31
action_45 (25) = happyShift action_32
action_45 (26) = happyShift action_33
action_45 (27) = happyShift action_34
action_45 (28) = happyShift action_35
action_45 (29) = happyShift action_36
action_45 (30) = happyShift action_37
action_45 (31) = happyShift action_38
action_45 (32) = happyShift action_39
action_45 (33) = happyShift action_40
action_45 (34) = happyShift action_41
action_45 (35) = happyShift action_42
action_45 _ = happyReduce_14

action_46 (21) = happyShift action_28
action_46 (22) = happyShift action_29
action_46 (23) = happyShift action_30
action_46 (24) = happyShift action_31
action_46 (25) = happyShift action_32
action_46 (26) = happyShift action_33
action_46 (27) = happyShift action_34
action_46 (28) = happyShift action_35
action_46 (29) = happyShift action_36
action_46 (30) = happyShift action_37
action_46 (31) = happyShift action_38
action_46 (32) = happyShift action_39
action_46 (33) = happyShift action_40
action_46 (34) = happyShift action_41
action_46 (35) = happyShift action_42
action_46 _ = happyReduce_13

action_47 (21) = happyShift action_28
action_47 (22) = happyShift action_29
action_47 (23) = happyShift action_30
action_47 (24) = happyShift action_31
action_47 _ = happyReduce_25

action_48 (21) = happyShift action_28
action_48 (22) = happyShift action_29
action_48 (23) = happyShift action_30
action_48 (24) = happyShift action_31
action_48 _ = happyReduce_24

action_49 (21) = happyShift action_28
action_49 (22) = happyShift action_29
action_49 (23) = happyShift action_30
action_49 (24) = happyShift action_31
action_49 _ = happyReduce_23

action_50 (21) = happyShift action_28
action_50 (22) = happyShift action_29
action_50 (23) = happyShift action_30
action_50 (24) = happyShift action_31
action_50 (33) = happyShift action_40
action_50 (34) = happyShift action_41
action_50 (35) = happyShift action_42
action_50 _ = happyReduce_22

action_51 (21) = happyShift action_28
action_51 (22) = happyShift action_29
action_51 (23) = happyShift action_30
action_51 (24) = happyShift action_31
action_51 (33) = happyShift action_40
action_51 (34) = happyShift action_41
action_51 (35) = happyShift action_42
action_51 _ = happyReduce_21

action_52 (21) = happyShift action_28
action_52 (22) = happyShift action_29
action_52 (23) = happyShift action_30
action_52 (24) = happyShift action_31
action_52 (25) = happyFail []
action_52 (26) = happyFail []
action_52 (27) = happyFail []
action_52 (28) = happyFail []
action_52 (29) = happyFail []
action_52 (30) = happyFail []
action_52 (31) = happyShift action_38
action_52 (32) = happyShift action_39
action_52 (33) = happyShift action_40
action_52 (34) = happyShift action_41
action_52 (35) = happyShift action_42
action_52 _ = happyReduce_20

action_53 (21) = happyShift action_28
action_53 (22) = happyShift action_29
action_53 (23) = happyShift action_30
action_53 (24) = happyShift action_31
action_53 (25) = happyFail []
action_53 (26) = happyFail []
action_53 (27) = happyFail []
action_53 (28) = happyFail []
action_53 (29) = happyFail []
action_53 (30) = happyFail []
action_53 (31) = happyShift action_38
action_53 (32) = happyShift action_39
action_53 (33) = happyShift action_40
action_53 (34) = happyShift action_41
action_53 (35) = happyShift action_42
action_53 _ = happyReduce_19

action_54 (21) = happyShift action_28
action_54 (22) = happyShift action_29
action_54 (23) = happyShift action_30
action_54 (24) = happyShift action_31
action_54 (25) = happyFail []
action_54 (26) = happyFail []
action_54 (27) = happyFail []
action_54 (28) = happyFail []
action_54 (29) = happyFail []
action_54 (30) = happyFail []
action_54 (31) = happyShift action_38
action_54 (32) = happyShift action_39
action_54 (33) = happyShift action_40
action_54 (34) = happyShift action_41
action_54 (35) = happyShift action_42
action_54 _ = happyReduce_18

action_55 (21) = happyShift action_28
action_55 (22) = happyShift action_29
action_55 (23) = happyShift action_30
action_55 (24) = happyShift action_31
action_55 (25) = happyFail []
action_55 (26) = happyFail []
action_55 (27) = happyFail []
action_55 (28) = happyFail []
action_55 (29) = happyFail []
action_55 (30) = happyFail []
action_55 (31) = happyShift action_38
action_55 (32) = happyShift action_39
action_55 (33) = happyShift action_40
action_55 (34) = happyShift action_41
action_55 (35) = happyShift action_42
action_55 _ = happyReduce_17

action_56 (21) = happyShift action_28
action_56 (22) = happyShift action_29
action_56 (23) = happyShift action_30
action_56 (24) = happyShift action_31
action_56 (25) = happyFail []
action_56 (26) = happyFail []
action_56 (27) = happyFail []
action_56 (28) = happyFail []
action_56 (29) = happyFail []
action_56 (30) = happyFail []
action_56 (31) = happyShift action_38
action_56 (32) = happyShift action_39
action_56 (33) = happyShift action_40
action_56 (34) = happyShift action_41
action_56 (35) = happyShift action_42
action_56 _ = happyReduce_16

action_57 (21) = happyShift action_28
action_57 (22) = happyShift action_29
action_57 (23) = happyShift action_30
action_57 (24) = happyShift action_31
action_57 (25) = happyFail []
action_57 (26) = happyFail []
action_57 (27) = happyFail []
action_57 (28) = happyFail []
action_57 (29) = happyFail []
action_57 (30) = happyFail []
action_57 (31) = happyShift action_38
action_57 (32) = happyShift action_39
action_57 (33) = happyShift action_40
action_57 (34) = happyShift action_41
action_57 (35) = happyShift action_42
action_57 _ = happyReduce_15

action_58 (21) = happyShift action_28
action_58 (22) = happyShift action_29
action_58 _ = happyReduce_27

action_59 (21) = happyShift action_28
action_59 (22) = happyShift action_29
action_59 _ = happyReduce_26

action_60 _ = happyReduce_29

action_61 _ = happyReduce_28

action_62 (38) = happyShift action_14
action_62 (41) = happyShift action_15
action_62 (43) = happyShift action_16
action_62 (47) = happyShift action_17
action_62 (48) = happyShift action_18
action_62 (49) = happyShift action_19
action_62 (50) = happyShift action_20
action_62 (10) = happyGoto action_74
action_62 (11) = happyGoto action_9
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (38) = happyShift action_14
action_63 (41) = happyShift action_15
action_63 (43) = happyShift action_16
action_63 (47) = happyShift action_17
action_63 (48) = happyShift action_18
action_63 (49) = happyShift action_19
action_63 (50) = happyShift action_20
action_63 (10) = happyGoto action_73
action_63 (11) = happyGoto action_9
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (19) = happyShift action_72
action_64 _ = happyReduce_10

action_65 (4) = happyGoto action_71
action_65 _ = happyReduce_2

action_66 _ = happyReduce_38

action_67 (14) = happyGoto action_70
action_67 _ = happyReduce_42

action_68 _ = happyReduce_37

action_69 _ = happyReduce_31

action_70 (38) = happyShift action_14
action_70 (41) = happyShift action_15
action_70 (42) = happyShift action_79
action_70 (43) = happyShift action_16
action_70 (47) = happyShift action_17
action_70 (48) = happyShift action_18
action_70 (49) = happyShift action_19
action_70 (50) = happyShift action_20
action_70 (10) = happyGoto action_78
action_70 (11) = happyGoto action_9
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (15) = happyShift action_10
action_71 (16) = happyShift action_11
action_71 (18) = happyShift action_12
action_71 (20) = happyShift action_13
action_71 (38) = happyShift action_14
action_71 (41) = happyShift action_15
action_71 (43) = happyShift action_16
action_71 (46) = happyShift action_77
action_71 (47) = happyShift action_17
action_71 (48) = happyShift action_18
action_71 (49) = happyShift action_19
action_71 (50) = happyShift action_20
action_71 (5) = happyGoto action_4
action_71 (6) = happyGoto action_5
action_71 (7) = happyGoto action_6
action_71 (8) = happyGoto action_7
action_71 (10) = happyGoto action_8
action_71 (11) = happyGoto action_9
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (45) = happyShift action_65
action_72 (9) = happyGoto action_76
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (21) = happyShift action_28
action_73 (22) = happyShift action_29
action_73 (23) = happyShift action_30
action_73 (24) = happyShift action_31
action_73 (25) = happyShift action_32
action_73 (26) = happyShift action_33
action_73 (27) = happyShift action_34
action_73 (28) = happyShift action_35
action_73 (29) = happyShift action_36
action_73 (30) = happyShift action_37
action_73 (31) = happyShift action_38
action_73 (32) = happyShift action_39
action_73 (33) = happyShift action_40
action_73 (34) = happyShift action_41
action_73 (35) = happyShift action_42
action_73 (36) = happyShift action_43
action_73 (37) = happyShift action_44
action_73 (40) = happyShift action_75
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (21) = happyShift action_28
action_74 (22) = happyShift action_29
action_74 (23) = happyShift action_30
action_74 (24) = happyShift action_31
action_74 (25) = happyShift action_32
action_74 (26) = happyShift action_33
action_74 (27) = happyShift action_34
action_74 (28) = happyShift action_35
action_74 (29) = happyShift action_36
action_74 (30) = happyShift action_37
action_74 (31) = happyShift action_38
action_74 (32) = happyShift action_39
action_74 (33) = happyShift action_40
action_74 (34) = happyShift action_41
action_74 (35) = happyShift action_42
action_74 (36) = happyShift action_43
action_74 (37) = happyShift action_44
action_74 _ = happyReduce_8

action_75 (38) = happyShift action_14
action_75 (41) = happyShift action_15
action_75 (43) = happyShift action_16
action_75 (47) = happyShift action_17
action_75 (48) = happyShift action_18
action_75 (49) = happyShift action_19
action_75 (50) = happyShift action_20
action_75 (10) = happyGoto action_80
action_75 (11) = happyGoto action_9
action_75 _ = happyFail (happyExpListPerState 75)

action_76 _ = happyReduce_11

action_77 _ = happyReduce_12

action_78 (21) = happyShift action_28
action_78 (22) = happyShift action_29
action_78 (23) = happyShift action_30
action_78 (24) = happyShift action_31
action_78 (25) = happyShift action_32
action_78 (26) = happyShift action_33
action_78 (27) = happyShift action_34
action_78 (28) = happyShift action_35
action_78 (29) = happyShift action_36
action_78 (30) = happyShift action_37
action_78 (31) = happyShift action_38
action_78 (32) = happyShift action_39
action_78 (33) = happyShift action_40
action_78 (34) = happyShift action_41
action_78 (35) = happyShift action_42
action_78 (36) = happyShift action_43
action_78 (37) = happyShift action_44
action_78 _ = happyReduce_41

action_79 _ = happyReduce_40

action_80 (21) = happyShift action_28
action_80 (22) = happyShift action_29
action_80 (23) = happyShift action_30
action_80 (24) = happyShift action_31
action_80 (25) = happyShift action_32
action_80 (26) = happyShift action_33
action_80 (27) = happyShift action_34
action_80 (28) = happyShift action_35
action_80 (29) = happyShift action_36
action_80 (30) = happyShift action_37
action_80 (31) = happyShift action_38
action_80 (32) = happyShift action_39
action_80 (33) = happyShift action_40
action_80 (34) = happyShift action_41
action_80 (35) = happyShift action_42
action_80 (36) = happyShift action_43
action_80 (37) = happyShift action_44
action_80 (45) = happyShift action_65
action_80 (9) = happyGoto action_81
action_80 _ = happyFail (happyExpListPerState 80)

action_81 _ = happyReduce_9

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
happyReduction_6 (HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (PrintStmt happy_var_2
	)
happyReduction_6 _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  5 happyReduction_7
happyReduction_7 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn5
		 (Expr happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happyReduce 4 6 happyReduction_8
happyReduction_8 ((HappyAbsSyn10  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexer.Ident happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (VarDecl happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_9 = happyReduce 7 7 happyReduction_9
happyReduction_9 ((HappyAbsSyn9  happy_var_7) `HappyStk`
	(HappyAbsSyn10  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexer.Ident happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (ForLoop happy_var_2 happy_var_4 happy_var_6 happy_var_7
	) `HappyStk` happyRest

happyReduce_10 = happySpecReduce_3  8 happyReduction_10
happyReduction_10 (HappyAbsSyn9  happy_var_3)
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (IfStmt happy_var_2 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happyReduce 5 8 happyReduction_11
happyReduction_11 ((HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	(HappyAbsSyn10  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (IfElseStmt happy_var_2 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_12 = happySpecReduce_3  9 happyReduction_12
happyReduction_12 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (happy_var_2
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  10 happyReduction_13
happyReduction_13 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (AndOp happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  10 happyReduction_14
happyReduction_14 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (OrOp happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  10 happyReduction_15
happyReduction_15 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (EqOp happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  10 happyReduction_16
happyReduction_16 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (NeqOp happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  10 happyReduction_17
happyReduction_17 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (GtOp happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  10 happyReduction_18
happyReduction_18 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (LtOp happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  10 happyReduction_19
happyReduction_19 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (GteOp happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  10 happyReduction_20
happyReduction_20 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (LteOp happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  10 happyReduction_21
happyReduction_21 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (AddOp happy_var_1 happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  10 happyReduction_22
happyReduction_22 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (SubOp happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  10 happyReduction_23
happyReduction_23 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (MulOp happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  10 happyReduction_24
happyReduction_24 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (DivOp happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  10 happyReduction_25
happyReduction_25 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (ModOp happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  10 happyReduction_26
happyReduction_26 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (HJoinOp happy_var_1 happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  10 happyReduction_27
happyReduction_27 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (VJoinOp happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  10 happyReduction_28
happyReduction_28 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (RotateOp happy_var_1 happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  10 happyReduction_29
happyReduction_29 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (ScaleOp happy_var_1 happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_2  10 happyReduction_30
happyReduction_30 (HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (NotOp happy_var_2
	)
happyReduction_30 _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  10 happyReduction_31
happyReduction_31 _
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (happy_var_2
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  10 happyReduction_32
happyReduction_32 (HappyTerminal (Lexer.Ident happy_var_1))
	 =  HappyAbsSyn10
		 (Var happy_var_1
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  10 happyReduction_33
happyReduction_33 (HappyTerminal (Lexer.IntLit happy_var_1))
	 =  HappyAbsSyn10
		 (IntLit happy_var_1
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  10 happyReduction_34
happyReduction_34 _
	 =  HappyAbsSyn10
		 (TrueLit
	)

happyReduce_35 = happySpecReduce_1  10 happyReduction_35
happyReduction_35 _
	 =  HappyAbsSyn10
		 (FalseLit
	)

happyReduce_36 = happySpecReduce_1  10 happyReduction_36
happyReduction_36 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  11 happyReduction_37
happyReduction_37 _
	(HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (TileDef happy_var_2
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_2  12 happyReduction_38
happyReduction_38 (HappyAbsSyn13  happy_var_2)
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_2 : happy_var_1
	)
happyReduction_38 _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_0  12 happyReduction_39
happyReduction_39  =  HappyAbsSyn12
		 ([]
	)

happyReduce_40 = happySpecReduce_3  13 happyReduction_40
happyReduction_40 _
	(HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (happy_var_2
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_2  14 happyReduction_41
happyReduction_41 (HappyAbsSyn10  happy_var_2)
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_2 : happy_var_1
	)
happyReduction_41 _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_0  14 happyReduction_42
happyReduction_42  =  HappyAbsSyn14
		 ([]
	)

happyNewToken action sts stk [] =
	action 51 51 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	Lexer.LetKw -> cont 15;
	Lexer.ForKw -> cont 16;
	Lexer.InKw -> cont 17;
	Lexer.IfKw -> cont 18;
	Lexer.ElseKw -> cont 19;
	Lexer.PrintFn -> cont 20;
	Lexer.RotateOp -> cont 21;
	Lexer.ScaleOp -> cont 22;
	Lexer.HJoinOp -> cont 23;
	Lexer.VJoinOp -> cont 24;
	Lexer.EqOp -> cont 25;
	Lexer.NeqOp -> cont 26;
	Lexer.GtOp -> cont 27;
	Lexer.LtOp -> cont 28;
	Lexer.GteOp -> cont 29;
	Lexer.LteOp -> cont 30;
	Lexer.AddOp -> cont 31;
	Lexer.SubOp -> cont 32;
	Lexer.MulOp -> cont 33;
	Lexer.DivOp -> cont 34;
	Lexer.ModOp -> cont 35;
	Lexer.AndOp -> cont 36;
	Lexer.OrOp -> cont 37;
	Lexer.NotOp -> cont 38;
	Lexer.AssignSym -> cont 39;
	Lexer.RangeSym -> cont 40;
	Lexer.LBracketSym -> cont 41;
	Lexer.RBracketSym -> cont 42;
	Lexer.LParenSym -> cont 43;
	Lexer.RParenSym -> cont 44;
	Lexer.LCurlySym -> cont 45;
	Lexer.RCurlySym -> cont 46;
	Lexer.TrueLit -> cont 47;
	Lexer.FalseLit -> cont 48;
	Lexer.IntLit happy_dollar_dollar -> cont 49;
	Lexer.Ident happy_dollar_dollar -> cont 50;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 51 tk tks = happyError' (tks, explist)
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
    | TileDef [[Expr]]
    | TrueLit
    | FalseLit
    | Var String
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
