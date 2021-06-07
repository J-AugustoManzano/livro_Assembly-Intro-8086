;*******************************
;*   Programa: APLICASM1.ASM   *
;*******************************

org 100h

.DATA
  I DW 0
  
.CODE

  MOV DL, '0' ; 30h
  MOV I, 1d
  enquanto: 
    CMP I, 10d
    JG fim_enquanto
  faca:
    MOV AH, 02h
    INT 21h
    PUSH AX
    MOV AL, 10d
    MOV AH, 0Eh
    INT 10h     
    POP AX
    PUSH AX
    MOV AL, 13d
    MOV AH, 0Eh
    INT 10h     
    POP AX
    INC DL
    INC I
    JMP enquanto
  fim_enquanto:

  INT 20h
    
END
