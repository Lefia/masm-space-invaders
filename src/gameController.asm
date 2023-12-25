INCLUDE Irvine32.inc
INCLUDE Macros.inc
INCLUDE final.inc

.data
welcomeFrameTop     BYTE  0C9h, 46 DUP(0CDh), 0BBh
welcomeFrameSide    BYTE  0BAh, 46 DUP(' '), 0BAh
welcomeFrameBottom  BYTE  0C8h, 46 DUP(0CDh), 0BCh

frameTop     BYTE  0DAh, 40 DUP(0C4h), 0BFh
frameSide    BYTE  0B3h, 40 DUP(' '), 0B3h
frameBottom  BYTE  0C0h, 40 DUP(0C4h), 0D9h

spaceText BYTE 20h, 20h, 20h, 5Fh, 5Fh, 5Fh, 5Fh, 5Fh, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h
          BYTE 20h, 20h, 2Fh, 20h, 5Fh, 5Fh, 5Fh, 2Fh, 5Fh, 5Fh, 5Fh, 5Fh, 20h, 20h, 5Fh, 5Fh, 5Fh, 5Fh, 20h, 5Fh, 5Fh, 5Fh, 5Fh, 5Fh, 5Fh, 5Fh, 5Fh, 5Fh, 20h
          BYTE 20h, 20h, 5Ch, 5Fh, 5Fh, 20h, 5Ch, 2Fh, 20h, 5Fh, 5Fh, 20h, 5Ch, 2Fh, 20h, 5Fh, 5Fh, 20h, 60h, 2Fh, 20h, 5Fh, 5Fh, 5Fh, 2Fh, 20h, 5Fh, 20h, 5Ch 
          BYTE 20h, 5Fh, 5Fh, 5Fh, 2Fh, 20h, 2Fh, 20h, 2Fh, 5Fh, 2Fh, 20h, 2Fh, 20h, 2Fh, 5Fh, 2Fh, 20h, 2Fh, 20h, 2Fh, 5Fh, 5Fh, 2Fh, 20h, 20h, 5Fh, 5Fh, 2Fh 
          BYTE 2Fh, 5Fh, 5Fh, 5Fh, 5Fh, 2Fh, 20h, 2Eh, 5Fh, 5Fh, 5Fh, 2Fh, 5Ch, 5Fh, 5Fh, 2Ch, 5Fh, 2Fh, 5Ch, 5Fh, 5Fh, 5Fh, 2Fh, 5Ch, 5Fh, 5Fh, 5Fh, 2Fh, 20h 
          BYTE 20h, 20h, 20h, 20h, 2Fh, 5Fh, 2Fh, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h 

invadersText BYTE 20h, 20h, 20h, 20h, 5Fh, 5Fh, 5Fh, 5Fh, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 5Fh, 5Fh, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h 
            BYTE 20h, 20h, 20h, 2Fh, 20h, 20h, 5Fh, 2Fh, 5Fh, 5Fh, 5Fh, 20h, 5Fh, 20h, 20h, 20h, 5Fh, 5Fh, 5Fh, 5Fh, 5Fh, 5Fh, 20h, 5Fh, 5Fh, 5Fh, 5Fh, 5Fh, 2Fh, 20h, 2Fh, 5Fh, 5Fh, 20h, 20h, 5Fh, 5Fh, 5Fh, 5Fh, 5Fh, 5Fh, 5Fh, 5Fh, 5Fh, 5Fh 
            BYTE 20h, 20h, 20h, 2Fh, 20h, 2Fh, 2Fh, 20h, 5Fh, 5Fh, 20h, 5Ch, 20h, 7Ch, 20h, 2Fh, 20h, 2Fh, 20h, 5Fh, 5Fh, 20h, 60h, 2Fh, 20h, 5Fh, 5Fh, 20h, 20h, 2Fh, 20h, 5Fh, 20h, 5Ch, 2Fh, 20h, 5Fh, 5Fh, 5Fh, 2Fh, 20h, 5Fh, 5Fh, 5Fh, 2Fh 
            BYTE 20h, 5Fh, 2Fh, 20h, 2Fh, 2Fh, 20h, 2Fh, 20h, 2Fh, 20h, 2Fh, 20h, 7Ch, 2Fh, 20h, 2Fh, 20h, 2Fh, 5Fh, 2Fh, 20h, 2Fh, 20h, 2Fh, 5Fh, 2Fh, 20h, 2Fh, 20h, 20h, 5Fh, 5Fh, 2Fh, 20h, 2Fh, 20h, 20h, 28h, 5Fh, 5Fh, 20h, 20h, 29h, 20h 
            BYTE 2Fh, 5Fh, 5Fh, 5Fh, 2Fh, 5Fh, 2Fh, 20h, 2Fh, 5Fh, 2Fh, 7Ch, 5Fh, 5Fh, 5Fh, 2Fh, 5Ch, 5Fh, 5Fh, 2Ch, 5Fh, 2Fh, 5Ch, 5Fh, 5Fh, 2Ch, 5Fh, 2Fh, 5Ch, 5Fh, 5Fh, 5Fh, 2Fh, 5Fh, 2Fh, 20h, 20h, 2Fh, 5Fh, 5Fh, 5Fh, 5Fh, 2Fh, 20h, 20h 

