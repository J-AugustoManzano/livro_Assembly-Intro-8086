#make_COM#

; COM file is loaded at CS:0100h
ORG 100h

;*******************************
;*    Programa: SUBTRA1.ASM    *
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

   ADD   x, 030h
   MOV   DX, OFFSET x

   MOV   AH, 09h
   INT   021h

   MOV   AH, 04Ch
   INT   021h
