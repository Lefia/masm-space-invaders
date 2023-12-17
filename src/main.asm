INCLUDE Irvine32.inc
INCLUDE Macros.inc
INCLUDE final.inc

.data
gameStatus DWORD 0
gameResult DWORD 0
scorePos COORD <3,0>

.code
main PROC
  call Clrscr

  mov gameStatus, 0
  mov gameResult, 0

  .WHILE gameStatus != 1
    mov eax, 100
    call Delay
    call ReadKey
    .IF ax == SPACE_KEY
      mov gameStatus, 1
    .ENDIF
    call showWelcomeScreen
  .ENDW

Start:
  call Clrscr
  call initScore
  call initCannon
  call initInvader
  call initLaser
  .WHILE gameStatus == 1
    mov eax, 100
    call Delay

    call showCannon
    call showLaser
    call showInvader

    call moveLaser
    call moveInvader

    call checkInvaderCollision
    call checkCannonCollision
    call invaderFireLaser

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
      call showOptions
    .ENDIF

    call getPlayerHP
    .IF eax == 0
      mov gameResult, 0
      mov gameStatus, 0
    .ENDIF

    call getInvaderCount
    .IF eax == 0
      mov gameResult, 1
      mov gameStatus, 0
    .ENDIF

    INVOKE showScore, scorePos
    call showPlayerHP
  .ENDW

  .IF gameStatus == 2
    mov gameStatus, 1
    jmp Start
  .ELSEIF gameStatus == 0
    .IF gameResult == 0
      call showGameOverScreen
    .ELSEIF gameResult == 1
      call showVictoryScreen
    .ENDIF
  .ENDIF

  .WHILE 1
    mov eax, 100
    call Delay
    call ReadKey
    .IF ax == ESC_KEY
      .BREAK
    .ENDIF
  .ENDW
  exit
main ENDP

setGameStatus PROC USES eax,
  status:DWORD
  mov eax, status
  mov gameStatus, eax 
  ret
setGameStatus ENDP

END main
