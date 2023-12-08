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
  xyPos:COORD

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
    xyPos,
    OFFSET count
  pop ecx
  add esi, arraySize.w
  inc xyPos.Y
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
  mShow arraySize.h
  mShow arraySize.w

  mov esi, OFFSET spaces 
L1:
  push ecx
  INVOKE WriteConsoleOutputCharacter, 
    outputHandle,
    esi,
    dim.w,
    oldPos,
    OFFSET count
  pop ecx
  mShow ecx
  inc oldPos.Y
  loop L1

  INVOKE print2D, array, arraySize, newPos
  ret
move2D ENDP
END

