INCLUDE Irvine32.inc
INCLUDE Macros.inc
INCLUDE final.inc

.code
main PROC
  call Clrscr
  call initCannon
  call initInvader
  call initLaser
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
    call fireLaser
  .ENDIF
  .IF ax == ESC_KEY
    jmp End_Func
  .ENDIF

  call showLaser
  call showInvader

  call moveLaser
  call moveInvader

  call checkInvaderCollision
  call invaderFireLaser
  jmp Start
End_Func:
  exit
main ENDP

END main
