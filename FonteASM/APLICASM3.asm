;*******************************
;*   Programa: APLICASM3.ASM   *
;*******************************

org 100h

.DATA
  I DW 0
  
.CODE

  MOV DL, 0Eh
  MOV I, 1d
  para: 
    CMP I, 114d
    JG fim_para
  faca: 
    MOV AH, 02h
    INT 21h
    INC DL
    INC I
    JMP para
  fim_para: 

  INT 20h
    
END
