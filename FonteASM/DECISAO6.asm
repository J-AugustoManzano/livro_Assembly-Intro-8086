;******************************
;*   Programa: DECISAO6.ASM   *
;******************************

INCLUDE 'emu8086.inc'

org 100h

.DATA
  N    DW  0
  msg1 DB  'Voce entrou o valor 1.', 0
  msg2 DB  'Voce entrou o valor 2.', 0
  msg3 DB  'Voce entrou um valor muito baixo.', 0
  msg4 DB  'Voce entrou um valor muito alto.', 0
  msg5 DB  'Entre um valor numerico: ', 0

.CODE
  LEA      SI, msg5
  CALL     PRINT_STRING
  CALL     SCAN_NUM
  MOV      N, CX
  PUTC     13d
  PUTC     10d
  
  se1:   
    CMP N, 1d
    JNE fim_se1
  entao1:
    LEA  SI, msg1
    CALL PRINT_STRING 
  fim_se1:

  se2:   
    CMP N, 2d
    JNE fim_se2
  entao2:
    LEA  SI, msg2
    CALL PRINT_STRING 
  fim_se2:

  se3:   
    CMP N, 1d
    JGE fim_se3
  entao3:
    LEA  SI, msg3
    CALL PRINT_STRING 
  fim_se3:

  se4:   
    CMP N, 1d
    JLE fim_se4
  entao4:
    LEA  SI, msg4
    CALL PRINT_STRING 
  fim_se4:

  INT      20h
  DEFINE_PRINT_STRING
  DEFINE_SCAN_NUM

END
