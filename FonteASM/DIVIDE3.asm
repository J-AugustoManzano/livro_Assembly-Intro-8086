;*******************************
;*    Programa: DIVIDE3.ASM    *
;*******************************

.MODEL small
.STACK 512d

.DATA
  a DW -9d 
  b DB 2d
  x DB 0, '$'

.CODE
   MOV   AX, @DATA
   MOV   DS, AX

   MOV   AX, a
   MOV   BL, b
   IDIV  BL

   MOV   x, AL
   SUB   BX, BX
   MOV   BL, x

   MOV   AH, 02h
   MOV   DL, BL
   MOV   CL, 04h
   SHR   DL, CL
   ADD   DL, 30h
   CMP   DL, 39h
   JLE   valor1
   ADD   DL, 07h

valor1:
   INT   21h

   MOV   DL, BL
   AND   DL, 0Fh
   ADD   DL, 30h
   CMP   DL, 39h
   JLE   valor2
   ADD   DL, 07h

valor2:
   INT   21h

   MOV   AH, 4Ch
   INT   21h
