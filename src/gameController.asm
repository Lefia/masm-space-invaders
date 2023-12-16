INCLUDE Irvine32.inc
INCLUDE Macros.inc
INCLUDE final.inc

.data
welcomeFrameTop     BYTE  0C9h, 46 DUP(0CDh), 0BBh
welcomeFrameSide    BYTE  0BAh, 46 DUP(' '), 0BAh
welcomeFrameBottom  BYTE  0C8h, 46 DUP(0CDh), 0BCh

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

cannonText BYTE  20h,  20h,  20h, 0DCh,  20h,  20h,  20h
           BYTE 0DEh, 0DCh, 0DBh, 0DBh, 0DBh, 0DCh, 0DDh

dividerText BYTE 42 DUP('-')

startText BYTE "Press <Space> to start"

spaceTextSize DIM <29,6>
invadersTextSize DIM <45,5>
cannonTextSize DIM <7,2>

startTextStatus DWORD 1
welcomeTick DWORD 0
                                                           
.code
showWelcomeScreen PROC
  LOCAL pos:COORD

  ; Print the frame
  INVOKE setPos, ADDR pos, 2, 1
  INVOKE printLine, ADDR welcomeFrameTop, 48, pos
  mov ecx, 26
  .WHILE ecx > 0
    inc pos.y
    INVOKE printLine, ADDR welcomeFrameSide, 48, pos
    dec ecx
  .ENDW
  inc pos.y
  INVOKE printLine, ADDR welcomeFrameBottom, 48, pos

  INVOKE setPos, ADDR pos, 12, 3
  INVOKE print2D, ADDR spaceText, spaceTextSize, pos

  INVOKE setPos, ADDR pos, 3, 8
  INVOKE print2D, ADDR invadersText, invadersTextSize, pos

  INVOKE setPos, ADDR pos, 22, 17
  INVOKE print2D, ADDR cannonText, cannonTextSize, pos

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
END