;*******************************
;*    Programa: CONDIC4.ASM    *
;*******************************

org 100h

.DATA
  msg1 DB 'Entre valor decimal 1 (de 0 ate 9): ', 024h
  msg2 DB 0Dh, 0Ah, 'Entre valor decimal 2 (de 0 ate 9): ', 24h

  msg3 DB 0Dh, 0Ah, 'Soma = ', 24h
  msg4 DB 0Dh, 0Ah, 'Caractere invalido', 24h

.CODE
  LEA   DX, msg1
  CALL  escreva
  CALL  leia
  MOV   BH, AL
  LEA   DX, msg2
  CALL  escreva
  CALL  leia
  MOV   BL, AL

  LEA   DX, msg3 
  CALL  escreva
  XCHG  AX, BX

  ADD   AL, AH
  SUB   AH, AH
  AAA
  MOV   DX, AX
  MOV   AH, 0Eh
  CMP   DH, 0h
  JE    nao_zero
  OR    DH, 30h
  MOV   AL, DH
  INT   10h
  nao_zero:
    OR    DL, 30h
    MOV   AL, DL
    INT   10h
    INT   20h

escreva PROC NEAR
  MOV   AH, 09h
  INT   21h
  RET
escreva ENDP

leia PROC NEAR
  MOV   AH, 01h
  INT   21h
  CMP   AL, 30h
  JL    erro
  CMP   AL, 3Ah
  JGE   erro
  SUB   AL, 30h  
  RET
  erro:
    LEA   DX, msg4
    CALL  escreva
    INT   20h
  RET
leia ENDP
