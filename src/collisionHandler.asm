INCLUDE Irvine32.inc
INCLUDE Macros.inc
INCLUDE final.inc

.data
rectTopLeft COORD <0,0>
rectBottomRight COORD <0,0>

.code 

checkInvaderCollision PROC USES eax ebx ecx esi
  LOCAL laserPos:COORD

  ; Set laserPos
  call getLaserList 
  mov esi, eax
  .IF _laser.vis == 0
    jmp End_Func
  .ENDIF

  INVOKE setPos, ADDR laserPos, _laser.currPos.x, _laser.currPos.y

  call getInvaderList
  mov esi, eax ; Move invaderList into esi

  mov ecx, -1
  .REPEAT
    inc ecx

    call getInvaderList
    INVOKE getByIndex, eax, TYPE INVADER, ecx
    mov esi, eax

    .IF _invader.vis == 0
      .CONTINUE
    .ENDIF
    
    ; Determine the top left position and bottom right position of invader
    INVOKE setPos, ADDR rectTopLeft, _invader.currPos.x, _invader.currPos.y

    mov ax, _invader.currPos.x
    add ax, _invader.siz.w
    sub ax, 1
    mov rectBottomRight.x, ax

    mov ax, _invader.currPos.y
    add ax, _invader.siz.h
    sub ax, 1
    mov rectBottomRight.y, ax

    ; Check if laser is overlap with invader
    mov ax, rectBottomRight.x
    .IF laserPos.x > ax
      .CONTINUE
    .ENDIF
    mov ax, rectTopLeft.x
    .IF laserPos.x < ax
      .CONTINUE
    .ENDIF

    mov ax, rectBottomRight.y
    .IF laserPos.y > ax
      .CONTINUE
    .ENDIF
    mov ax, rectTopLeft.y
    .IF laserPos.y < ax
      .CONTINUE
    .ENDIF

    ; If true, then remove the invader
    INVOKE remove2D, _invader.siz, _invader.currPos
    INVOKE remove2D, _invader.siz, _invader.prevPos
    mov _invader.vis, 0  

    ; Remove the laser
    call getLaserList
    INVOKE removeLaser, eax

    ; Decrease the column sum in invaderColSum
    INVOKE modulo, ecx, 5
    mov ebx, eax
    call getInvaderColSum
    INVOKE getByIndex, eax, TYPE DWORD, ebx
    sub DWORD PTR [eax], 1

    ; Add score
    INVOKE addScore

  .UNTIL ecx >= 9 ; From index 0 to 9
End_Func:
  ret
checkInvaderCollision ENDP

checkCannonCollision PROC USES eax esi ecx
  LOCAL cannonPos:COORD
  LOCAL cannonSize:DIM

  
  call getCannonPos
  mov cannonPos.x, ax
  mov cannonPos.y, dx

  call getCannonSize
  mov cannonSize.w, ax
  mov cannonSize.h, dx

  INVOKE setPos, ADDR rectTopLeft, cannonPos.x, cannonPos.y

  mov ax, cannonPos.x
  add ax, cannonSize.w
  sub ax, 1
  mov rectBottomRight.x, ax

  mov ax, cannonPos.y
  add ax, cannonSize.h
  sub ax, 1
  mov rectBottomRight.y, ax

  call getLaserList
  mov esi, eax

  mov ecx, -1
  .REPEAT
    inc ecx
    add esi, TYPE LASER

    .IF _laser.vis == 0
      .CONTINUE
    .ENDIF

    mov ax, rectBottomRight.x
    .IF _laser.currPos.x > ax
      .CONTINUE
    .ENDIF
    mov ax, rectTopLeft.x
    .IF _laser.currPos.x < ax
      .CONTINUE
    .ENDIF

    mov ax, rectBottomRight.y
    .IF _laser.currPos.y > ax
      .CONTINUE
    .ENDIF
    mov ax, rectTopLeft.y
    .IF _laser.currPos.y < ax
      .CONTINUE
    .ENDIF

    INVOKE removeLaser, esi

  .UNTIL ecx >=4
  ret
checkCannonCollision ENDP
END