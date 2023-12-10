INCLUDE Irvine32.inc
INCLUDE Macros.inc
INCLUDE final.inc

.data
outputHandle DWORD 0
count DWORD 0

spaces BYTE 50 DUP(' ')

.code
print2D PROC USES eax esi ecx,
  array:PTR BYTE,
  arraySize:DIM,
  pos:COORD

  ; Get outputhandle
  INVOKE GetStdHandle, STD_OUTPUT_HANDLE
  mov outputHandle, eax
  
  ; Set Loop counter
  mov ecx, arraySize.h
  mov esi, array

  ; Write each row of 2D array
L1:
  push ecx
  INVOKE WriteConsoleOutputCharacter,
    outputHandle,
    esi,
    arraySize.w,
    pos,
    OFFSET count
  pop ecx
  add esi, arraySize.w
  inc pos.Y
  loop L1
  ret
print2D ENDP

move2D PROC USES eax esi ecx,
  array:PTR BYTE,
  arraySize:DIM,
  oldPos:COORD,
  newPos:COORD

  ; Get outputhandle
  INVOKE GetStdHandle, STD_OUTPUT_HANDLE
  mov outputHandle, eax
  
  ; Set Loop counter
  mov ecx, arraySize.h

  mov esi, OFFSET spaces 
L1:
  push ecx
  INVOKE WriteConsoleOutputCharacter, 
    outputHandle,
    esi,
    arraySize.w,
    oldPos,
    OFFSET count
  pop ecx
  inc oldPos.Y
  loop L1

  INVOKE print2D, array, arraySize, newPos
  ret
move2D ENDP

setPos PROC USES eax esi,
  pos:PTR COORD,
  x:WORD,
  y:WORD

  mov esi, pos
  mov ax, x
  mov (COORD PTR [esi]).x, ax
  mov ax, y
  mov (COORD PTR [esi]).y, ax
  ret 
setPos ENDP

copyPos PROC USES eax esi,
  pos1:PTR COORD,
  pos2:COORD

  mov esi, pos1
  mov ax, pos2.x
  mov (COORD PTR [esi]).x, ax
  mov ax, pos2.y
  mov (COORD PTR [esi]).y, ax
  ret
copyPos ENDP

movePos PROC USES eax esi,
  pos:PTR COORD,
  x:WORD,
  y:WORD

  mov esi, pos
  mov ax, x
  add (COORD PTR [esi]).x, ax
  mov ax, y
  add (COORD PTR [esi]).y, ax
  ret
movePos ENDP
END

