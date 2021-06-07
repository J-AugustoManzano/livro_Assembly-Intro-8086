;********************************
;*   Programa: MANIPCAD03.ASM   *
;********************************

INCLUDE 'emu8086.inc'
                                                 
org 100h

.DATA

  msg1e   DB  'Entre uma cadeia de caracteres ....: ', 0
  msg2e   DB  'Entre apenas um carcatere .........: ', 0
  msg3s   DB  'A cadeia possui o caractere informado.', 0
  msg4s   DB  'O caractere nao existe na cadeia.', 0

  cadeia1 DB 30d DUP ('x') 
  cadeia2 DB 01d DUP ('x') 
                                               
.CODE

  ; Ajuste do acesso a memoria

  MOV AX, @DATA
  MOV ES, AX            

  ; Entrada da primeira sequencia de caracteres

  LEA     SI, msg1e
  CALL    PRINT_STRING
  LEA     DI, cadeia1
  MOV     DX, 30d
  CALL    GET_STRING
  PUTC    13d
  PUTC    10d 

  ; Entrada apenas do caractere

  LEA     SI, msg2e
  CALL    PRINT_STRING
  LEA     DI, cadeia2
  MOV     DX, 30d
  CALL    GET_STRING
  PUTC    13d
  PUTC    10d 

  ; Operacao de comparacao da fonte com o destino

  LEA DI, cadeia1   ; fonte
  MOV AL, cadeia2   ; destino
  CLD               ; DF = 0
  MOV CX, 30d       ; tamanho da cadeia
  REPE SCASB        ; repete cada caractere ate 30

  JGE difere
  LEA  SI, msg3s
  CALL PRINT_STRING ; escreve mensagem para condicao verdadeira
  JMP  fim
  difere:
  LEA  SI, msg4s
  CALL PRINT_STRING ; escreve mensagem para condicao falsa 
  fim:
  PUTC    13d
  PUTC    10d 

  INT     20h

  DEFINE_PRINT_STRING
  DEFINE_GET_STRING
END