cannonImg BYTE  20h,  20h,  20h, 0DCh,  20h,  20h,  20h
           BYTE 0DEh, 0DCh, 0DBh, 0DBh, 0DBh, 0DCh, 0DDh

invaderImg_1 BYTE 0BFh,  5fh, 5fh,  5fh, 0DAh
             BYTE  2Fh, 0FEh, ' ', 0FEh,  5Ch
             BYTE  7Ch, 0C0h, ' ', 0D9h,  7Ch

invaderImg_2 BYTE 0BFh,   5fh, 5fh,  5fh, 0DAh
             BYTE  2Fh,  0FEh, ' ', 0FEh,  5Ch
             BYTE  0D9h, 0C0h, ' ', 0D9h, 0C0h

victoryText BYTE 20h, 5Fh, 20h, 20h, 20h, 20h, 5Fh, 5Fh, 5Fh, 20h, 20h, 20h, 20h, 20h, 20h, 5Fh, 5Fh, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h 
            BYTE 7Ch, 20h, 7Ch, 20h, 20h, 2Fh, 20h, 28h, 5Fh, 29h, 5Fh, 5Fh, 5Fh, 5Fh, 2Fh, 20h, 2Fh, 5Fh, 5Fh, 5Fh, 5Fh, 5Fh, 20h, 20h, 5Fh, 5Fh, 5Fh, 5Fh, 5Fh, 5Fh, 5Fh, 20h, 20h, 5Fh, 5Fh 
            BYTE 7Ch, 20h, 7Ch, 20h, 2Fh, 20h, 2Fh, 20h, 2Fh, 20h, 5Fh, 5Fh, 5Fh, 2Fh, 20h, 5Fh, 5Fh, 2Fh, 20h, 5Fh, 5Fh, 20h, 5Ch, 2Fh, 20h, 5Fh, 5Fh, 5Fh, 2Fh, 20h, 2Fh, 20h, 2Fh, 20h, 2Fh 
            BYTE 7Ch, 20h, 7Ch, 2Fh, 20h, 2Fh, 20h, 2Fh, 20h, 2Fh, 5Fh, 5Fh, 2Fh, 20h, 2Fh, 5Fh, 2Fh, 20h, 2Fh, 5Fh, 2Fh, 20h, 2Fh, 20h, 2Fh, 20h, 20h, 2Fh, 20h, 2Fh, 5Fh, 2Fh, 20h, 2Fh, 20h 
            BYTE 7Ch, 5Fh, 5Fh, 5Fh, 2Fh, 5Fh, 2Fh, 5Ch, 5Fh, 5Fh, 5Fh, 2Fh, 5Ch, 5Fh, 5Fh, 2Fh, 5Ch, 5Fh, 5Fh, 5Fh, 5Fh, 2Fh, 5Fh, 2Fh, 20h, 20h, 20h, 5Ch, 5Fh, 5Fh, 2Ch, 20h, 2Fh, 20h, 20h 
            BYTE 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 2Fh, 5Fh, 5Fh, 5Fh, 5Fh, 2Fh, 20h, 20h, 20h 

