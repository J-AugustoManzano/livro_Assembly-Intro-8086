;********************************
;*    Programa: BIBLIOT3.ASM    *
;********************************

INCLUDE 'emu8086.inc'

.MODEL small
.STACK 512d

.CODE

  GOTOXY     0d, 0d
  PUTC       'A'  
  GOTOXY     1d, 1d
  PUTC       'l'
  GOTOXY     2d, 2d
  PUTC       'o'
  GOTOXY     3d, 3d
  PUTC       ' '
  GOTOXY     4d, 4d
  PUTC       'M'
  GOTOXY     5d, 5d
  PUTC       'u'
  GOTOXY     6d, 6d
  PUTC       'n'
  GOTOXY     7d, 7d
  PUTC       'd'
  GOTOXY     8d, 8d
  PUTC       'o'
  INT        20h
END
