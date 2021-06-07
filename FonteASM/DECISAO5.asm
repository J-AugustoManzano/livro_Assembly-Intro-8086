;******************************
;*   Programa: DECISAO5.ASM   *
;******************************

INCLUDE 'emu8086.inc'

org 100h

.DATA
  sexo1   DW  0
  sexo2   DW  0
  msg1    DB  'Informe sexo participante 1 - [1] Masc. ou [2] Fem. : ', 0
  msg2    DB  'Informe sexo participante 2 - [1] Masc. ou [2] Fem. : ', 0
  msg3    DB  'O 1o participante danca com o 2o participante.', 0
  msg4    DB  'O 1o participante nao danca com o 2o participante.', 0

.CODE
  LEA      SI, msg1
  CALL     PRINT_STRING
  CALL     SCAN_NUM
  MOV      sexo1, CX
  PUTC     13d
  PUTC     10d
  
  LEA      SI, msg2
  CALL     PRINT_STRING
  CALL     SCAN_NUM
  MOV      sexo2, CX
  PUTC     13d
  PUTC     10d
  
  se:   
    MOV AX, sexo1
    XOR AX, sexo2
    JE senao
  entao:
    LEA      SI, msg3
    CALL     PRINT_STRING 
    JMP fim_se        
  senao:
    LEA      SI, msg4
    CALL     PRINT_STRING 
  fim_se:

  INT      20h
  DEFINE_PRINT_STRING
  DEFINE_SCAN_NUM

END
