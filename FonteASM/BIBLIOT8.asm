;********************************
;*    Programa: BIBLIOT8.ASM    *
;********************************

INCLUDE 'emu8086.inc'

org 100h

.DATA
  tamanho  EQU 30d + 1d
  idade    DW  0
  buffer   DB  tamanho DUP ('x')
  msg1     DB  'Entre seu nome ....: ', 0
  msg2     DB  'Entre sua idade ...: ', 0
  msg3     DB  'Ola, ', 0
  msg4     DB  ' voce tem ', 0
  msg5     DB  ' anos.', 0

.CODE
  LEA      SI, msg1
  CALL     PRINT_STRING
  LEA      DI, buffer
  MOV      DX, tamanho
  CALL     GET_STRING
  PUTC     13d
  PUTC     10d 

  LEA      SI, msg2
  CALL     PRINT_STRING
  CALL     SCAN_NUM
  MOV      idade, CX
  PUTC     13d
  PUTC     10d
  
  CALL     CLEAR_SCREEN 

  LEA      SI, msg3
  CALL     PRINT_STRING
  MOV      SI, DI
  CALL     PRINT_STRING
  LEA      SI, msg4
  CALL     PRINT_STRING
  MOV      AX, idade  
  CALL     PRINT_NUM
  LEA      SI, msg5
  CALL     PRINT_STRING

  INT      20h

  DEFINE_PRINT_STRING
  DEFINE_GET_STRING
  DEFINE_SCAN_NUM
  DEFINE_CLEAR_SCREEN
  DEFINE_PRINT_NUM
  DEFINE_PRINT_NUM_UNS
END
