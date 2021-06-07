;********************************
;*    Programa: BIBLIOT2.ASM    *
;********************************

INCLUDE 'emu8086.inc'

.MODEL small
.STACK 512d

.CODE

  PUTC       65d  
  PUTC       154o
  PUTC       06Fh
  PUTC       00100000b
  PUTC       "M"
  PUTC       165o
  PUTC       110d
  PUTC       064h
  PUTC       'o'
  INT        020h

END
