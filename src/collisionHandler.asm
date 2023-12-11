INCLUDE Irvine32.inc
INCLUDE Macros.inc
INCLUDE final.inc

.data
rectLeftTop COORD <0,0>
rectRightBottom COORD <0,0>

.code 

checkInvaderCollision PROC USES ecx esi
  LOCAL laserPos:COORD

  ; Set laserPos
  call getLaserPos
  INVOKE setPos, ADDR laserPos, ax, dx

  call getInvaderList
  mov esi, eax ; Move invaderList into esi

  mov ecx, 10
L1:
  .IF _invader.vis == 0
    jmp Continue
  .ENDIF
  
  INVOKE setPos, ADDR rectLeftTop, _invader.currPos.x, _invader.currPos.y

  mov ax, _invader.currPos.x
  add ax, _invader.siz.w
  sub ax, 1
  mov rectRightBottom.x, ax

  mov ax, _invader.currPos.y
  add ax, _invader.siz.h
  sub ax, 1
  mov rectRightBottom.y, ax

  mov ax, rectRightBottom.x
  .IF laserPos.x > ax
    jmp Continue
  .ENDIF
  mov ax, rectLeftTop.x
  .IF laserPos.x < ax
    jmp Continue
  .ENDIF

  mov ax, rectRightBottom.y
  .IF laserPos.y > ax
    jmp Continue
  .ENDIF
  mov ax, rectLeftTop.y
  .IF laserPos.y < ax
    jmp Continue
  .ENDIF

  INVOKE remove2D, _invader.siz, _invader.currPos
  INVOKE remove2D, _invader.siz, _invader.prevPos
  INVOKE setLaserVis, 0
  INVOKE setLaserFired, 0
  mov _invader.vis, 0  
  jmp End_Func
Continue:
  add esi, TYPE INVADER
  dec ecx
  cmp ecx, 0
  jne L1
End_Func:
  ret
checkInvaderCollision ENDP
END