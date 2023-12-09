INCLUDE Irvine32.inc
INCLUDE Macros.inc
INCLUDE final.inc

.data

.code
main PROC
  call Clrscr
  call showCannon
Start:
  mov eax, 100
  call Delay
  call ReadKey
  .IF ax == LEFT_KEY
    INVOKE moveCannon, LEFT
  .ENDIF
  .IF ax == RIGHT_KEY
    INVOKE moveCannon, RIGHT
  .ENDIF
  .IF ax == SPACE_KEY
    INVOKE setLaserVis, 1
  .ENDIF
  .IF ax == ESC_KEY
    jmp END_FUNC
  .ENDIF

  call showLaser
  jmp Start
END_FUNC:
  exit
main ENDP

END main
