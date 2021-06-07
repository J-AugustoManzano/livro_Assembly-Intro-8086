TITLE   Teste de Segmento 5

#MAKE_EXE#

INCLUDE 'biblio.inc'

DADOS  SEGMENT 'DATA'
         mensagem DB "Ola, Mundo$"
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
    MOV     DX, OFFSET mensagem

    ESCREVA

    MOV     AH, 4Ch
    INT     21h
    RET
  INICIO ENDP
CODIGO ENDS 
END INICIO