gameText BYTE 20h, 20h, 20h, 5Fh, 5Fh, 5Fh, 5Fh, 5Fh, 5Fh, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h 
         BYTE 20h, 20h, 2Fh, 20h, 5Fh, 5Fh, 5Fh, 5Fh, 2Fh, 5Fh, 5Fh, 5Fh, 20h, 5Fh, 5Fh, 5Fh, 5Fh, 5Fh, 20h, 5Fh, 5Fh, 5Fh, 20h, 20h, 5Fh, 5Fh, 5Fh, 20h 
         BYTE 20h, 2Fh, 20h, 2Fh, 20h, 5Fh, 5Fh, 2Fh, 20h, 5Fh, 5Fh, 20h, 60h, 2Fh, 20h, 5Fh, 5Fh, 20h, 60h, 5Fh, 5Fh, 20h, 5Ch, 2Fh, 20h, 5Fh, 20h, 5Ch 
         BYTE 2Fh, 20h, 2Fh, 5Fh, 2Fh, 20h, 2Fh, 20h, 2Fh, 5Fh, 2Fh, 20h, 2Fh, 20h, 2Fh, 20h, 2Fh, 20h, 2Fh, 20h, 2Fh, 20h, 2Fh, 20h, 20h, 5Fh, 5Fh, 2Fh 
         BYTE 5Ch, 5Fh, 5Fh, 5Fh, 5Fh, 2Fh, 5Ch, 5Fh, 5Fh, 2Ch, 5Fh, 2Fh, 5Fh, 2Fh, 20h, 2Fh, 5Fh, 2Fh, 20h, 2Fh, 5Fh, 2Fh, 5Ch, 5Fh, 5Fh, 5Fh, 2Fh, 20h 

overText BYTE 20h, 20h, 20h, 5Fh, 5Fh, 5Fh, 5Fh, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h 
         BYTE 20h, 20h, 2Fh, 20h, 5Fh, 5Fh, 20h, 5Ch, 5Fh, 20h, 20h, 20h, 5Fh, 5Fh, 5Fh, 5Fh, 5Fh, 20h, 20h, 5Fh, 5Fh, 5Fh, 5Fh, 5Fh 
         BYTE 20h, 2Fh, 20h, 2Fh, 20h, 2Fh, 20h, 2Fh, 20h, 7Ch, 20h, 2Fh, 20h, 2Fh, 20h, 5Fh, 20h, 5Ch, 2Fh, 20h, 5Fh, 5Fh, 5Fh, 2Fh 
         BYTE 2Fh, 20h, 2Fh, 5Fh, 2Fh, 20h, 2Fh, 7Ch, 20h, 7Ch, 2Fh, 20h, 2Fh, 20h, 20h, 5Fh, 5Fh, 2Fh, 20h, 2Fh, 20h, 20h, 20h, 20h 
         BYTE 5Ch, 5Fh, 5Fh, 5Fh, 5Fh, 2Fh, 20h, 7Ch, 5Fh, 5Fh, 5Fh, 2Fh, 5Ch, 5Fh, 5Fh, 5Fh, 2Fh, 5Fh, 2Fh, 20h, 20h, 20h, 20h, 20h 

restartButton BYTE 0DAh,9 DUP(0C4h), 0BFh
              BYTE 0B3h, 20h, "restart", 20h, 0B3h
              BYTE 0C0h, 9 DUP(0C4h), 0D9h

activeRestartButton BYTE 0C9h,9 DUP(0CDh), 0BBh
                    BYTE 0BAh, 20h, "restart", 20h, 0BAh
                    BYTE 0C8h, 9 DUP(0CDh), 0BCh

exitButton BYTE 0DAh ,7 DUP(0C4h), 0BFh
           BYTE 0B3h, " exit  ", 0B3h
           BYTE 0C0h, 7 DUP(0C4h), 0D9h

activeExitButton BYTE 0C9h, 7 DUP(0CDh), 0BBh
                 BYTE 0BAh, " exit  ", 0BAh
                 BYTE 0C8h, 7 DUP(0CDh), 0BCh

dividerText BYTE 42 DUP('-')
startText BYTE "Press <Space> to start"
continueText BYTE "Continue...?"

spaceTextSize DIM <29,6>
invadersTextSize DIM <45,5>
cannonImgSize DIM <7,2>
invaderImgSize DIM <5,3>
victoryTextSize DIM <35,6>
gameTextSize DIM <28,5>
overTextSize DIM <24,5>
restartButtonSize DIM <11,3>
exitButtonSize DIM <9,3>

startTextStatus DWORD 1
welcomeTick DWORD 0
invaderImgTick DWORD 0
                                                           
