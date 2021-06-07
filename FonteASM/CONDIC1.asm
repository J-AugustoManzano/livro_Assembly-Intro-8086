;*******************************
;*    Programa: CONDIC1.ASM    *
;*******************************

.MODEL small
.STACK 512d

.DATA
  a DB 6d
  b DB 6d
  
.CODE
  MOV  AX, @DATA
  MOV  DS, AX

  MOV  AL, a
  MOV  BL, b

  CMP  AL, BL
  JE   entao
  JMP  fimse

  entao: 
    INC  AL
    CALL apoio
    MOV  DL, AL
    CALL escreva

  fimse: 
    DEC  BL
    CALL apoio
    MOV  DL, BL
    CALL escreva
     
  INT  20h

escreva PROC NEAR
  ADD   DL, 30h
  CMP   DL, 39h
  JLE   valor
  ADD   DL, 07h
  valor:
    INT   21h
  RET  
escreva ENDP

apoio PROC NEAR
  MOV  AH, 02h
  MOV  CL, 04h
  SHR  DL, CL
  RET
apoio ENDP
