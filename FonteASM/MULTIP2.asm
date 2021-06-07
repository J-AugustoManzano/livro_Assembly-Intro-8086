;*******************************
;*    Programa: MULTIP2.ASM    *
;*******************************

.MODEL small
.STACK 512d

.DATA
  a DW 43551d 
  b DW 65322d
  x DW 0
  y DW 0, '$'

.CODE
   MOV   AX, @DATA
   MOV   DS, AX

   MOV   AX, a
   MOV   BX, b
   MUL   BX

   MOV   x, DX
   MOV   y, AX
   
   SUB   BX, BX
   MOV   BX, x
   CALL  valor1
   CALL  valor2
   
   SUB   BX, BX
   MOV   BX, y
   CALL  valor1
   CALL  valor2

   MOV   AH, 4Ch
   INT   21h

saida PROC NEAR
   ADD   DL, 30h
   CMP   DL, 39h
   JLE   valor
   ADD   DL, 07h
   valor:
     INT   21h
   RET  

saida ENDP

valor1 PROC NEAR
   MOV   AH, 02h
   MOV   DL, BH
   MOV   CL, 04h
   SHR   DL, CL
   CALL  saida
   MOV   DL, BH
   AND   DL, 0Fh
   CALL  saida
   RET
valor1 ENDP   

valor2 PROC NEAR
   MOV   AH, 02h
   MOV   DL, BL
   MOV   CL, 04h
   SHR   DL, CL
   CALL  saida
   MOV   DL, BL
   AND   DL, 0Fh
   CALL  saida
   RET
valor2 ENDP   
