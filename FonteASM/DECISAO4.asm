;******************************
;*   Programa: DECISAO4.ASM   *
;******************************

INCLUDE 'emu8086.inc'

org 100h

.DATA
  sexo    DW  0
  msg1    DB  'Informe sexo - [1] Masculino ou [2] Feminino: ', 0
  msg2    DB  'Sexo invalido.', 0
  msg3    DB  'Sexo valido.', 0

.CODE
  LEA      SI, msg1
  CALL     PRINT_STRING
  CALL     SCAN_NUM
  MOV      sexo, CX
  PUTC     13d
  PUTC     10d
  
  se:   
    CMP sexo, 1d
    JE senao
  ou:   
    CMP sexo, 2d
    JE senao
  entao:
    LEA      SI, msg2
    CALL     PRINT_STRING 
    JMP fim_se        
  senao:
    LEA      SI, msg3
    CALL     PRINT_STRING 
  fim_se:

  INT      20h
  DEFINE_PRINT_STRING
  DEFINE_SCAN_NUM

END
