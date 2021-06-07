;*******************************
;*     Programa: LACO2.ASM     *
;*******************************

org 100h

.DATA
  msg1 DB 'Entre valor decimal positivo (de 0 ate 8): ', 24h
  msg2 DB 0Dh, 0Ah, 'Fatorial de ', 24h
  msg3 DB ' equivale a ', 24h
  msg4 DB 0Dh, 0Ah, 'Valor invalido', 24h
  
.CODE
  LEA   DX, msg1
  CALL  mensagem
  CALL  entrada
  PUSH  AX

  LEA   DX, msg2
  CALL  mensagem
  POP   AX
  MOV   DL, AL
  MOV   AH, 0Eh
  INT   10h
  SUB   AL, 30h  
  MOV   CL, AL
  LEA   DX, msg3
  CALL  mensagem
  CALL  fatorial
  CALL  valor

  fim:
    INT   20h

mensagem PROC NEAR
  MOV   AH, 09h
  INT   021h
  RET
mensagem ENDP

entrada PROC NEAR
  MOV    AH, 01h
  INT    021h
  CMP    AL, 030h
  JL     erro
  CMP    AL, 039h
  JGE    erro
  JMP    fim_validacao
  erro:
    LEA    DX, msg4
    CALL   mensagem
    JMP    fim
  fim_validacao:  
  RET  
entrada ENDP

fatorial PROC NEAR
  MOV    AX, 01h
  CMP    CX, 0h
  JE     fim_laco
  repita1:
    MUL    CX
    LOOPNE repita1
  fim_laco:
  RET
fatorial ENDP

valor PROC NEAR
  MOV    BX, 0Ah
  SUB    CX, CX
  repita2:
    SUB    DX, DX
    DIV    BX
    PUSH   DX
    INC    CX
    CMP    AX, 0h
    JNZ    repita2
  saida:
    POP    AX
    ADD    AL, 30h
    MOV    DL, AL
    MOV    AH, 0Eh
    INT    10h
    DEC    CX
    JNBE   saida
    POP    DX
  RET
valor ENDP
