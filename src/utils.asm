INCLUDE Irvine32.inc
INCLUDE Macros.inc
INCLUDE final.inc

.data
outputHandle DWORD 0
count DWORD 0

spaces BYTE 50 DUP(' ')

.code
printLine PROC USES eax esi ecx,
  array:PTR BYTE,
  len:DWORD,
  pos:COORD

  ; Get outputhandle
  INVOKE GetStdHandle, STD_OUTPUT_HANDLE
  mov outputHandle, eax
  
  INVOKE WriteConsoleOutputCharacter,
    outputHandle,
    array,
    len,
    pos,
    OFFSET count
  ret
printLine ENDP

print2D PROC USES eax esi ecx,
  array:PTR BYTE,
  arraySize:DIM,
  pos:COORD

  ; Get outputhandle
  INVOKE GetStdHandle, STD_OUTPUT_HANDLE
  mov outputHandle, eax
  
  ; Set Loop counter
  movsx ecx, arraySize.h
  mov esi, array

  ; Write each row of 2D array
L1:
  push ecx
  movsx eax, arraySize.w
  INVOKE WriteConsoleOutputCharacter,
    outputHandle,
    esi,
    eax,
    pos,
    OFFSET count
  pop ecx
  movsx eax, arraySize.w
  add esi, eax
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
  movsx ecx, arraySize.h

  mov esi, OFFSET spaces 
L1:
  push ecx
  movsx eax, arraySize.w
  INVOKE WriteConsoleOutputCharacter, 
    outputHandle,
    esi,
    eax,
    oldPos,
    OFFSET count
  pop ecx
  inc oldPos.Y
  loop L1

  INVOKE print2D, array, arraySize, newPos
  ret
move2D ENDP

remove2D PROC USES eax esi ecx,
  arraySize:DIM,
  pos:COORD,

  ; Get outputhandle
  INVOKE GetStdHandle, STD_OUTPUT_HANDLE
  mov outputHandle, eax

  ; Print white spaces to cosonle
  mov esi, OFFSET spaces 
  movsx ecx, arraySize.h
L1:
  push ecx
  movsx eax, arraySize.w
  INVOKE WriteConsoleOutputCharacter, 
    outputHandle,
    esi,
    eax,
    pos,
    OFFSET count
  pop ecx
  inc pos.y
  loop L1
  ret
remove2D ENDP

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

; Get the remainder modulo divisor
modulo PROC USES edx ebx,
  dividend:DWORD,
  divisor:DWORD

  mov eax, dividend
  mov ebx, divisor

  mov edx, 0
  div ebx
  
  ; return remainder
  mov eax, edx
  ret
modulo ENDP

; Get the element in array by index
getByIndex PROC USES ecx esi,
  array:PTR DWORD,
  elementSize:DWORD,
  index:DWORD

  mov esi, array
  mov eax, elementSize
  mov ecx, index
  mul ecx
  add esi, eax
  mov eax, esi

  ret
getByIndex ENDP

END

