; Direction
UP    EQU 0
DOWN  EQU 1
LEFT  EQU 2
RIGHT EQU 3

; Arrow key
UP_KEY     EQU 4800h
DOWN_KEY   EQU 5000h 
LEFT_KEY   EQU 4B00h
RIGHT_KEY  EQU 4D00h
SPACE_KEY  EQU 3920h
ESC_KEY    EQU 011Bh

; Alias
_invader TEXTEQU <[esi].INVADER>
_laser TEXTEQU <[esi].LASER>
__laser TEXTEQU <[edi].LASER>

; Dimension of 2D array
DIM STRUCT 
  w WORD 0 ; Width
  h WORD 0 ; Height
DIM ENDS

; Invader object
INVADER STRUCT
  vis DWORD 0
  prevPos COORD <0,0>
  currPos COORD <0,0>
  siz DIM <5,3>
  var DWORD 0
  status DWORD 0
INVADER ENDS

; Laser object
LASER STRUCT
  owner DWORD 1 ; 0 (Player) or 1 (Enemy)
  shape BYTE 0B3h
  vis DWORD 0 
  prevPos COORD <0,0>
  currPos COORD <0,0>
LASER ENDS

;****************
;   utils.asm
;****************

printLine PROTO,
  array:PTR BYTE,
  len:DWORD,
  pos:COORD

;----------------------------------------------------
; Description:
;   Print 2D array to console
; Input:
;   array   PTR BYTE   Pointer to the 2D array.
;   dim     DIM        Dimensions of the array
;   xyPos   COORD      Position to start printing the array
; Output:
;   None
;----------------------------------------------------
print2D PROTO,
  array:PTR BYTE,
  siz:DIM,
  pos:COORD

;----------------------------------------------------
; Description:
;   Move 2D array from old positon to new position
; Input:
;   array    PTR BYTE   Pointer to the 2D array.
;   dim      DIM        Dimensions of the array
;   oldPos   COORD      Previous position of the array
;   newPos   COORD      New position of array the array
; Output:
;   None
;----------------------------------------------------
move2D PROTO,
  array:PTR BYTE, ; The 2D array to print
  siz:DIM,        ; 
  oldPos:COORD,
  newPos:COORD

remove2D PROTO,
  arraySize:DIM,
  pos:COORD,

;----------------------------------------------------
; Description:
;   Set position with x and y
; Input:
;   pos  PTR COORD  Pointer to the position.
;   x    WORD       X of position.
;   y    WORD       Y of position
; Output:
;   None
;----------------------------------------------------
setPos PROTO,
  pos:PTR COORD,
  x:WORD,
  y:WORD

;----------------------------------------------------
; Description:
;   Copy position from pos2 to pos1
; Input:
;   pos1  PTR COORD  Pointer to the position.
;   pos2  COORD      The position to copy.
; Output:
;   None
;----------------------------------------------------
copyPos PROTO,
  pos1:PTR COORD,
  pos2:COORD

;----------------------------------------------------
; Description:
;   Add position with x and y
; Input:
;   pos  PTR COORD  Pointer to the position.
;   x    WORD       Value X to add on pos.X.
;   y    WORD       Value Y to add on pos.Y.
; Output:
;   None
;----------------------------------------------------
movePos PROTO,
  pos:PTR COORD,
  x:WORD,
  y:WORD

modulo PROTO,
  dividend:DWORD,
  divisor:DWORD

getByIndex PROTO,
  array:PTR DWORD,
  elementSize:DWORD,
  index:DWORD

;****************
;   cannon.asm
;****************

;----------------------------------------------------
; Description:
;   Initialize the cannon
; Input:
;   None
; Output:
;   None
;----------------------------------------------------
initCannon PROTO

;---------------------------------------------------
; Description:
;   Move cannon to the given direction
; Input:
;   Dir  DWORD  LEFT or RIGHT
; Output:
;   None
;----------------------------------------------------
moveCannon PROTO,
  Dir: DWORD

;----------------------------------------------------
; Description:
;   Get Cannon's current position
; Input:
;   None
; Output:
;   ax: X of cannon's current position
;   dx: Y of cannon's current position
;----------------------------------------------------
getCannonPos PROTO

;----------------------------------------------------
; Description:
;   Get Cannon's size
; Input:
;   None
; Output:
;   eax: width of cannon
;   edx: height of cannon
;----------------------------------------------------
getCannonSize PROTO

;****************
;   laser.asm
;****************

initLaser PROTO

;----------------------------------------------------
; Description:
;   Move lasers
; Input:
;   None
; Output:
;   None
;----------------------------------------------------
moveLaser PROTO

;----------------------------------------------------
; Description:
;   Remove laser by the position
; Input:
;   pLaser  PTR LASER  Pointer to the laser
; Output:
;   None
;----------------------------------------------------
removeLaser PROTO,
  pLaser:PTR LASER

;----------------------------------------------------
; Description:
;   Print laser to console
; Input:
;   None
; Output:
;   None
;----------------------------------------------------
showLaser PROTO

;----------------------------------------------------
; Description:
;   Get list of lasers
; Input:
;   None
; Output:
;   eax: Pointer of laserList
;----------------------------------------------------
getLaserList PROTO

;----------------------------------------------------
; Description:
;   Fire laser from cannon
; Input:
;   None
; Output:
;   None
;----------------------------------------------------
fireLaser PROTO

;****************
;   invader.asm
;****************

;----------------------------------------------------
; Description:
;   Initialize the property of each invader
; Input:
;   None
; Output:
;   None
;----------------------------------------------------
initInvader PROTO

;----------------------------------------------------
; Description:
;   Show all invaders
; Input:
;   None
; Output:
;   None
;----------------------------------------------------
showInvader PROTO

;----------------------------------------------------
; Description:
;   Move invaders left and right
; Input:
;   None
; Output:
;   None
;----------------------------------------------------
moveInvader PROTO

;----------------------------------------------------
; Description:
;   Get the invaderList array
; Input:
;   None
; Output:
;   eax: Pointer to the invaderList
;----------------------------------------------------
getInvaderList PROTO

;----------------------------------------------------
; Description:
;   Get the invaderColSum array
; Input:
;   None
; Output:
;   eax: Pointer to the invaderColSum
;----------------------------------------------------
getInvaderColSum PROTO

;----------------------------------------------------
; Description:
;   Fire laser from invaders
; Input:
;   None
; Output:
;   None
;----------------------------------------------------
invaderFireLaser PROTO

;----------------------------------------------------
; Description:
;   Check the collision between player's laser and
;   invaders
; Input:
;   None
; Output:
;   None
;----------------------------------------------------
checkInvaderCollision PROTO

;****************
;   score.asm
;****************

initScore PROTO

addScore PROTO

showScore PROTO