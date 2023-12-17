INCLUDE Irvine32.inc
INCLUDE Macros.inc
INCLUDE final.inc

.data
score DWORD 0
scorePerInvader DWORD 100
scoreCharList BYTE 5 DUP(30h)
scoreText BYTE "Score: "
zeroText BYTE '0'

scoreTick DWORD 0
scoreDecayTicks DWORD 300

.code
initScore PROC
  mov score, 0
  mov scoreTick, 0
  ret
initScore ENDP

addScore PROC USES eax
  mov eax, scorePerInvader
  add score, eax
  ret
addScore ENDP

showScore PROC USES eax ecx ebx edx esi,
  pos:COORD

  LOCAL tmp:DWORD
  LOCAL len:DWORD
  
  mov eax, score
  mov tmp, eax

  mov ecx, 4
  .WHILE ecx > 0
    INVOKE getByIndex, OFFSET scoreCharList, TYPE BYTE, ecx
    mov esi, eax
    mov eax, tmp
    mov edx, 0
    mov ebx, 10
    div ebx
    add dl, '0'
    mov [esi], dl
    mov tmp, eax

    dec ecx
  .ENDW

  mov len, LENGTHOF scoreCharList
  mov esi, OFFSET scoreCharList
  .WHILE 1
    mov al, BYTE PTR [esi]
    .IF al == '0'
      sub len, 1
      add esi, TYPE BYTE
    .ELSE
      .BREAK
    .ENDIF
  .ENDW

  INVOKE printLine, ADDR scoreText, LENGTHOF scoreText, pos
  INVOKE movePos, ADDR pos, LENGTHOF scoreText, 0
  .IF len == 0
    INVOKE printLine, ADDR zeroText, LENGTHOF zeroText, pos
  .ELSE
    INVOKE printLine, esi, len, pos
  .ENDIF

  mov eax, scoreDecayTicks
  .IF scoreTick == eax
    sub scorePerInvader, 10
    mov scoreTick, 0
    .IF scoreDecayTicks > 150
      sub scoreDecayTicks, 50
    .ENDIF
  .ENDIF
  inc scoreTick
  
  ret
showScore ENDP

getScore PROC
  mov eax, score
getScore ENDP
END