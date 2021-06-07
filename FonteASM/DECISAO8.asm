;******************************
;*   Programa: DECISAO8.ASM   *
;******************************

INCLUDE 'emu8086.inc'

org 100h

.DATA
  N    DW 0
  msg1 DB 'Entre um valor: ', 0
  msg2 DB 'Valor entre 10 e 50.', 0
  msg3 DB 'Valor acima de 50.', 0
  msg4 DB 'Valor abaixo de 10.', 0

.CODE
  LEA      SI, msg1
  CALL     PRINT_STRING
  CALL     SCAN_NUM
  MOV      N, CX
  PUTC     13d
  PUTC     10d

  se1: 
    CMP N, 10d
    JL senao1
  entao1: 
    se2: 
      CMP N, 50d
      JG senao2
    entao2:
      LEA  SI, msg2
      CALL PRINT_STRING 
      JMP fim_se2
    senao2:
      LEA  SI, msg3
      CALL PRINT_STRING 
    fim_se2:
    JMP fim_se1
  senao1:
    LEA  SI, msg4
    CALL PRINT_STRING 
  fim_se1:

  INT      20h
  DEFINE_PRINT_STRING
  DEFINE_SCAN_NUM

END
