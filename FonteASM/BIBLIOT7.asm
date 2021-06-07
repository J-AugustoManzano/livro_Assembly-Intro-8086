;********************************
;*    Programa: BIBLIOT7.ASM    *
;********************************

INCLUDE 'emu8086.inc'

org 100h

.DATA
  tamanho  EQU 30d + 1d
  buffer   DB  tamanho DUP ('x')

.CODE

  CALL    pthis
          DB 'Entre seu nome: ', 0

  LEA     DI, buffer
  MOV     DX, tamanho
  CALL    GET_STRING
  PUTC    13d
  PUTC    10d 

  CALL    pthis
          DB 'Ola, ', 0

  MOV     SI, DI
  CALL    PRINT_STRING

  INT     20h

  DEFINE_PRINT_STRING
  DEFINE_GET_STRING
  DEFINE_PTHIS
END
