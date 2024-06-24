start:
    mov ax, 101
    mov bx, 20
    div bx
again:
	jmp again
current:
    times 510 -(current- start) db 0
    db 0x55
    db 0xaa
