;*******************************
;*    Programa: SUBTRAI1.ASM   *
;*******************************

.MODEL small
.STACK 512d

.DATA
  a DW 6d 
  b DW 4d
  x DW 0, '$'

.CODE
  MOV   AX, @DATA
  MOV   DS, AX

  MOV   AX, a
  SUB   AX, b
  MOV   x, AX

  ADD   x, 30h
  MOV   DX, OFFSET x

  MOV   AH, 09h
  INT   21h

  MOV   AH, 4Ch
  INT   21h
