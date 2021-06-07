;*****************************
;*    Programa: MEMO7.ASM    *
;*****************************

org 100h

.DATA
  valor DB 05d, 04d, 03d, 02d, 01d

.CODE

  MOV   CX, 05h
  LEA   BX, valor - 02h
  laco:
    MOV   AL, [BX + SI + 02h]
    ADD   AL, 30h
    MOV   AH, 0Eh
    INT   10h     
    INC   SI
  LOOP  laco  
  HLT

END
