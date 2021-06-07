;*******************************
;*   Programa: TRIANGULO.ASM   *
;*******************************

INCLUDE 'emu8086.inc'

org 100h

.DATA

  A   DW ?  ; Definição de variáveis para entrada de dados
  B   DW ?
  C   DW ?

  msg1 DB           'Entre o valor do lado [A]: ', '$'  ; 0Dh e 0Ah  
  msg2 DB 0Dh, 0Ah, 'Entre o valor do lado [B]: ', '$'  ; são usados
  msg3 DB 0Dh, 0Ah, 'Entre o valor do lado [C]: ', '$'  ; para pular
                                                      ; linhas
  msg4 DB 0Dh, 0Ah, 0Dh, 0Ah, 'Medidas nao formam um triangulo.', 0  
  msg5 DB 0Dh, 0Ah, 0Dh, 0Ah, 'Triangulo isosceles.', 0  
  msg6 DB 0Dh, 0Ah, 0Dh, 0Ah, 'Triangulo equilatero.', 0 
  msg7 DB 0Dh, 0Ah, 0Dh, 0Ah, 'Triangulo escaleno.', 0 
  
.CODE

  ; //////////////////////
  ; // Entrada de dados //
  ; //////////////////////
  
  ; Efetua a entrada do 1o. valor

  LEA  DX, msg1  ; Pega a mensagem da variável msg1
  MOV  AH, 09h   ; Põe 09h na parte baixa de AX
  INT  21h       ; Imprime msg1 de DX por meio do código 09h
  CALL SCAN_NUM  ; Efetua a leitura do valor e põe em CX
  MOV  A, CX     ; Transfere o valor de CX para a variável A
  
  ; Efetua a entrada do 2o. valor

  LEA  DX, msg2  ; Pega a mensagem da variável msg2
  MOV  AH, 09h   
  INT  21h       
  CALL SCAN_NUM  
  MOV  B, CX     ; Transfere o valor de CX para a variável B
  
  ; Efetua a entrada do 3o. valor

  LEA  DX, msg3  ; Pega a mensagem da variável msg3
  MOV  AH, 09h   
  INT  21h       
  CALL SCAN_NUM  
  MOV  C, CX     ; Transfere o valor de CX para a variável C

  ; ////////////////////////////////////////////////
  ; // Verificação se medidas formam um triângulo //
  ; // e efetivação da apresentação das mensagens //
  ; // de saída                                   //
  ; ////////////////////////////////////////////////

  se1:           
    MOV  AX, A  ;   
    MOV  AX, B  ;
    MOV  BX, C  ;
    ADD  BX, AX ; A < B + C
    CMP  AX, BX ;
    JNL  senao1 ;
  e1_1:
    MOV  AX, B  ;   
    MOV  AX, A  ;
    MOV  BX, C  ;
    ADD  BX, AX ; B < A + C
    CMP  AX, BX ;
    JNL  senao1 ;
  e1_2:
    MOV  AX, C  ;   
    MOV  AX, A  ;
    MOV  BX, B  ;
    ADD  BX, AX ; C < A + B
    CMP  AX, BX ;
    JNL  senao1 ;
  entao1:   
    se2:
      MOV  AX, A  ;
      MOV  BX, B  ;
      CMP  AX, BX ; A <> B
      JNE  senao2 ;
    e2_1:
      MOV  AX, B  ;
      MOV  BX, C  ;
      CMP  AX, BX ; B <> C
      JNE  senao2 ;
    entao2:
      LEA  SI, msg6 ; Triangulo equilatero.
      CALL PRINT_STRING 
      JMP  fim_se2
    senao2:
      se3: 
        MOV  AX, A  ;
        MOV  BX, B  ;
        CMP  AX, BX ; A = B
        JE   senao3 ;
      ou3_1:
        MOV  AX, A  ;
        MOV  BX, C  ;
        CMP  AX, BX ; A = C
        JE   senao3 ;
      ou3_2:
        MOV  AX, B  ;
        MOV  BX, C  ;
        CMP  AX, BX ; C = B
        JE   senao3 ;
      entao3:
        LEA  SI, msg7 ; Triangulo escaleno.
        CALL PRINT_STRING 
        JMP fim_se3
      senao3:
        LEA  SI, msg5 ; Triangulo isosceles.
        CALL PRINT_STRING 
      fim_se3:
    fim_se2:
    JMP fim_se1
  senao1:
    LEA  SI, msg4 ; Medidas nao formam um triangulo.
    CALL PRINT_STRING 
  fim_se1:

  INT 20h

  DEFINE_SCAN_NUM
  DEFINE_PRINT_STRING      

END