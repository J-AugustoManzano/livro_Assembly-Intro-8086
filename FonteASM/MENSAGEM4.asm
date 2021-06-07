;*******************************
;*   Programa: MENSAGEM4.ASM   *
;*******************************

org 100h

.DATA
  mensagem1 DB 'Mensagem 1', 0Dh, 0Ah, 24h
  mensagem2 DB 'Mensagem 2', 0Dh, 0Ah, 24h
  mensagem3 DB 'Mensagem 3', 0Dh, 0Ah, 24h

.CODE
  JMP   salto3

  salto1: 
    LEA   DX, mensagem1
    CALL  escreva
    JMP   saida

  salto2:
    LEA   DX, mensagem2
    CALL  escreva
    JMP   salto1

  salto3: 
    LEA   DX, mensagem3
    CALL  escreva
    JMP   salto2

  saida:
    INT 20h

  escreva PROC NEAR
    MOV   AH, 09h
    INT   21h
    RET
  escreva ENDP
