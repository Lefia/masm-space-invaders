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

; Dimension of 2D array
DIM STRUCT 
  w DWORD 0 ; Width
  h DWORD 0 ; Height
DIM ENDS

;****************
;   utils.asm
;****************

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
;   ax: X of current position
;   dx: Y of current position
;----------------------------------------------------
getCannonPos PROTO

;****************
;   laser.asm
;****************

;----------------------------------------------------
; Description:
;   Set cannon's visibility
; Input:
;   bool  DWORD  Can be 0 (invisible) or 1 (visible)
; Output:
;   None
;----------------------------------------------------
setLaserVis PROTO,
  bool: DWORD

;----------------------------------------------------
; Description:
;   Print laser to console
; Input:
;   None
; Output:
;   None
;----------------------------------------------------
showLaser PROTO

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