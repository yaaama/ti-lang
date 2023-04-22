{-# OPTIONS_GHC -w #-}
module Parser where

import qualified Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12
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

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,265) ([0,0,0,0,0,0,49152,10,50464,32771,21,35392,7,0,0,0,0,0,0,0,0,0,0,0,0,64512,2047,0,0,0,0,0,0,512,0,0,1024,0,32768,3860,0,0,7721,0,0,15442,0,0,0,0,0,61768,0,0,0,0,0,0,0,0,0,0,0,0,0,65408,16639,0,0,29184,60,0,0,0,64512,2047,0,63488,4095,8,256,0,0,0,32768,0,0,32768,3860,0,0,7721,0,0,15442,0,0,30884,0,0,61768,0,0,58000,1,0,50464,3,0,35392,7,0,5248,15,0,10496,30,0,20992,60,0,41984,120,0,18432,241,0,36864,482,0,8192,965,0,16384,1930,0,32768,3860,32768,16383,0,0,32767,0,0,30,0,0,60,0,0,120,0,0,240,7,0,480,14,0,960,31,0,1920,62,0,3840,124,0,7680,248,0,15360,496,0,30720,992,0,12288,0,0,24576,0,0,0,0,0,0,0,0,0,0,15442,0,0,30884,0,1,0,0,0,0,0,65520,31,0,0,0,0,0,0,0,86,10496,31,0,0,1,65024,5119,0,64512,2047,0,0,36864,482,0,0,0,0,0,0,49152,32767,64,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","Program","Statement","VariableDeclaration","ForLoop","IfStatement","Block","Expression","TileDefinition","RowDefinitions","let","for","in","if","else","print","'~'","'**'","'++'","'::'","'=='","'!='","'>'","'<'","'>='","'<='","'+'","'-'","'*'","'/'","'%'","'&&'","'||'","'!'","'='","'..'","'['","']'","'('","')'","'{'","'}'","true","false","int","id","%eof"]
        bit_start = st Prelude.* 49
        bit_end = (st Prelude.+ 1) Prelude.* 49
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..48]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (4) = happyGoto action_3
action_0 _ = happyReduce_2

action_1 (4) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (13) = happyShift action_10
action_2 (14) = happyShift action_11
action_2 (16) = happyShift action_12
action_2 (18) = happyShift action_13
action_2 (36) = happyShift action_14
action_2 (39) = happyShift action_15
action_2 (41) = happyShift action_16
action_2 (45) = happyShift action_17
action_2 (46) = happyShift action_18
action_2 (47) = happyShift action_19
action_2 (48) = happyShift action_20
action_2 (5) = happyGoto action_4
action_2 (6) = happyGoto action_5
action_2 (7) = happyGoto action_6
action_2 (8) = happyGoto action_7
action_2 (10) = happyGoto action_8
action_2 (11) = happyGoto action_9
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (13) = happyShift action_10
action_3 (14) = happyShift action_11
action_3 (16) = happyShift action_12
action_3 (18) = happyShift action_13
action_3 (36) = happyShift action_14
action_3 (39) = happyShift action_15
action_3 (41) = happyShift action_16
action_3 (45) = happyShift action_17
action_3 (46) = happyShift action_18
action_3 (47) = happyShift action_19
action_3 (48) = happyShift action_20
action_3 (49) = happyAccept
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

action_8 (19) = happyShift action_28
action_8 (20) = happyShift action_29
action_8 (21) = happyShift action_30
action_8 (22) = happyShift action_31
action_8 (23) = happyShift action_32
action_8 (24) = happyShift action_33
action_8 (25) = happyShift action_34
action_8 (26) = happyShift action_35
action_8 (27) = happyShift action_36
action_8 (28) = happyShift action_37
action_8 (29) = happyShift action_38
action_8 (30) = happyShift action_39
action_8 (31) = happyShift action_40
action_8 (32) = happyShift action_41
action_8 (33) = happyShift action_42
action_8 (34) = happyShift action_43
action_8 (35) = happyShift action_44
action_8 _ = happyReduce_7

action_9 _ = happyReduce_36

action_10 (48) = happyShift action_27
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (48) = happyShift action_26
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (36) = happyShift action_14
action_12 (39) = happyShift action_15
action_12 (41) = happyShift action_16
action_12 (45) = happyShift action_17
action_12 (46) = happyShift action_18
action_12 (47) = happyShift action_19
action_12 (48) = happyShift action_20
action_12 (10) = happyGoto action_25
action_12 (11) = happyGoto action_9
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (36) = happyShift action_14
action_13 (39) = happyShift action_15
action_13 (41) = happyShift action_16
action_13 (45) = happyShift action_17
action_13 (46) = happyShift action_18
action_13 (47) = happyShift action_19
action_13 (48) = happyShift action_20
action_13 (10) = happyGoto action_24
action_13 (11) = happyGoto action_9
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (36) = happyShift action_14
action_14 (39) = happyShift action_15
action_14 (41) = happyShift action_16
action_14 (45) = happyShift action_17
action_14 (46) = happyShift action_18
action_14 (47) = happyShift action_19
action_14 (48) = happyShift action_20
action_14 (10) = happyGoto action_23
action_14 (11) = happyGoto action_9
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (12) = happyGoto action_22
action_15 _ = happyReduce_39

action_16 (36) = happyShift action_14
action_16 (39) = happyShift action_15
action_16 (41) = happyShift action_16
action_16 (45) = happyShift action_17
action_16 (46) = happyShift action_18
action_16 (47) = happyShift action_19
action_16 (48) = happyShift action_20
action_16 (10) = happyGoto action_21
action_16 (11) = happyGoto action_9
action_16 _ = happyFail (happyExpListPerState 16)

action_17 _ = happyReduce_34

action_18 _ = happyReduce_35

action_19 _ = happyReduce_33

action_20 _ = happyReduce_32

action_21 (19) = happyShift action_28
action_21 (20) = happyShift action_29
action_21 (21) = happyShift action_30
action_21 (22) = happyShift action_31
action_21 (23) = happyShift action_32
action_21 (24) = happyShift action_33
action_21 (25) = happyShift action_34
action_21 (26) = happyShift action_35
action_21 (27) = happyShift action_36
action_21 (28) = happyShift action_37
action_21 (29) = happyShift action_38
action_21 (30) = happyShift action_39
action_21 (31) = happyShift action_40
action_21 (32) = happyShift action_41
action_21 (33) = happyShift action_42
action_21 (34) = happyShift action_43
action_21 (35) = happyShift action_44
action_21 (42) = happyShift action_68
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (36) = happyShift action_14
action_22 (39) = happyShift action_15
action_22 (40) = happyShift action_67
action_22 (41) = happyShift action_16
action_22 (45) = happyShift action_17
action_22 (46) = happyShift action_18
action_22 (47) = happyShift action_19
action_22 (48) = happyShift action_20
action_22 (10) = happyGoto action_66
action_22 (11) = happyGoto action_9
action_22 _ = happyFail (happyExpListPerState 22)

action_23 _ = happyReduce_30

action_24 (19) = happyShift action_28
action_24 (20) = happyShift action_29
action_24 (21) = happyShift action_30
action_24 (22) = happyShift action_31
action_24 (23) = happyShift action_32
action_24 (24) = happyShift action_33
action_24 (25) = happyShift action_34
action_24 (26) = happyShift action_35
action_24 (27) = happyShift action_36
action_24 (28) = happyShift action_37
action_24 (29) = happyShift action_38
action_24 (30) = happyShift action_39
action_24 (31) = happyShift action_40
action_24 (32) = happyShift action_41
action_24 (33) = happyShift action_42
action_24 (34) = happyShift action_43
action_24 (35) = happyShift action_44
action_24 _ = happyReduce_6

action_25 (19) = happyShift action_28
action_25 (20) = happyShift action_29
action_25 (21) = happyShift action_30
action_25 (22) = happyShift action_31
action_25 (23) = happyShift action_32
action_25 (24) = happyShift action_33
action_25 (25) = happyShift action_34
action_25 (26) = happyShift action_35
action_25 (27) = happyShift action_36
action_25 (28) = happyShift action_37
action_25 (29) = happyShift action_38
action_25 (30) = happyShift action_39
action_25 (31) = happyShift action_40
action_25 (32) = happyShift action_41
action_25 (33) = happyShift action_42
action_25 (34) = happyShift action_43
action_25 (35) = happyShift action_44
action_25 (43) = happyShift action_65
action_25 (9) = happyGoto action_64
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (15) = happyShift action_63
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (37) = happyShift action_62
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (36) = happyShift action_14
action_28 (39) = happyShift action_15
action_28 (41) = happyShift action_16
action_28 (45) = happyShift action_17
action_28 (46) = happyShift action_18
action_28 (47) = happyShift action_19
action_28 (48) = happyShift action_20
action_28 (10) = happyGoto action_61
action_28 (11) = happyGoto action_9
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (36) = happyShift action_14
action_29 (39) = happyShift action_15
action_29 (41) = happyShift action_16
action_29 (45) = happyShift action_17
action_29 (46) = happyShift action_18
action_29 (47) = happyShift action_19
action_29 (48) = happyShift action_20
action_29 (10) = happyGoto action_60
action_29 (11) = happyGoto action_9
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (36) = happyShift action_14
action_30 (39) = happyShift action_15
action_30 (41) = happyShift action_16
action_30 (45) = happyShift action_17
action_30 (46) = happyShift action_18
action_30 (47) = happyShift action_19
action_30 (48) = happyShift action_20
action_30 (10) = happyGoto action_59
action_30 (11) = happyGoto action_9
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (36) = happyShift action_14
action_31 (39) = happyShift action_15
action_31 (41) = happyShift action_16
action_31 (45) = happyShift action_17
action_31 (46) = happyShift action_18
action_31 (47) = happyShift action_19
action_31 (48) = happyShift action_20
action_31 (10) = happyGoto action_58
action_31 (11) = happyGoto action_9
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (36) = happyShift action_14
action_32 (39) = happyShift action_15
action_32 (41) = happyShift action_16
action_32 (45) = happyShift action_17
action_32 (46) = happyShift action_18
action_32 (47) = happyShift action_19
action_32 (48) = happyShift action_20
action_32 (10) = happyGoto action_57
action_32 (11) = happyGoto action_9
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (36) = happyShift action_14
action_33 (39) = happyShift action_15
action_33 (41) = happyShift action_16
action_33 (45) = happyShift action_17
action_33 (46) = happyShift action_18
action_33 (47) = happyShift action_19
action_33 (48) = happyShift action_20
action_33 (10) = happyGoto action_56
action_33 (11) = happyGoto action_9
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (36) = happyShift action_14
action_34 (39) = happyShift action_15
action_34 (41) = happyShift action_16
action_34 (45) = happyShift action_17
action_34 (46) = happyShift action_18
action_34 (47) = happyShift action_19
action_34 (48) = happyShift action_20
action_34 (10) = happyGoto action_55
action_34 (11) = happyGoto action_9
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (36) = happyShift action_14
action_35 (39) = happyShift action_15
action_35 (41) = happyShift action_16
action_35 (45) = happyShift action_17
action_35 (46) = happyShift action_18
action_35 (47) = happyShift action_19
action_35 (48) = happyShift action_20
action_35 (10) = happyGoto action_54
action_35 (11) = happyGoto action_9
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (36) = happyShift action_14
action_36 (39) = happyShift action_15
action_36 (41) = happyShift action_16
action_36 (45) = happyShift action_17
action_36 (46) = happyShift action_18
action_36 (47) = happyShift action_19
action_36 (48) = happyShift action_20
action_36 (10) = happyGoto action_53
action_36 (11) = happyGoto action_9
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (36) = happyShift action_14
action_37 (39) = happyShift action_15
action_37 (41) = happyShift action_16
action_37 (45) = happyShift action_17
action_37 (46) = happyShift action_18
action_37 (47) = happyShift action_19
action_37 (48) = happyShift action_20
action_37 (10) = happyGoto action_52
action_37 (11) = happyGoto action_9
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (36) = happyShift action_14
action_38 (39) = happyShift action_15
action_38 (41) = happyShift action_16
action_38 (45) = happyShift action_17
action_38 (46) = happyShift action_18
action_38 (47) = happyShift action_19
action_38 (48) = happyShift action_20
action_38 (10) = happyGoto action_51
action_38 (11) = happyGoto action_9
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (36) = happyShift action_14
action_39 (39) = happyShift action_15
action_39 (41) = happyShift action_16
action_39 (45) = happyShift action_17
action_39 (46) = happyShift action_18
action_39 (47) = happyShift action_19
action_39 (48) = happyShift action_20
action_39 (10) = happyGoto action_50
action_39 (11) = happyGoto action_9
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (36) = happyShift action_14
action_40 (39) = happyShift action_15
action_40 (41) = happyShift action_16
action_40 (45) = happyShift action_17
action_40 (46) = happyShift action_18
action_40 (47) = happyShift action_19
action_40 (48) = happyShift action_20
action_40 (10) = happyGoto action_49
action_40 (11) = happyGoto action_9
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (36) = happyShift action_14
action_41 (39) = happyShift action_15
action_41 (41) = happyShift action_16
action_41 (45) = happyShift action_17
action_41 (46) = happyShift action_18
action_41 (47) = happyShift action_19
action_41 (48) = happyShift action_20
action_41 (10) = happyGoto action_48
action_41 (11) = happyGoto action_9
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (36) = happyShift action_14
action_42 (39) = happyShift action_15
action_42 (41) = happyShift action_16
action_42 (45) = happyShift action_17
action_42 (46) = happyShift action_18
action_42 (47) = happyShift action_19
action_42 (48) = happyShift action_20
action_42 (10) = happyGoto action_47
action_42 (11) = happyGoto action_9
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (36) = happyShift action_14
action_43 (39) = happyShift action_15
action_43 (41) = happyShift action_16
action_43 (45) = happyShift action_17
action_43 (46) = happyShift action_18
action_43 (47) = happyShift action_19
action_43 (48) = happyShift action_20
action_43 (10) = happyGoto action_46
action_43 (11) = happyGoto action_9
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (36) = happyShift action_14
action_44 (39) = happyShift action_15
action_44 (41) = happyShift action_16
action_44 (45) = happyShift action_17
action_44 (46) = happyShift action_18
action_44 (47) = happyShift action_19
action_44 (48) = happyShift action_20
action_44 (10) = happyGoto action_45
action_44 (11) = happyGoto action_9
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (19) = happyShift action_28
action_45 (20) = happyShift action_29
action_45 (21) = happyShift action_30
action_45 (22) = happyShift action_31
action_45 (23) = happyShift action_32
action_45 (24) = happyShift action_33
action_45 (25) = happyShift action_34
action_45 (26) = happyShift action_35
action_45 (27) = happyShift action_36
action_45 (28) = happyShift action_37
action_45 (29) = happyShift action_38
action_45 (30) = happyShift action_39
action_45 (31) = happyShift action_40
action_45 (32) = happyShift action_41
action_45 (33) = happyShift action_42
action_45 _ = happyReduce_14

action_46 (19) = happyShift action_28
action_46 (20) = happyShift action_29
action_46 (21) = happyShift action_30
action_46 (22) = happyShift action_31
action_46 (23) = happyShift action_32
action_46 (24) = happyShift action_33
action_46 (25) = happyShift action_34
action_46 (26) = happyShift action_35
action_46 (27) = happyShift action_36
action_46 (28) = happyShift action_37
action_46 (29) = happyShift action_38
action_46 (30) = happyShift action_39
action_46 (31) = happyShift action_40
action_46 (32) = happyShift action_41
action_46 (33) = happyShift action_42
action_46 _ = happyReduce_13

action_47 (19) = happyShift action_28
action_47 (20) = happyShift action_29
action_47 (21) = happyShift action_30
action_47 (22) = happyShift action_31
action_47 _ = happyReduce_25

action_48 (19) = happyShift action_28
action_48 (20) = happyShift action_29
action_48 (21) = happyShift action_30
action_48 (22) = happyShift action_31
action_48 _ = happyReduce_24

action_49 (19) = happyShift action_28
action_49 (20) = happyShift action_29
action_49 (21) = happyShift action_30
action_49 (22) = happyShift action_31
action_49 _ = happyReduce_23

action_50 (19) = happyShift action_28
action_50 (20) = happyShift action_29
action_50 (21) = happyShift action_30
action_50 (22) = happyShift action_31
action_50 (31) = happyShift action_40
action_50 (32) = happyShift action_41
action_50 (33) = happyShift action_42
action_50 _ = happyReduce_22

action_51 (19) = happyShift action_28
action_51 (20) = happyShift action_29
action_51 (21) = happyShift action_30
action_51 (22) = happyShift action_31
action_51 (31) = happyShift action_40
action_51 (32) = happyShift action_41
action_51 (33) = happyShift action_42
action_51 _ = happyReduce_21

action_52 (19) = happyShift action_28
action_52 (20) = happyShift action_29
action_52 (21) = happyShift action_30
action_52 (22) = happyShift action_31
action_52 (23) = happyFail []
action_52 (24) = happyFail []
action_52 (25) = happyFail []
action_52 (26) = happyFail []
action_52 (27) = happyFail []
action_52 (28) = happyFail []
action_52 (29) = happyShift action_38
action_52 (30) = happyShift action_39
action_52 (31) = happyShift action_40
action_52 (32) = happyShift action_41
action_52 (33) = happyShift action_42
action_52 _ = happyReduce_20

action_53 (19) = happyShift action_28
action_53 (20) = happyShift action_29
action_53 (21) = happyShift action_30
action_53 (22) = happyShift action_31
action_53 (23) = happyFail []
action_53 (24) = happyFail []
action_53 (25) = happyFail []
action_53 (26) = happyFail []
action_53 (27) = happyFail []
action_53 (28) = happyFail []
action_53 (29) = happyShift action_38
action_53 (30) = happyShift action_39
action_53 (31) = happyShift action_40
action_53 (32) = happyShift action_41
action_53 (33) = happyShift action_42
action_53 _ = happyReduce_19

action_54 (19) = happyShift action_28
action_54 (20) = happyShift action_29
action_54 (21) = happyShift action_30
action_54 (22) = happyShift action_31
action_54 (23) = happyFail []
action_54 (24) = happyFail []
action_54 (25) = happyFail []
action_54 (26) = happyFail []
action_54 (27) = happyFail []
action_54 (28) = happyFail []
action_54 (29) = happyShift action_38
action_54 (30) = happyShift action_39
action_54 (31) = happyShift action_40
action_54 (32) = happyShift action_41
action_54 (33) = happyShift action_42
action_54 _ = happyReduce_18

action_55 (19) = happyShift action_28
action_55 (20) = happyShift action_29
action_55 (21) = happyShift action_30
action_55 (22) = happyShift action_31
action_55 (23) = happyFail []
action_55 (24) = happyFail []
action_55 (25) = happyFail []
action_55 (26) = happyFail []
action_55 (27) = happyFail []
action_55 (28) = happyFail []
action_55 (29) = happyShift action_38
action_55 (30) = happyShift action_39
action_55 (31) = happyShift action_40
action_55 (32) = happyShift action_41
action_55 (33) = happyShift action_42
action_55 _ = happyReduce_17

action_56 (19) = happyShift action_28
action_56 (20) = happyShift action_29
action_56 (21) = happyShift action_30
action_56 (22) = happyShift action_31
action_56 (23) = happyFail []
action_56 (24) = happyFail []
action_56 (25) = happyFail []
action_56 (26) = happyFail []
action_56 (27) = happyFail []
action_56 (28) = happyFail []
action_56 (29) = happyShift action_38
action_56 (30) = happyShift action_39
action_56 (31) = happyShift action_40
action_56 (32) = happyShift action_41
action_56 (33) = happyShift action_42
action_56 _ = happyReduce_16

action_57 (19) = happyShift action_28
action_57 (20) = happyShift action_29
action_57 (21) = happyShift action_30
action_57 (22) = happyShift action_31
action_57 (23) = happyFail []
action_57 (24) = happyFail []
action_57 (25) = happyFail []
action_57 (26) = happyFail []
action_57 (27) = happyFail []
action_57 (28) = happyFail []
action_57 (29) = happyShift action_38
action_57 (30) = happyShift action_39
action_57 (31) = happyShift action_40
action_57 (32) = happyShift action_41
action_57 (33) = happyShift action_42
action_57 _ = happyReduce_15

action_58 (19) = happyShift action_28
action_58 (20) = happyShift action_29
action_58 _ = happyReduce_27

action_59 (19) = happyShift action_28
action_59 (20) = happyShift action_29
action_59 _ = happyReduce_26

action_60 _ = happyReduce_29

action_61 _ = happyReduce_28

action_62 (36) = happyShift action_14
action_62 (39) = happyShift action_15
action_62 (41) = happyShift action_16
action_62 (45) = happyShift action_17
action_62 (46) = happyShift action_18
action_62 (47) = happyShift action_19
action_62 (48) = happyShift action_20
action_62 (10) = happyGoto action_72
action_62 (11) = happyGoto action_9
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (36) = happyShift action_14
action_63 (39) = happyShift action_15
action_63 (41) = happyShift action_16
action_63 (45) = happyShift action_17
action_63 (46) = happyShift action_18
action_63 (47) = happyShift action_19
action_63 (48) = happyShift action_20
action_63 (10) = happyGoto action_71
action_63 (11) = happyGoto action_9
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (17) = happyShift action_70
action_64 _ = happyReduce_10

action_65 (4) = happyGoto action_69
action_65 _ = happyReduce_2

action_66 (19) = happyShift action_28
action_66 (20) = happyShift action_29
action_66 (21) = happyShift action_30
action_66 (22) = happyShift action_31
action_66 (23) = happyShift action_32
action_66 (24) = happyShift action_33
action_66 (25) = happyShift action_34
action_66 (26) = happyShift action_35
action_66 (27) = happyShift action_36
action_66 (28) = happyShift action_37
action_66 (29) = happyShift action_38
action_66 (30) = happyShift action_39
action_66 (31) = happyShift action_40
action_66 (32) = happyShift action_41
action_66 (33) = happyShift action_42
action_66 (34) = happyShift action_43
action_66 (35) = happyShift action_44
action_66 _ = happyReduce_38

action_67 _ = happyReduce_37

action_68 _ = happyReduce_31

action_69 (13) = happyShift action_10
action_69 (14) = happyShift action_11
action_69 (16) = happyShift action_12
action_69 (18) = happyShift action_13
action_69 (36) = happyShift action_14
action_69 (39) = happyShift action_15
action_69 (41) = happyShift action_16
action_69 (44) = happyShift action_75
action_69 (45) = happyShift action_17
action_69 (46) = happyShift action_18
action_69 (47) = happyShift action_19
action_69 (48) = happyShift action_20
action_69 (5) = happyGoto action_4
action_69 (6) = happyGoto action_5
action_69 (7) = happyGoto action_6
action_69 (8) = happyGoto action_7
action_69 (10) = happyGoto action_8
action_69 (11) = happyGoto action_9
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (43) = happyShift action_65
action_70 (9) = happyGoto action_74
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (19) = happyShift action_28
action_71 (20) = happyShift action_29
action_71 (21) = happyShift action_30
action_71 (22) = happyShift action_31
action_71 (23) = happyShift action_32
action_71 (24) = happyShift action_33
action_71 (25) = happyShift action_34
action_71 (26) = happyShift action_35
action_71 (27) = happyShift action_36
action_71 (28) = happyShift action_37
action_71 (29) = happyShift action_38
action_71 (30) = happyShift action_39
action_71 (31) = happyShift action_40
action_71 (32) = happyShift action_41
action_71 (33) = happyShift action_42
action_71 (34) = happyShift action_43
action_71 (35) = happyShift action_44
action_71 (38) = happyShift action_73
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (19) = happyShift action_28
action_72 (20) = happyShift action_29
action_72 (21) = happyShift action_30
action_72 (22) = happyShift action_31
action_72 (23) = happyShift action_32
action_72 (24) = happyShift action_33
action_72 (25) = happyShift action_34
action_72 (26) = happyShift action_35
action_72 (27) = happyShift action_36
action_72 (28) = happyShift action_37
action_72 (29) = happyShift action_38
action_72 (30) = happyShift action_39
action_72 (31) = happyShift action_40
action_72 (32) = happyShift action_41
action_72 (33) = happyShift action_42
action_72 (34) = happyShift action_43
action_72 (35) = happyShift action_44
action_72 _ = happyReduce_8

action_73 (36) = happyShift action_14
action_73 (39) = happyShift action_15
action_73 (41) = happyShift action_16
action_73 (45) = happyShift action_17
action_73 (46) = happyShift action_18
action_73 (47) = happyShift action_19
action_73 (48) = happyShift action_20
action_73 (10) = happyGoto action_76
action_73 (11) = happyGoto action_9
action_73 _ = happyFail (happyExpListPerState 73)

action_74 _ = happyReduce_11

action_75 _ = happyReduce_12

action_76 (19) = happyShift action_28
action_76 (20) = happyShift action_29
action_76 (21) = happyShift action_30
action_76 (22) = happyShift action_31
action_76 (23) = happyShift action_32
action_76 (24) = happyShift action_33
action_76 (25) = happyShift action_34
action_76 (26) = happyShift action_35
action_76 (27) = happyShift action_36
action_76 (28) = happyShift action_37
action_76 (29) = happyShift action_38
action_76 (30) = happyShift action_39
action_76 (31) = happyShift action_40
action_76 (32) = happyShift action_41
action_76 (33) = happyShift action_42
action_76 (34) = happyShift action_43
action_76 (35) = happyShift action_44
action_76 (43) = happyShift action_65
action_76 (9) = happyGoto action_77
action_76 _ = happyFail (happyExpListPerState 76)

action_77 _ = happyReduce_9

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
		 (TileDef happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  11 happyReduction_37
happyReduction_37 _
	(HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (happy_var_2
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_2  12 happyReduction_38
happyReduction_38 (HappyAbsSyn10  happy_var_2)
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_2 : happy_var_1
	)
happyReduction_38 _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_0  12 happyReduction_39
happyReduction_39  =  HappyAbsSyn12
		 ([]
	)

happyNewToken action sts stk [] =
	action 49 49 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	Lexer.LetKw -> cont 13;
	Lexer.ForKw -> cont 14;
	Lexer.InKw -> cont 15;
	Lexer.IfKw -> cont 16;
	Lexer.ElseKw -> cont 17;
	Lexer.PrintFn -> cont 18;
	Lexer.RotateOp -> cont 19;
	Lexer.ScaleOp -> cont 20;
	Lexer.HJoinOp -> cont 21;
	Lexer.VJoinOp -> cont 22;
	Lexer.EqOp -> cont 23;
	Lexer.NeqOp -> cont 24;
	Lexer.GtOp -> cont 25;
	Lexer.LtOp -> cont 26;
	Lexer.GteOp -> cont 27;
	Lexer.LteOp -> cont 28;
	Lexer.AddOp -> cont 29;
	Lexer.SubOp -> cont 30;
	Lexer.MulOp -> cont 31;
	Lexer.DivOp -> cont 32;
	Lexer.ModOp -> cont 33;
	Lexer.AndOp -> cont 34;
	Lexer.OrOp -> cont 35;
	Lexer.NotOp -> cont 36;
	Lexer.AssignSym -> cont 37;
	Lexer.RangeSym -> cont 38;
	Lexer.LBracketSym -> cont 39;
	Lexer.RBracketSym -> cont 40;
	Lexer.LParenSym -> cont 41;
	Lexer.RParenSym -> cont 42;
	Lexer.LCurlySym -> cont 43;
	Lexer.RCurlySym -> cont 44;
	Lexer.TrueLit -> cont 45;
	Lexer.FalseLit -> cont 46;
	Lexer.IntLit happy_dollar_dollar -> cont 47;
	Lexer.Ident happy_dollar_dollar -> cont 48;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 49 tk tks = happyError' (tks, explist)
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
    | TileDef [Expr]
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
