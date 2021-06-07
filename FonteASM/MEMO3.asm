;*****************************
;* Programa: MEMO3.ASM       *
;*****************************

org 100h

.DATA
valor DB 05d, 04d, 03d, 02d, 01d

.CODE

  MOV CX, 05h
  laco:
    MOV AL, valor[BX]
    ADD AL, 30h
    MOV AH, 0Eh
    INT 10h 
    INC BX
  LOOP laco 
  HLT

END