.code
showWelcomeScreen PROC USES ecx
  LOCAL pos:COORD

  ; Print the frame
  INVOKE setPos, ADDR pos, 2, 1
  INVOKE printLine, ADDR welcomeFrameTop, LENGTHOF welcomeFrameTop, pos
  mov ecx, 26
  .WHILE ecx > 0
    inc pos.y
    INVOKE printLine, ADDR welcomeFrameSide, LENGTHOF welcomeFrameSide, pos
    dec ecx
  .ENDW
  inc pos.y
  INVOKE printLine, ADDR welcomeFrameBottom, LENGTHOF welcomeFrameBottom, pos

  INVOKE setPos, ADDR pos, 12, 3
  INVOKE print2D, ADDR spaceText, spaceTextSize, pos

  INVOKE setPos, ADDR pos, 3, 8
  INVOKE print2D, ADDR invadersText, invadersTextSize, pos

  INVOKE setPos, ADDR pos, 14, 17
  INVOKE print2D, ADDR cannonImg, cannonImgSize, pos

  INVOKE setPos, ADDR pos, 32, 17
  .IF invaderImgTick > 2 
    INVOKE print2D, ADDR invaderImg_2, invaderImgSize, pos
  .ELSE
    INVOKE print2D, ADDR invaderImg_1, invaderImgSize, pos
  .ENDIF
  inc invaderImgTick
  .IF invaderImgTick == 5
    mov invaderImgTick, 0
  .ENDIF

  .IF startTextStatus == 1
    INVOKE setPos, ADDR pos, 4, 21
    INVOKE printLine, ADDR dividerText, LENGTHOF dividerText, pos

    INVOKE setPos, ADDR pos, 15, 22
    INVOKE printLine, ADDR startText, LENGTHOF startText, pos

    INVOKE setPos, ADDR pos, 4, 23
    INVOKE printLine, ADDR dividerText, LENGTHOF dividerText, pos
  .ENDIF

  .IF welcomeTick == 12 && startTextStatus == 1
    mov startTextStatus, 0
    mov welcomeTick, 0
  .ELSEIF welcomeTick == 5 && startTextStatus == 0
    mov startTextStatus, 1
    mov welcomeTick, 0
  .ENDIF
  inc welcomeTick

  ret
showWelcomeScreen ENDP

showVictoryScreen PROC USES ecx
  LOCAL pos:COORD

  call printFrame

  INVOKE setPos, ADDR pos, 10, 8
  INVOKE print2D, ADDR victoryText, victoryTextSize, pos

  INVOKE setPos, ADDR pos, 22, 19
  INVOKE showScore, pos

  ret
showVictoryScreen ENDP

showGameOverScreen PROC USES ecx
  LOCAL pos:COORD

  call printFrame

  INVOKE setPos, ADDR pos, 9, 4
  INVOKE print2D, ADDR gameText, gameTextSize, pos

  INVOKE setPos, ADDR pos, 21, 9
  INVOKE print2D, ADDR overText, overTextSize, pos

  INVOKE setPos, ADDR pos, 22, 19
  INVOKE showScore, pos

  ret
showGameOverScreen ENDP

printFrame PROC
  LOCAL pos:COORD

  ; Print the frame
  INVOKE setPos, ADDR pos, 6,2
  INVOKE printLine, ADDR frameTop, LENGTHOF frameTop, pos
  mov ecx, 20
  .WHILE ecx > 0
    inc pos.y
    INVOKE printLine, ADDR frameSide, LENGTHOF frameSide, pos
    dec ecx
  .ENDW
  inc pos.y
  INVOKE printLine, ADDR frameBottom, LENGTHOF frameBottom, pos
  ret
printFrame ENDP

showOptions PROC
  LOCAL pos:COORD
  LOCAL op:DWORD
  mov op, 2
  
  call printFrame

  .WHILE 1
    mov eax, 100
    call Delay
    call ReadKey

    .IF ax == UP_KEY
      mov op, 2
    .ENDIF
    .IF ax == DOWN_KEY
      mov op, 0
    .ENDIF
    .IF ax == SPACE_KEY || ax == ENTER_KEY
      INVOKE setGameStatus, op
      .BREAK
    .ENDIF
    .IF ax == ESC_KEY
      INVOKE setGameStatus, 1
      call Clrscr
      .BREAK
    .ENDIF
    
    INVOKE setPos, ADDR pos, 22, 8
    INVOKE printLine, ADDR continueText, LENGTHOF continueText, pos
    .IF op == 2
      INVOKE setPos, ADDR pos, 22, 13
      INVOKE print2D, ADDR activeRestartButton, restartButtonSize, pos
      INVOKE setPos, ADDR pos, 23, 17
      INVOKE print2D, ADDR exitButton, exitButtonSize, pos
    .ELSEIF op == 0
      INVOKE setPos, ADDR pos, 22, 13
      INVOKE print2D, ADDR restartButton, restartButtonSize, pos
      INVOKE setPos, ADDR pos, 23, 17
      INVOKE print2D, ADDR activeExitButton, exitButtonSize, pos
    .ENDIF
  .ENDW
  
  ret
showOptions ENDP
END