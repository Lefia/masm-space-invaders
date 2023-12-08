;----------------------------------------------------
; Description:
;   The diemension of 2D array
; Members:
;   w  DWORD  Width of array
;   h  DWORD  Height of array
;----------------------------------------------------
DIM STRUCT 
  w DWORD 0 ; Width
  h DWORD 0 ; Height
DIM ENDS

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