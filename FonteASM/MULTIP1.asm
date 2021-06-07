;*******************************
;*    Programa: MULTIP1.ASM    *
;*******************************

.MODEL small
.STACK 512d

.DATA
  a DW 5d 
  b DB 3d
  x DB 0, '$'

.CODE
   MOV   AX, @DATA
   MOV   DS, AX

   MOV   AX, a
   MOV   BL, b
   MUL   BL

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
   INT   021h

   MOV   DL, BL
   AND   DL, 0Fh
   ADD   DL, 30h
   CMP   DL, 39h
   JLE   valor2
   ADD   DL, 07h

valor2:
   INT   21h

   MOV   AH, 04Ch
   INT   21h
