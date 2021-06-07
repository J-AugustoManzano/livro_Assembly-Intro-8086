
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

MOV AX, 000Ah
MOV BX, 000Bh
PUSH AX
PUSH BX
CALL procedimento
INC AX
INC BX
CALL procedimento
POP BX
POP AX
INT 20h

procedimento: MOV AX, 0001h
              MOV BX, 0002h
              INC AX
              INC BX
              RET

