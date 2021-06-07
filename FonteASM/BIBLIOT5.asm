;********************************
;*    Programa: BIBLIOT5.ASM    *
;********************************

INCLUDE 'emu8086.inc'

.MODEL small
.STACK 512d

.CODE

  CURSOROFF
  PRINTN    'Sem cursor - tecle algo'

  MOV        AH, 00h
  INT        16h

  CURSORON
  PRINTN     'Com Cursor - tecle algo'

  MOV        AH, 00h
  INT        16h

  INT        20h

END
