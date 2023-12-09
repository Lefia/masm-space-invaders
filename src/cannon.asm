INCLUDE Irvine32.inc
INCLUDE Macros.inc
INCLUDE final.inc

.data
cannon BYTE ' ', ' ', ' ', 0DCh, ' ', ' ', ' '
       BYTE 0DEh, 0DCh, 0DBh, 0DBh, 0DBh, 0DCh, 0DDh
cannonSize DIM <7,2>
cannonCurrPos COORD <0,25>
cannonPrevPos COORD <0,25>

.code
; Check if cannon out of bound
checkCannonBound PROC
  .IF cannonCurrPos.x == -1
    inc cannonCurrPos.x
  .ENDIF
  .IF cannonCurrPos.x == 44
    dec cannonCurrPos.x
  .ENDIF
checkCannonBound ENDP

; Show cannon on current position
showCannon PROC
  INVOKE print2D, 
    ADDR cannon, 
    cannonSize, 
    cannonCurrPos
  ret
showCannon ENDP

; Move cannon left or right
moveCannon PROC,
  Dir: DWORD

  ; Move cannon
  .IF Dir == LEFT
    INVOKE copyPos, ADDR cannonPrevPos, cannonCurrPos
    dec cannonCurrPos.x
  .ENDIF
  .IF Dir == RIGHT
    INVOKE copyPos, ADDR cannonPrevPos, cannonCurrPos
    inc cannonCurrPos.x
  .ENDIF
  
  ; Check Bound
  call checkCannonBound

  ; Move to next position
  INVOKE move2D, 
    ADDR cannon, 
    cannonSize, 
    cannonPrevPos,
    cannonCurrPos
  ret
moveCannon ENDP

; Get cannon's current position
getCannonPos PROC
  mov ax, cannonCurrPos.x
  mov dx, cannonCurrPos.y
  ret
getCannonPos ENDP

END

