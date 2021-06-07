;*****************************
;*    Programa: MEMO8.ASM    *
;*****************************

INCLUDE 'emu8086.inc'

.DATA
  tamanho EQU 05h
  vetor   DB  tamanho DUP ('X')
  msg1a   DB  'Entre o ', 0h  
  msg1b   DB  'o. valor numerico: ', 0h  
  msg2a   DB  'O ', 0h  
  msg2b   DB  'o. valor informado equivale a: ', 0h  
  valor   DB  ?

.CODE
  PRINTN  'Programa Matriz'
  PRINTN  'Entre valores na faixa de 0 ate 255'
  PUTC 13d
  PUTC 10d

  MOV CX, tamanho
  MOV valor, 01h
  entrada:
    PUSH CX
    LEA  SI, msg1a
    CALL PRINT_STRING
    MOV  AL, valor
    CALL PRINT_NUM
    INC  valor
    LEA  SI, msg1b
    CALL PRINT_STRING
    CALL SCAN_NUM
    MOV vetor[BX], CL
    INC BX
    POP CX
    PUTC 13d
    PUTC 10d
  LOOP entrada 

  PUTC 13d
  PUTC 10d

  MOV CX, tamanho
  MOV valor, 01h
  saida:
    LEA  SI, msg2a
    CALL PRINT_STRING
    MOV  AL, valor
    CALL PRINT_NUM
    INC  valor
    LEA  SI, msg2b
    CALL PRINT_STRING
    MOV AL, vetor[BX - tamanho]
    CALL PRINT_NUM
    INC BX
    PUTC 13d
    PUTC 10d
  LOOP saida 

  HLT
  DEFINE_PRINT_NUM
  DEFINE_PRINT_NUM_UNS
  DEFINE_PRINT_STRING
  DEFINE_SCAN_NUM
END
