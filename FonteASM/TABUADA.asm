;*****************************
;*   Programa: TABUADA.ASM   *
;*****************************

INCLUDE 'emu8086.inc'

org 100h

.DATA

  N DW ?  ; Definição de variáveis para entrada de dados
  I DW 0
  R DW 0
  
  msg1   DB 'Entre o valor de tabuada (1-10): ', 24h 
  msg2   DB ' X ', 0                          
  msg3   DB ' = ', 0 
  msg4   DB 'Entre valores entre 1 e 10.', 0 
  espaco DB ' ', 0                         
                                            
.CODE

  ; //////////////////////
  ; // Entrada de dados //
  ; //////////////////////
  
  LEA  DX, msg1  
  MOV  AH, 09h   
  INT  21h       
  CALL SCAN_NUM  
  MOV  N, CX     
  PUTC 13d
  PUTC 10d

  ; /////////////////////////////////////////////
  ; // Processamento e apresentação da tabuada //
  ; /////////////////////////////////////////////
  
  PUTC 13d
  PUTC 10d
  se1:   
    CMP N, 1d
    JL senao1
  e1:
    CMP N, 10d
    JG senao1
  entao1:   
    MOV I, 1d
    para: 
      CMP I, 10d                                 
      JG fim_para
    faca: 

      MOV  AX, N  ; 
      MOV  BX, I  ; Efetua o cálculo da
      MUL  BX     ; tabuada ==> R = N * I
      MOV  R, AX  ; 

      se2:                ; 
        CMP N, 10d        ; Coloca um espaço em branco
        JGE fim_se2       ; antes do valor da variável N caso a 
      entao2:             ; unidade para tabular o valor
        LEA  SI, espaco   ; com uma dezena seja < 10.
        CALL PRINT_STRING ; Em C = "%2d" e PASCAL = N:2.
      fim_se2:            ; 

      MOV  AX, N     
      CALL PRINT_NUM      ; Escreve o valor N

      LEA  SI, msg2     
      CALL PRINT_STRING   ; Escreve o simbolo X

      se3:                ;
        CMP I, 10d        ; Coloca um espaço em branco
        JGE fim_se3       ; antes do valor da variável I caso a
      entao3:             ; unidade para tabular o valor
        LEA  SI, espaco   ; com uma dezena seja < 10.
        CALL PRINT_STRING ; Em C = "%2d" e PASCAL = N:2.
      fim_se3:            ;

      MOV  AX, I     
      CALL PRINT_NUM      ; Escreve o valor I

      LEA  SI, msg3
      CALL PRINT_STRING   ; Escreve o simbolo =

      se4:                  ;
        CMP R, 100d         ; Coloca um espaço em branco
        JGE fim_se4         ; antes do valor da variável R caso o
        se5:                ; valor a ser apresentado seja < que
          CMP R, 10d        ; uma centena. 
          JGE fim_se5       ; Coloca mais um espaço em branco antes
          LEA  SI, espaco   ; do valor da variável R caso o valor.
          CALL PRINT_STRING ; a ser apresentado seja < que uma dezena.
        fim_se5:            ;
      entao4:               ; 
        LEA  SI, espaco     ; 
        CALL PRINT_STRING   ; Em C = "%3d" e PASCAL = N:3.
      fim_se4:              ;

      MOV  AX, R     
      CALL PRINT_NUM      ; Escreve o valor R

      PUTC 13d
      PUTC 10d
      INC I
      JMP para

    fim_para: 
    JMP fim_se1
  senao1:
    MOV AH, 02h
    MOV DL, 07h ; toca bip      
    int 21h                
    LEA      SI, msg4
    CALL     PRINT_STRING 
  fim_se1:

  INT 20h

  DEFINE_SCAN_NUM
  DEFINE_PRINT_STRING
  DEFINE_PRINT_NUM      
  DEFINE_PRINT_NUM_UNS      

END