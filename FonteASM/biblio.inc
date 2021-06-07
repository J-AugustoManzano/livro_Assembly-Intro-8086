ESCREVA  MACRO 
  PUSH  AX
  MOV   AH, 9h
  INT   21h     
  POP   AX
ENDM

POSICAO  MACRO linha, coluna
  PUSH  AX
  PUSH  DX
  MOV   AH, linha
  MOV   AL, coluna
  DEC   AH
  DEC   AL
  MOV   DX, AX
  MOV   AH, 02h
  INT   10h    
  POP   DX
  POP   AX
ENDM

TECLE  MACRO
  PUSH  AX
  MOV   AH, 00h
  INT   16h
  POP   AX
ENDM

CURSORG  MACRO
  PUSH  AX
  PUSH  CX
  MOV   AX, 0100h
  MOV   CX, 000Ah
  INT   10h
  POP   CX
  POP   AX
ENDM

CURSORP  MACRO
  PUSH  AX
  PUSH  CX
  MOV   AX, 0100h
  MOV   CX, 0506h
  INT   10h
  POP   AX
  POP   CX
ENDM
