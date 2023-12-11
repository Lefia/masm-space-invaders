INCLUDE Irvine32.inc
INCLUDE Macros.inc
INCLUDE final.inc

.code
main PROC
  call Clrscr
  call showCannon
  call initInvader
  
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
  call showInvader
  
  jmp Start
END_FUNC:
  exit
main ENDP

END main
