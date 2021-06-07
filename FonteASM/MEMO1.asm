;*****************************
;*    Programa: MEMO1.ASM    *
;*****************************

.MODEL small
.STACK 512d

.CODE

  MOV    AL, 5d
  MOV    DS:[010Ch], AL
  SUB    AX, AX
  MOV    AL, DS:[010Ch]

  HLT
  
END
