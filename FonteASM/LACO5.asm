;***************************
;*   Programa: LACO5.ASM   *
;***************************

INCLUDE 'emu8086.inc'

org 100h

.DATA
  I    DW 0
  msg1 DB 'Linguagem Assembly', 0
  
.CODE

  MOV I, 1d
  para: 
    CMP I, 5d
    JG fim_para
  faca: 

    LEA  SI, msg1
    CALL PRINT_STRING
    PUTC 13d
    PUTC 10d

    INC I
    JMP para
  fim_para: 

  INT 20h
  DEFINE_PRINT_STRING
    
END
