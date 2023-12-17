INCLUDE Irvine32.inc
INCLUDE Macros.inc
INCLUDE final.inc

.data
cannon BYTE 20h, 20h, 20h, 0DCh, 20h, 20h, 20h
       BYTE 0DEh, 0DCh, 0DBh, 0DBh, 0DBh, 0DCh, 0DDh
cannon2 BYTE 20h, 20h, 20h, 0DCh, 20h, 20h, 20h
        BYTE 0BAh, 0DCh, 0B9h, 0B2h, 0DBh, 0DCh, 0DDh
cannon3 BYTE 20h, 20h, 20h, 0DCh, 20h, 20h, 20h
        BYTE 20h, 0DCh, 0B9h, 0B2h, 0F0h, 0DCh, 20h

cannonExplode BYTE 20h, 5Ch, 20h, 7Ch, 20h, 2Fh, 20h
              BYTE 2Dh, 2Dh, 2Dh, 2Ah, 2Dh, 2Dh, 2Dh
              BYTE 20h, 2Fh, 20h, 7Ch, 20h, 5Ch, 20h

cannonSize DIM <7,2>
cannonCurrPos COORD <0,0>
cannonPrevPos COORD <0,0>
cannonStatus DWORD 1

.code
; Check if cannon out of bound
checkCannonBound PROC
  .IF cannonCurrPos.x == -1
    inc cannonCurrPos.x
  .ENDIF
  .IF cannonCurrPos.x == 44
    dec cannonCurrPos.x
  .ENDIF
  ret
checkCannonBound ENDP

; Initialize the cannon
initCannon PROC
  INVOKE setPos, ADDR cannonCurrPos, 23, 25
  INVOKE setPos, ADDR cannonPrevPos, 23, 25
  mov cannonStatus, 1

  INVOKE print2D, 
    ADDR cannon, 
    cannonSize, 
    cannonCurrPos
  ret
initCannon ENDP

showCannon PROC USES esi
  .IF cannonStatus == 1
    mov esi, OFFSET cannon
  .ELSEIF cannonStatus == 2
    mov esi, OFFSET cannon2
  .ELSEIF cannonStatus == 3
    mov esi, OFFSET cannon3
  .ELSEIF cannonStatus == 4
    mov esi, OFFSET cannonExplode
  .ENDIF

  INVOKE move2D, 
    esi, 
    cannonSize, 
    cannonPrevPos,
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
  call showCannon

  ret
moveCannon ENDP

; Get cannon's current position
getCannonPos PROC
  mov ax, cannonCurrPos.x
  mov dx, cannonCurrPos.y
  ret
getCannonPos ENDP

; Get cannon's size
getCannonSize PROC
  mov ax, cannonSize.w
  mov dx, cannonSize.h
  ret
getCannonSize ENDP

getCannonStatus PROC
  mov eax, cannonStatus
  ret
getCannonStatus ENDP

setCannonStatus PROC USES eax,
 status:DWORD
 mov eax, status
 mov cannonStatus, eax
 ret
setCannonStatus ENDP
END
