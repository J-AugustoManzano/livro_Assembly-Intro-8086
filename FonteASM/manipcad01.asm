;********************************
;*   Programa: MANIPCAD01.ASM   *
;********************************

INCLUDE 'emu8086.inc'
                                                 
org 100h

.DATA

  msg1e   DB  'Entre a 1a. cadeia de caracteres .......: ', 0
  msg2e   DB  'Entre a 2a. cadeia de caracteres .......: ', 0
  msg1s   DB  '1a. cadeia de caracteres ...............: ', 0
  msg2s   DB  '2a. cadeia de caracteres ...............: ', 0
  msg3s   DB  'Agora 2a. cadeia de caracteres possui ..: ', 0

  cadeia1 DB 30d DUP ('x') 
  cadeia2 DB 30d DUP ('x') 

.CODE

  ; Ajuste do acesso a memoria

  MOV AX, @DATA
  MOV DS, AX            
  MOV ES, AX            

  ; Entrada da primeira sequencia de caracteres

  LEA     SI, msg1e
  CALL    PRINT_STRING
  LEA     DI, cadeia1
  MOV     DX, 30d
  CALL    GET_STRING
  PUTC    13d
  PUTC    10d 

  ; Saida da primeira sequencia de caracteres em cadeia1

  LEA     SI, msg1s
  CALL    PRINT_STRING
  MOV     SI, DI
  CALL    PRINT_STRING
  PUTC    13d
  PUTC    10d 

  ; Entrada da segunda sequencia de caracteres

  LEA     SI, msg2e
  CALL    PRINT_STRING
  LEA     DI, cadeia2
  MOV     DX, 30d
  CALL    GET_STRING
  PUTC    13d
  PUTC    10d 

  ; Saida da segunda sequencia de caracteres em cadeia2

  LEA     SI, msg2s
  CALL    PRINT_STRING
  MOV     SI, DI
  CALL    PRINT_STRING
  PUTC    13d
  PUTC    10d 

  ; Operacao de copia da fonte para o destino

  LEA SI, cadeia1 ; fonte
  LEA DI, cadeia2 ; destino
  CLD             ; DF = 0
  MOV CX, 30d     ; tamanho da cadeia
  REP MOVSB       ; repete cada caractere ate 30

  ; Saida da primeira sequencia de caracteres em cadeia2

  LEA     SI, msg3s
  CALL    PRINT_STRING
  LEA     DI, cadeia2
  MOV     DX, 30d
  MOV     SI, DI
  CALL    PRINT_STRING
  PUTC    13d
  PUTC    10d 

  INT     20h

  DEFINE_PRINT_STRING
  DEFINE_GET_STRING
END
