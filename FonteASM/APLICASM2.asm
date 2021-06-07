;*******************************
;*   Programa: APLICASM2.ASM   *
;*******************************

INCLUDE 'emu8086.inc'

org 100h

.DATA
  I DW 0
  
.CODE

  MOV DL, 'A' ; 41h
  MOV I, 1d
  repita1: 
    MOV AH, 02h
    INT 21h
    INC DL
    INC I
  ate_que1: 
  CMP I, 26d
  JLE repita1

  PUTC 13d
  PUTC 10d

  MOV DL, 'a' ; 61h
  MOV I, 1d
  repita2: 
    MOV AH, 02h
    INT 21h
    INC DL
    INC I
  ate_que2: 
  CMP I, 26d
  JLE repita2

  INT 20h
    
END
