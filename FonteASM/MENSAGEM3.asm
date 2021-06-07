
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.DATA
  mensagem DB 41h, 6Ch, 6Fh, 20h, 6Dh, 75h, 6Eh, 64h, 6Fh, 21h, 24h

.CODE
  LEA DX, mensagem
  MOV AH, 09h
  INT 21h
  INT 20h

ret




