start:
    mov ax, 0xb800
    mov ds, ax
    mov byte [0x00], 'h'
    mov byte [0x01], 0x0b
	mov byte [0x02], 'e'
    mov byte [0x03], 0x0b
	mov byte [0x04], 'l'
    mov byte [0x05], 0x0b
	mov byte [0x06], 'l'
    mov byte [0x07], 0x0b
	mov byte [0x08], 'o'
    mov byte [0x09], 0x0b
again:
	jmp again
current:
    times 510 -(current- start) db 0
    db 0x55
    db 0xaa
