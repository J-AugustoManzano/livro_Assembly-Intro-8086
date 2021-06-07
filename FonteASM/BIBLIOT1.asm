;********************************
;*    Programa: BIBLIOT1.ASM    *
;********************************

INCLUDE 'emu8086.inc'

#MAKE_EXE#

.DATA
  msg1 DB 'Entrada e Apresentacao', 0d
  msg2 DB 'Tecle algo para continuar...', 0d
  msg3 DB 'Entre um valor numerico ...: ', 0d

.CODE

  ; Desabilita cursor
  
  CURSOROFF
  
  ; Poe cursor na Coluna = 30 / Linha = 12
  ; armazena msg1 em SI
  ; apresenta o conteudo de msg1 na tela
  
  GOTOXY     29d, 11d
  PRINT      'Programa para Teste'

  ; Poe cursor na Coluna = 01 / Linha = 24
  ; armazena msg2 em SI
  ; apresenta o conteudo de msg2 na tela

  GOTOXY     00d, 23d 
  LEA        SI, msg2       
  CALL       print_string   

  ; Aguarda que algo seja teclado
  
  MOV        AH, 00h
  INT        16h

  ; Habilita cursor
  
  CURSORON

  ; Limpa a tela
  
  CALL       clear_screen 

  ; Poe cursor na Coluna = 29 / Linha = 01
  ; armazena msg1 em SI
  ; apresenta o conteudo de msg1 na tela
  
  GOTOXY     28d, 00d
  LEA        SI, msg1       
  CALL       print_string   

  ; Poe cursor na Coluna = 01 / Linha = 05
  ; armazena msg3 em SI
  ; apresenta o conteudo de msg3 na tela

  GOTOXY     00d, 04d
  LEA        SI, msg3      
  CALL       print_string 

  ; Efetua a entrada de um valor numerico em CX

  CALL       scan_num      

  ; Transfere o valor de CX para AX

  MOV        AX, CX         

  ; Apresenta mensagem de saida

  CALL       pthis
             DB 0Dh, 0Ah, 'Foi fornecido o valor .....: ', 0d

  ; Apresenta o valor armazenado em AX
  CALL       print_num

  ; Finaliza programa

  INT        20h

  ; Rotulos de definicao das operacoes da biblioteca
  DEFINE_SCAN_NUM
  DEFINE_PRINT_STRING
  DEFINE_PRINT_NUM
  DEFINE_PRINT_NUM_UNS  
  DEFINE_PTHIS
  DEFINE_CLEAR_SCREEN
END
