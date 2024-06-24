buffer:
    db 'abcd'
start:
    mov cx, (start - buffer)
    mov ax, 0x7c0
    mov ds, ax
    mov di, 0
do_push:
    mov al, [ds:di]
    push word ax
    inc di
    loop do_push

; es:si -> 指向显存
mov ax, 0xb800
mov es, ax
mov si, 0
; 循环次数
mov cx, (start - buffer)

do_pop:
    pop ax
    mov [es:si], al
    inc si
    ; mov byte [es:si], 0x0b
    inc si
    loop do_pop
end:
    times 510 - ($ - $$) db 0
    db 0x55
    db 0xaa