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
  dim:DIM,
  xyPos:COORD

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
  dim:DIM,        ; 
  oldPos:COORD,
  newPos:COORD


;****************
;   cannon.asm
;****************

;----------------------------------------------------
; Description:
;   Show cannon on console
; Input:
;   None
; Output:
;   None
;----------------------------------------------------
showCannon PROTO

;----------------------------------------------------
; Description:
;   Move cannon to the given direction
; Input:
;   Dir  DWORD  LEFT or RIGHT
; Output:
;   None
;----------------------------------------------------
moveCannon PROTO,
  Dir: DWORD