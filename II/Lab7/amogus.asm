ORG  0x069

RE: WORD 0x0

CH1: WORD 0x0
CH2: WORD 0x0
CH3: WORD 0x0

ANS1: WORD 0x0
ANS2: WORD 0xFFFF
ANS3: WORD 0x7D9A

X1: WORD 0x0
X2: WORD 0x0

X3: WORD 0xB00B
X4: WORD 0x4FF4

X5: WORD 0x1337
X6: WORD 0x0806

ORG 0x00D1
START:  CALL $T1
        CALL $T2
        CALL $T3
        LD #0x1
        AND $CH1
        AND $CH2
        AND $CH3
        ST $RE
STOP:   HLT 

T1:  LD $X1
        PUSH
        LD $X2
        PUSH
        LD #0x77
        WORD 0x0F01 ; XORSP
        CMP #0x77
        BNE ERR1
        POP
        ST $CH1
        CMP $ANS1
        BEQ FINISH1
ERR1: POP
        POP
        CLA
        RET
FINISH1:  POP 
        POP 
        LD #0x1
        ST $CH1
        CLA 
        RET 

T2:  LD $X3
        PUSH
        LD $X4
        PUSH
        LD #0x77
        WORD 0x0F01 ; XORSP
        CMP #0x77
        BNE ERR2
        POP
        ST $CH2
        CMP $ANS2
        BEQ FINISH2
ERR2: POP
        POP
        CLA
        RET
FINISH2:  POP 
        POP 
        LD #0x1
        ST $CH2
        CLA 
        RET 

T3:  LD $X5
        PUSH
        LD $X6
        PUSH
        LD #0x77
        WORD 0x0F01 ; XORSP
        CMP #0x77
        BNE ERR3
        POP
        ST $CH3
        CMP $ANS3
        BEQ FINISH3
ERR3: POP
        POP
        CLA
        RET
FINISH3:  POP 
        POP 
        LD #0x1
        ST $CH3
        CLA 
        RET
