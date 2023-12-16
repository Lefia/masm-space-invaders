INCLUDE Irvine32.inc
INCLUDE Macros.inc
INCLUDE final.inc

INVADER_SIZE EQU 10 ; invaderSize = invaderCol * invaderRow
INVADER_SIZE_ROW EQU 2
INVADER_SIZE_COL EQU 5

.data 
invader1_1 BYTE 0BFh,  5fh, 5fh,  5fh, 0DAh
           BYTE  2Fh, 0FEh, ' ', 0FEh,  5Ch
           BYTE  7Ch, 0C0h, ' ', 0D9h,  7Ch

invader1_2 BYTE 0BFh,   5fh, 5fh,  5fh, 0DAh
           BYTE  2Fh,  0FEh, ' ', 0FEh,  5Ch
           BYTE  0D9h, 0C0h, ' ', 0D9h, 0C0h

invaderList INVADER INVADER_SIZE DUP(<>)
invaderColSum DWORD INVADER_SIZE_COL DUP(INVADER_SIZE_ROW)
invaderCount DWORD INVADER_SIZE
invaderDir DWORD LEFT
invaderTick DWORD 0
invaderFireTick DWORD 0

.code

initInvader PROC USES eax esi ecx
  LOCAL pos:COORD

  ; Initialize the property and position of each invader
  INVOKE setPos, ADDR pos, 5, 2
  mov esi, OFFSET invaderList
  mov ecx, 0
  .WHILE ecx < 10 
    mov _invader.vis, 1
    mov _invader.var, 1
    mov _invader.status, 1
    INVOKE setPos, ADDR _invader.prevPos, pos.x, pos.y
    INVOKE setPos, ADDR _invader.currPos, pos.x, pos.y

    add pos.x, 9
    add esi, TYPE INVADER
    INVOKE modulo, ecx, 5 
    .IF eax == 4
      mov pos.x, 5
      add pos.y, 4
    .ENDIF
    inc ecx
  .ENDW

  ; Initialize the column sum array
  mov esi, OFFSET invaderColSum
  mov ecx, INVADER_SIZE_COL
  .WHILE ecx > 0
    mov DWORD PTR esi, INVADER_SIZE_ROW
    add esi, TYPE DWORD
    dec ecx
  .ENDW

  mov invaderTick, 0
  mov invaderCount, INVADER_SIZE
  
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
moveInvader PROC USES eax esi ecx
  .IF invaderTick < 4
    jmp End_Func
  .ENDIF

  ; move each invader left or right by invaderDir(direction)
  mov ecx, -1  
  .REPEAT
    inc ecx
    INVOKE getByIndex, ADDR invaderList, TYPE INVADER, ecx
    mov esi, eax

    INVOKE copyPos, ADDR _invader.prevPos, _invader.currPos
    
    .IF invaderDir == LEFT
      dec _invader.currPos.x
    .ELSEIF invaderDir == RIGHT
      inc _invader.currPos.x
    .ENDIF
  .UNTIL ecx >= 9

  ; If out of the bound, then change the direction
  mov esi, OFFSET invaderList

  .IF _invader.currPos.x == 1
    mov invaderDir, RIGHT
  .ELSEIF _invader.currPos.x == 9
    mov invaderDir, LEFT
  .ENDIF

  mov invaderTick, 0
  
End_Func: 
  inc invaderTick
  ret
moveInvader ENDP

; Return the invaderList array
getInvaderList PROC
  mov eax, OFFSET invaderList 
  ret
getInvaderList ENDP

; Return the invaderColSum array
getInvaderColSum PROC
  mov eax, OFFSET invaderColSum
  ret
getInvaderColSum ENDP

; Return the number of invaders
getInvaderCount PROC
  mov eax, invaderCount
  ret
getInvaderCount ENDP

setInvaderCount PROC USES eax,
  count:DWORD
  mov eax, count
  mov invaderCount, eax
  ret
setInvaderCount ENDP

; Fire laser from invaders
invaderFireLaser PROC USES eax edx ecx esi edi
  LOCAL ranNum:DWORD
  LOCAL pInvader:DWORD

  .IF invaderFireTick < 30
    jmp End_Func
  .ENDIF

  ; Find a unused laser
  call getLaserList
  mov edi, eax
  add edi, TYPE LASER ; The first laser's owner is player
  mov ecx, 5
  .WHILE ecx > 0
    .BREAK .IF __laser.vis == 0
    add edi, TYPE LASER
    dec ecx
  .ENDW

  ; Find how many columns enemy are alive
  mov eax, -1
  mov esi, OFFSET invaderColSum
  mov ecx, 5
  .WHILE ecx > 0
    .IF (DWORD PTR [esi]) > 0
      inc eax
    .ENDIF
    dec ecx
  .ENDW

  ; Get random number in range 0 - eax
  .IF eax == -1
    jmp End_Func ; No invader exists
  .ELSEIF eax == 0
    mov ranNum, 0
  .ELSE
    call Randomize
    mov  eax, 5
    call RandomRange
    mov ranNum, eax
  .ENDIF

  push edi
  mov esi, OFFSET invaderList
  mov edi, OFFSET invaderColSum

  ; Choose which invader to fire
  .WHILE ranNum > 0
    add esi, TYPE INVADER
    add edi, TYPE DWORD
    .IF (DWORD PTR [edi]) > 0
      dec ranNum
    .ENDIF
  .ENDW
  mov pInvader, esi

  pop edi

  ; If the choosed invader is not at the forefront
  mov eax, TYPE INVADER
  mov ecx, 5
  imul ecx
  mov ecx, 1
  .WHILE ecx > 0
    add esi, eax
    .IF _invader.vis == 1
      mov pInvader, esi
    .ENDIF
    dec ecx
  .ENDW

  mov esi, pInvader
  
  INVOKE copyPos, ADDR __laser.prevPos, _invader.currPos
  INVOKE movePos, ADDR __laser.prevPos, 2, 3
  INVOKE copyPos, ADDR __laser.currPos, _invader.currPos
  INVOKE movePos, ADDR __laser.currPos, 2, 3

  mov __laser.vis, 1

mov invaderFireTick, 0

End_Func:
  inc invaderFireTick
  ret
invaderFireLaser ENDP
END