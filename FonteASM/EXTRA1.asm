#make_COM#

; COM file is loaded at CS:0100h
ORG 100h

;******************************
;*    Programa: EXTRA1.ASM    *
;******************************

INCLUDE 'emu8086.inc'

.MODEL small
.STACK 512d

.DATA
  tamanho   EQU 2d
  buffer    DB  tamanho DUP ('x')

.CODE
  entrada:                 ; Efetua a entrada do caractere.   
    PRINT  'Entre um caractere e acione <Enter>: '
    LEA     DI, buffer
    MOV     DX, tamanho
    CALL    GET_STRING
    PUTC   13d
    PUTC   10d 

    PRINT  'O codigo ASCII do caractere ['
    MOV     SI, DI
    CALL    PRINT_STRING
    PRINT  '] em binario equivale a: '

    MOV    AX, [DI]
    MOV    AH, 10000000b   ; mascara para teste do valor binario
    MOV    CX, 08h         ; definicao do contador para 8 bits
    escreve_bit:           ; ROTINA PARA APRESENTACAO DO VALOR BINARIO
      TEST    AL,AH        ; Verifica se registrador AL nao foi modificado.
      JZ      escreve_0    ; Se o bit em teste for zero, escreva-o como 0
      PUTC    '1'          ; caso contrario, escreva 1.
      JMP     proximo_bit  ; Pegar o proximo bit da sequencia
      escreve_0:
        PUTC   '0'         ; escreva 0
      proximo_bit:
      SHR     AH, 01h      ; movimenta um bit da mascara para a direita
    LOOP    escreve_bit    

    PUTC   13d
    PUTC   10d 
    PRINT  'Deseja terminar a execucao do programa (S/N): '    
    LEA    DI, buffer
    MOV    DX, tamanho
    CALL   GET_STRING
    PUTC   13d
    PUTC   10d 
    MOV    AX, [DI]

    CMP    AX, 073h        ; Se for informado o caractere 's',
    JE     pega_maiusc     ; transferme-o em 'S'.
    JNE    pega_normal     ; Caso contrario, mantenha-o como informado.
    pega_maiusc:
      SUB    AX, 020h        
    pega_normal:
    CMP    AX, 053h        ; Se a resposta for diferente de 'S'
    JE     sair            ; encerra o programa.
  JMP    entrada           ; Caso contrario, entre o proximo caractere.
  sair:                        
    HLT

  DEFINE_GET_STRING 
  DEFINE_PRINT_STRING 
END
