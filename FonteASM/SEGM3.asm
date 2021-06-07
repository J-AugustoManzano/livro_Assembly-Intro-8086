TITLE   Teste de Segmento 3

#MAKE_EXE#

DADOS  SEGMENT 'DATA'
         mensagem DB "Ola, Mundo$"
DADOS  ENDS

PILHA  SEGMENT STACK 'STACK'
         DW 0100h DUP(?)
PILHA  ENDS

CODIGO SEGMENT 'CODE'
  INICIO PROC FAR
    MOV     AX, DADOS
    MOV     DS, AX
    MOV     ES, AX

    MOV     DX, OFFSET mensagem

    MOV     AH, 09h
    INT     21h

    MOV     AH, 4Ch
    INT     21h
    RET
  INICIO ENDP
CODIGO ENDS 
END INICIO
