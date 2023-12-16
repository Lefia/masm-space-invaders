INCLUDE Irvine32.inc
INCLUDE Macros.inc
INCLUDE final.inc

.data
playerHP DWORD 3
playerHPText BYTE "HP: "

.code
initPlayer PROC
  mov playerHP, 3
  ret
initPlayer ENDP

showPlayerHP PROC USES eax
  LOCAL tmp:BYTE
  LOCAL pos:COORD
  INVOKE setPos, ADDR pos, 45, 0
  INVOKE printLine, ADDR playerHPText, LENGTHOF playerHPText, pos
  INVOKE movePos, ADDR pos, LENGTHOF playerHPText, 0
  mov eax, playerHP
  add al, '0'
  mov tmp, al
  INVOKE printLine, ADDR tmp, 1, pos
  
  ret
showPlayerHP ENDP

getPlayerHP PROC
  mov eax, playerHP
  ret
getPlayerHP ENDP

setPlayerHP PROC USES eax,
  hp:DWORD
  mov eax, hp
  mov playerHP, eax
  ret
setPlayerHP ENDP

END