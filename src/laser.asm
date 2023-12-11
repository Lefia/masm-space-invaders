INCLUDE Irvine32.inc
INCLUDE Macros.inc
INCLUDE final.inc

.data
laser BYTE 0B3h
laserSize DIM <1,1>
laserPrevPos COORD <0,0>
laserCurrPos COORD <0,0>

laserVis DWORD 0
laserFired DWORD 0

.code
; Set if laser is fired
setLaserFired PROC USES eax,
  bool: DWORD

  mov eax, bool
  mov laserFired, eax
  ret
setLaserFired ENDP

; Set the visibility of laser
setLaserVis PROC USES eax,
  bool: DWORD

  mov eax, bool
  mov laserVis, eax
  ret
setLaserVis ENDP

; Check if out of bound
checkLaserBound PROC
  .IF laserCurrPos.y == -1
    mov LaserVis, 0
    mov laserFired, 0
  .ENDIF
  ret
checkLaserBound ENDP

; Show laser on the console
showLaser PROC USES eax
  ; If invisible then pass
  .IF laserVis == 0
    jmp End_Func
  .ENDIF

  ; If is visible and not fired, then print laser upon the cannon
  .IF laserFired == 0
    call getCannonPos
    INVOKE setPos, ADDR laserPrevPos, ax, dx
    INVOKE movePos, ADDR laserPrevPos, 3, -1
    INVOKE setPos, ADDR laserCurrPos, ax, dx
    INVOKE movePos, ADDR laserCurrPos, 3, -1
    mov laserFired, 1
    jmp Print
  .ENDIF

  ; If is visible and fired, then jump to moveLaser
  .IF laserFired == 1
    call moveLaser
    jmp End_Func
  .ENDIF

Print:
  ; Print laser to console
  INVOKE print2D, 
    ADDR laser, 
    laserSize, 
    laserCurrPos
  ret
End_Func:
  ret
showLaser ENDP

; Move laser up to the top
moveLaser PROC
  INVOKE copyPos, ADDR laserPrevPos, laserCurrPos
  dec laserCurrPos.y
  call checkLaserBound

  INVOKE move2D,
    ADDR laser,
    laserSize,
    laserPrevPos,
    laserCurrPos
  ret
moveLaser ENDP

getLaserPos PROC
  mov ax, laserCurrPos.x
  mov dx, laserCurrPos.y
  ret
getLaserPos ENDP
END

