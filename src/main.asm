INCLUDE Irvine32.inc
INCLUDE Macros.inc
INCLUDE final.inc

.code
main PROC
  call Clrscr

  .WHILE 1
    mov eax, 100
    call Delay
    call ReadKey
    .IF ax == SPACE_KEY
      .BREAK
    .ENDIF
    call showWelcomeScreen
  .ENDW

  call Clrscr
  call initScore
  call initCannon
  call initInvader
  call initLaser
  .WHILE 1
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
      call showGameOverScreen
      .BREAK
    .ENDIF
    call showLaser
    call showInvader
    call showScore
    call showPlayerHP

    call moveLaser
    call moveInvader

    call checkInvaderCollision
    call checkCannonCollision
    call invaderFireLaser

    call getPlayerHP
    .IF eax == 0
      call showGameOverScreen
      .BREAK
    .ENDIF

    call getInvaderCount
    .IF eax == 0
      call showVictoryScreen
      .BREAK
    .ENDIF
  .ENDW

  .WHILE 1
    mov eax, 100
    call Delay
    .IF ax == ESC_KEY
      .BREAK
    .ENDIF
  .ENDW
  exit
main ENDP

END main
