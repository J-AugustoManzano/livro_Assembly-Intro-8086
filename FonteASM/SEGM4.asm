TITLE   Teste de Segmento 4

#MAKE_EXE#

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
    MOV     AH, 09h
    INT     021h
    MOV     AH, 4Ch
    INT     21h
    RET
  INICIO ENDP
CODIGO ENDS 
END INICIO
