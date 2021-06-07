;*******************************
;*    Programa: CONDIC3.ASM    *
;*******************************

org 100h

.DATA
  msg1 DB 'Entre um valor numerico positivo (de 0 ate 9): ', 24h
  msg2 DB 0Dh, 0Ah, 'Valor impar', 24h
  msg3 DB 0Dh, 0Ah, 'Valor par', 24h
  msg4 DB 0Dh, 0Ah, 'Caractere invalido', 24h
  
.CODE
  LEA   DX, msg1
  CALL  escreva

  MOV   AH, 01h
  INT   21h

  CMP   AL, 30h
  JL    erro

  CMP   AL, 39h
  JG    erro

  SUB   AL, 30h  
  AND   AL, 01h
  JPE   par
  JPO   impar

  par:
    LEA   DX, msg3
    CALL  escreva
    JMP   saida
      
  impar: 
    LEA   DX, msg2
    CALL  escreva
    JMP   saida

  erro:
    LEA   DX, msg4
    CALL  escreva
    JMP   saida

  saida:
    INT 20h

escreva PROC NEAR
  MOV   AH, 09h
  INT   21h
  RET
escreva ENDP
