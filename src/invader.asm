INCLUDE Irvine32.inc
INCLUDE Macros.inc
INCLUDE final.inc

.data 
invader1_1 BYTE 0BFh,  5fh, 5fh,  5fh, 0DAh
           BYTE  2Fh, 0FEh, ' ', 0FEh,  5Ch
           BYTE  7Ch, 0C0h, ' ', 0D9h,  7Ch

invader1_2 BYTE 0BFh,   5fh, 5fh,  5fh, 0DAh
           BYTE  2Fh,  0FEh, ' ', 0FEh,  5Ch
           BYTE  0D9h, 0C0h, ' ', 0D9h, 0C0h

invaderList INVADER 10 DUP(<>)
invaderDir DWORD LEFT
invaderTick DWORD 0

.code
; Initialize the property and position of each invader
initInvader PROC USES esi ecx ebx
  LOCAL pos:COORD

  INVOKE setPos, ADDR pos, 5, 0
  mov esi, OFFSET invaderList
  mov ebx, 0
  mov ecx, 10
L1:
  mov _invader.vis, 1
  mov _invader.var, 1
  mov [esi].INVADER.status, 1
  INVOKE setPos, ADDR _invader.prevPos, pos.x, pos.y
  INVOKE setPos, ADDR _invader.currPos, pos.x, pos.y

  add pos.x, 9
  add esi, TYPE INVADER
  add ebx, 1
  .IF ebx == 5
    mov pos.x, 5
    add pos.y, 4
    mov ebx, 0
  .ENDIF
  loop L1
  ret
initInvader ENDP

showInvader PROC USES esi edi ecx

  ; Print each invader
  mov esi, OFFSET invaderList
  mov ecx, 10
L1:
  .IF _invader.vis == 0
    jmp Continue
  .ENDIF
  .IF _invader.var == 1
    .IF _invader.status == 1
      mov edi, OFFSET invader1_1 
      mov _invader.status, 2 
    .ELSEIF _invader.status == 2
      mov edi, OFFSET invader1_2 
      mov _invader.status, 1
    .ENDIF
  .ENDIF
  INVOKE move2D, edi, _invader.siz, _invader.prevPos, _invader.currPos
Continue:
  add esi, TYPE INVADER
  loop L1
  ret
showInvader ENDP

; Move invaders left and right
moveInvader PROC
  .IF invaderTick < 4
    jmp End_Func
  .ENDIF

  ; move each invader left or right by invaderDir(direction)
  mov esi, OFFSET invaderList
  mov ecx, 10  
L1:
  INVOKE copyPos, ADDR _invader.prevPos, _invader.currPos
  .IF invaderDir == LEFT
    dec _invader.currPos.x
  .ELSEIF invaderDir == RIGHT
    inc _invader.currPos.x
  .ENDIF
  add esi, TYPE INVADER
  loop L1

  ; If out of the bound, then change the direction
  mov esi, OFFSET invaderList
  .IF _invader.currPos == 1
    mov invaderDir, RIGHT
  .ELSEIF _invader.currPos == 9
    mov invaderDir, LEFT
  .ENDIF

  mov invaderTick, 0
  
End_Func: 
  inc invaderTick
  ret
moveInvader ENDP

getInvaderList PROC
  mov eax, OFFSET invaderList 
  ret
getInvaderList ENDP
END