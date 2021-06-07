;*******************************
;*    Programa: DIVIDE1.ASM    *
;*******************************

.MODEL small
.STACK 512d

.DATA
  a DW 9d 
  b DB 2d
  x DB 0, '$'

.CODE
   MOV   AX, @DATA
   MOV   DS, AX

   MOV   AX, a
   MOV   BL, b
   DIV   BL

   MOV   x, AL
   ADD   x, 30h
   MOV   DX, OFFSET x

   MOV   AH, 09h
   INT   21h

   MOV   AH, 04Ch
   INT   21h
