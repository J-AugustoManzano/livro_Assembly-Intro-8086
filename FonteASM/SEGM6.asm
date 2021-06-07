TITLE   Teste de Segmento 6

#MAKE_EXE#

INCLUDE 'biblio.inc'

DADOS  SEGMENT 'DATA'
         msg0 DB "Tecle algo para prosseguir", 0Dh, 0Ah, 24h
         msg1 DB "Ola, Mundo 1", 0Dh, 0Ah, 24h
         msg2 DB "Ola, Mundo 2", 0Dh, 0Ah, 24h
         msg3 DB "Ola, Mundo 3", 0Dh, 0Ah, 24h
DADOS  ENDS

PILHA  SEGMENT STACK 'STACK'
         DW 0100h DUP(?)
PILHA  ENDS

CODIGO SEGMENT 'CODE'
  ASSUME CS:CODIGO, DS:DADOS, SS:PILHA
  INICIO PROC FAR
    MOV     AX, DADOS
    MOV     DS, AX
    MOV     ES, AX

    POSICAO 03, 05
    MOV     DX, OFFSET msg1
    ESCREVA

    POSICAO 20, 01
    MOV     DX, OFFSET msg0
    ESCREVA
    TECLE
    
    POSICAO 07, 10
    MOV     DX, OFFSET msg2
    ESCREVA

    POSICAO 22, 01
    MOV     DX, OFFSET msg0
    ESCREVA
    TECLE
    
    POSICAO 11, 40
    MOV     DX, OFFSET msg3
    ESCREVA

    POSICAO 24, 01
    MOV     DX, OFFSET msg0
    ESCREVA
    CURSORG
    TECLE
    CURSORP

    MOV     AH, 4Ch
    INT     21h
    RET
  INICIO ENDP
CODIGO ENDS 
END INICIO
