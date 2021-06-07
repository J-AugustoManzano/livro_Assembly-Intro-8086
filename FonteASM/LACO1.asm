;*******************************
;*     Programa: LACO1.ASM     *
;*******************************

org 100h

.DATA
  msg DB 'Alo Mundo!', 13d, 12o, 24h

.CODE
  LEA   DX, msg
  MOV   CX, 5d
  MOV   AH, 09h
  laco:
    INT   21h
    LOOP  laco
  INT 20h
