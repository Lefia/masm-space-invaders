INCLUDE /irvine/Irvine32.inc
.data
    myMessage db "Hello, Irvine32!", 0

.code
main PROC
    mov edx, OFFSET myMessage
    call WriteString
    call Crlf
    call WaitMsg

main ENDP

END main