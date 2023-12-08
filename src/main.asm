INCLUDE Irvine32.inc
INCLUDE Macros.inc
INCLUDE final.inc

.data
cannon BYTE ' ', 0DCh, ' '
       BYTE 0DEh, 0DBh, 0DDh
cannonSize DIM <3,2>
cannonPos COORD <47,25>
cannonPosNew COORD <21, 25>

.code
main PROC
call Clrscr
INVOKE print2D, ADDR cannon, cannonSize, cannonPos
mov eax, 3000
call Delay
call Clrscr
INVOKE print2D, ADDR cannon, cannonSize, cannonPosNew

main ENDP

END main
