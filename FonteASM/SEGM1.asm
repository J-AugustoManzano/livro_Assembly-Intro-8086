;***************************
;*   Programa: SEGM1.ASM   *
;***************************

org 100h

.DATA
  mensagem DB 'Ola, Mundo$'

.CODE
  LEA DX, mensagem
  MOV AH, 09h
  INT 21h
  INT 20h
