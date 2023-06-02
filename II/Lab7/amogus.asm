ORG  0x1F1

RE: WORD 0x0

CH1: WORD 0x0
CH2: WORD 0x0
CH3: WORD 0x0

ANS1: WORD 0x0
ANS2: WORD 0xFFFF
ANS3: WORD 0x0006

A1: WORD 0x0
A2: WORD 0x0

A3: WORD 0xB00B
A4: WORD 0x4FF4

A5: WORD 0x1337
A6: WORD 0x0806

ORG 0x0D1
START:  CALL T1
        CALL T2
        CALL T3
        LD #0x1
        AND CH1
        AND CH2
        AND CH3
        ST RE
STOP:   HLT 

T1:  LD A1
        PUSH
        LD A2
        PUSH
        LD #0x77
        WORD 0x0F10 ; XORSP
        CMP #0x77
        BNE ERR1
        POP
        ST CH1
        CMP ANS1
        BEQ DONE1
ERR1: POP
        POP
        CLA
        RET
DONE1:  POP 
        POP 
        LD #0x1
        ST CH1
        CLA 
        RET 

T2:  LD A3
        PUSH
        LD A4
        PUSH
        LD #0x77
        WORD 0x0F10
        CMP #0x77
        BNE ERR2
        POP
        ST CH2
        CMP ANS2
        BEQ DONE2
ERR2: POP
        POP
        CLA
        RET
DONE2:  POP 
        POP 
        LD #0x1
        ST CH2
        CLA 
        RET 

T3:  LD A5
        PUSH
        LD A6
        PUSH
        LD #0x77
        WORD 0x0F10
        CMP #0x77
        BNE ERR3
        POP
        ST CH3
        CMP ANS3
        BEQ DONE3
ERR3: POP
        POP
        CLA
        RET
DONE3:  POP 
        POP 
        LD #0x1
        ST CH3
        CLA 
        RET
