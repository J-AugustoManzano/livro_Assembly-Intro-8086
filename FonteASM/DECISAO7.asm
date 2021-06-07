;******************************
;*   Programa: DECISAO7.ASM   *
;******************************

INCLUDE 'emu8086.inc'

org 100h

.DATA
  N     DW 0
  msg00 DB 'Entre um valor numerico: ', 0
  msg01 DB 'Janeiro', 0
  msg02 DB 'Fevereiro', 0
  msg03 DB 'Marco', 0
  msg04 DB 'Abril', 0
  msg05 DB 'Maio', 0
  msg06 DB 'Junho', 0
  msg07 DB 'Julho', 0
  msg08 DB 'Agosto', 0
  msg09 DB 'Setembro', 0
  msg10 DB 'Outubro', 0
  msg11 DB 'Novembro', 0
  msg12 DB 'Dezembro', 0
  msg13 DB 'Valor invalido', 0

.CODE
  LEA      SI, msg00
  CALL     PRINT_STRING
  CALL     SCAN_NUM
  MOV      N, CX
  PUTC     13d
  PUTC     10d

  caso: 
    seja01:
      CMP N, 01d
      JNE seja02
      JE faca01
    faca01:
      LEA SI, msg01
      CALL PRINT_STRING 
      JMP fim_caso
    seja02:
      CMP N, 02d
      JNE seja03
      JE faca02
    faca02:
      LEA SI, msg02
      CALL PRINT_STRING 
      JMP fim_caso
    seja03:
      CMP N, 03d
      JNE seja04
      JE faca03
    faca03:
      LEA SI, msg03
      CALL PRINT_STRING 
      JMP fim_caso
    seja04:
      CMP N, 04d
      JNE seja05
      JE faca04
    faca04:
      LEA SI, msg04
      CALL PRINT_STRING 
      JMP fim_caso
    seja05:
      CMP N, 05d
      JNE seja06
      JE faca05
    faca05:
      LEA SI, msg05
      CALL PRINT_STRING 
      JMP fim_caso
    seja06:
      CMP N, 06d
      JNE seja07
      JE faca06
    faca06:
      LEA SI, msg06
      CALL PRINT_STRING 
      JMP fim_caso
    seja07:
      CMP N, 07d
      JNE seja08
      JE faca07
    faca07:
      LEA SI, msg07
      CALL PRINT_STRING 
      JMP fim_caso
    seja08:
      CMP N, 08d
      JNE seja09
      JE faca08
    faca08:
      LEA SI, msg08
      CALL PRINT_STRING 
      JMP fim_caso
    seja09:
      CMP N, 09d
      JNE seja10
      JE faca09
    faca09:
      LEA SI, msg09
      CALL PRINT_STRING 
      JMP fim_caso
    seja10:
      CMP N, 10d
      JNE seja11
      JE faca10
    faca10:
      LEA SI, msg10
      CALL PRINT_STRING 
      JMP fim_caso
    seja11:
      CMP N, 11d
      JNE seja12
      JE faca11
    faca11:
      LEA SI, msg11
      CALL PRINT_STRING 
      JMP fim_caso
    seja12:
      CMP N, 12d
      JNE senao
      JE faca12
    faca12:
      LEA SI, msg12
      CALL PRINT_STRING 
      JMP fim_caso
    senao:
      LEA SI, msg13
      CALL PRINT_STRING 
  fim_caso:

  INT      20h
  DEFINE_PRINT_STRING
  DEFINE_SCAN_NUM

END
