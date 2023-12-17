INCLUDE Irvine32.inc
INCLUDE Macros.inc
INCLUDE final.inc

.data
laserSize DIM <1,1>

laserList LASER 6 DUP(<>)

.code
; Initialize laser owner
initLaser PROC USES esi ecx
  mov esi, OFFSET laserList
  mov _laser.owner, 0

  mov ecx, 6
  .WHILE ecx > 0
    mov _laser.vis, 0
    add esi, TYPE LASER
    dec ecx
  .ENDW
  ret
initLaser ENDP

; Show laser on the console
showLaser PROC USES eax esi ecx
  mov esi, OFFSET laserList
  mov ecx, 6
L1:
  ; If invisible then pass
  .IF _laser.vis == 0
    jmp Continue
  .ENDIF

  INVOKE move2D, 
    ADDR _laser.shape, 
    laserSize, 
    _laser.prevPos,
    _laser.currPos

Continue:
  add esi, TYPE LASER
  loop L1
End_Func:
  ret
showLaser ENDP

moveLaser PROC USES eax esi ecx
  mov esi, OFFSET laserList
  mov ecx, 6
L1:
  .IF _laser.vis == 0
    jmp Continue
  .ENDIF

  INVOKE copyPos, ADDR _laser.prevPos, _laser.currPos
  
  ; Move laser
  .IF _laser.owner == 0
    ; Check if out of bound
    .IF _laser.currPos.y == -1 
      INVOKE removeLaser, esi
      jmp Continue
    .ENDIF

    dec _laser.currPos.y
  .ELSEIF _laser.owner == 1
    .IF _laser.currPos.y == 30 
      INVOKE removeLaser, esi
      jmp Continue
    .ENDIF

    inc _laser.currPos.y
  .ENDIF


Continue:
  add esi, TYPE LASER
  loop L1

  ret
moveLaser ENDP

removeLaser PROC USES esi,
  pLaser:PTR LASER

  mov esi, pLaser
  INVOKE remove2D, laserSize, _laser.currPos
  INVOKE remove2D, laserSize, _laser.prevPos
  mov _laser.vis, 0
  ret
removeLaser ENDP

; Return laserList
getLaserList PROC
  mov eax, OFFSET laserList 
  ret
getLaserList ENDP

; Fire laser from cannon
fireLaser PROC USES eax esi
  LOCAL cannonPos:COORD

  mov esi, OFFSET laserList

  .IF _laser.vis == 1
    jmp End_Func
  .ENDIF

  call getCannonPos
  INVOKE setPos, ADDR cannonPos, ax, dx

  INVOKE copyPos, ADDR _laser.prevPos, cannonPos
  INVOKE movePos, ADDR _laser.prevPos, 3, -1
  INVOKE copyPos, ADDR _laser.currPos, cannonPos
  INVOKE movePos, ADDR _laser.currPos, 3, -1
  
  mov _laser.vis, 1

End_Func:
  ret
fireLaser ENDP

END

