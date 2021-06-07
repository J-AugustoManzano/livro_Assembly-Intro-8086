;*******************************
;*    Programa: CONDIC2.ASM    *
;*******************************

.MODEL small
.STACK 512d

.DATA
  a DB 4d
  b DB 9d
  
.CODE
  MOV  AX, @DATA
  MOV  DS, AX

  MOV  AL, a
  MOV  BL, b

  CMP  AL, BL
  JG   entao
  JLE  senao

  entao: 
    INC  AL
    CALL apoio
    MOV  DL, AL
    CALL escreva
    JMP  fimse

  senao: 
    DEC  BL
    CALL apoio
    MOV  DL, BL
    CALL escreva
    JMP  fimse

  fimse:
    MOV  AH, 4Ch
    INT  21h

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
