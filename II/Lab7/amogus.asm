ORG  0x1D0

RES: WORD 0x0

CHECK1: WORD 0x0
CHECK2: WORD 0x0
CHECK3: WORD 0x0

R1: WORD 0x0
R2: WORD 0xFFFF
R3: WORD 0x6

ARG1: WORD 0x0
ARG2: WORD 0x0

ARG3: WORD 0xB00B
ARG4: WORD 0x4FF4

ARG5: WORD 0x1337
ARG6: WORD 0xA178

ORG 0x00D1
START:  CALL TEST1
        CALL TEST2
        CALL TEST3
        LD #0x1
        AND CHECK1
        AND CHECK2
        AND CHECK3
        ST RES
STOP:   HLT 

TEST1:  LD ARG1
        PUSH
        LD ARG2
        PUSH
        LD #0x77
        WORD 0x0F01 ; XORSP
        CMP #0x77
        BNE ERROR1
        POP
        ST CHECK1
        CMP R1
        BEQ DONE1
ERROR1: POP
        POP
        CLA
        RET
DONE1:  POP 
        POP 
        LD #0x1
        ST CHECK1
        CLA 
        RET 

TEST2:  LD ARG3
        PUSH
        LD ARG4
        PUSH
        LD #0x77
        WORD 0x0F01 ; XORSP
        CMP #0x77
        BNE ERROR2
        POP
        ST CHECK2
        CMP R2
        BEQ DONE2
ERROR2: POP
        POP
        CLA
        RET
DONE2:  POP 
        POP 
        LD #0x1
        ST CHECK2
        CLA 
        RET 

TEST3:  LD ARG5
        PUSH
        LD ARG6
        PUSH
        LD #0x77
        WORD 0x0F01 ; XORSP
        CMP #0x77
        BNE ERROR3
        POP
        ST CHECK3
        CMP R3
        BEQ DONE3
ERROR3: POP
        POP
        CLA
        RET
DONE3:  POP 
        POP 
        LD #0x1
        ST CHECK3
        CLA 
        RET
