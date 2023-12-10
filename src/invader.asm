INCLUDE Irvine32.inc
INCLUDE Macros.inc
INCLUDE final.inc

INVADER STRUCT
  vis DWORD 0
  prevPos COORD <0,0>
  currPos COORD <0,0>
  siz DIM <5,3>
  var DWORD 0
  status DWORD 0
INVADER ENDS

.data 
invader1_1 BYTE 0BFh,  5fh, 5fh,  5fh, 0DAh
           BYTE  2Fh, 0FEh, ' ', 0FEh,  5Ch
           BYTE  7Ch, 0C0h, ' ', 0D9h,  7Ch

invader1_2 BYTE 0BFh,   5fh, 5fh,  5fh, 0DAh
           BYTE  2Fh,  0FEh, ' ', 0FEh,  5Ch
           BYTE  0D9h, 0C0h, ' ', 0D9h, 0C0h

invaderList INVADER 10 DUP(<>)
invaderDir DWORD LEFT

.code
; Initialize the property and position of each invader
initInvader PROC USES esi ecx ebx
  LOCAL pos:COORD

  INVOKE setPos, ADDR pos, 5, 0
  mov esi, OFFSET invaderList
  mov ebx, 0
  mov ecx, 10
L1:
  mov [esi].INVADER.vis, 1
  mov [esi].INVADER.var, 1
  mov [esi].INVADER.status, 1
  INVOKE setPos, ADDR [esi].INVADER.prevPos, pos.x, pos.y
  INVOKE setPos, ADDR [esi].INVADER.currPos, pos.x, pos.y

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
  mov esi, OFFSET invaderList

  ; Print each invader
  mov ecx, 10
L1:
  .IF [esi].INVADER.var == 1
    .IF [esi].INVADER.status == 1
      mov edi, OFFSET invader1_1 
      mov [esi].INVADER.status, 2 
    .ELSEIF [esi].INVADER.status == 2
      mov edi, OFFSET invader1_2 
      mov [esi].INVADER.status, 1
    .ENDIF
  .ENDIF
  INVOKE move2D, edi, [esi].INVADER.siz, [esi].INVADER.prevPos, [esi].INVADER.currPos
  add esi, TYPE INVADER
  loop L1

  ret
showInvader ENDP

; Move invaders left and right
moveInvader PROC
  mov esi, OFFSET invaderList

  ; move each invader left or right by invaderDir(direction)
  mov ecx, 10  
L1:
  INVOKE copyPos, ADDR [esi].INVADER.prevPos, [esi].INVADER.currPos
  .IF invaderDir == LEFT
    dec [esi].INVADER.currPos.x
  .ELSEIF invaderDir == RIGHT
    inc [esi].INVADER.currPos.x
  .ENDIF
  add esi, TYPE INVADER
  loop L1

  ; If out of the bound, then change the direction
  mov esi, OFFSET invaderList
  .IF [esi].INVADER.currPos == 1
    mov invaderDir, RIGHT
  .ELSEIF [esi].INVADER.currPos == 9
    mov invaderDir, LEFT
  .ENDIF
  ret
moveInvader ENDP
END