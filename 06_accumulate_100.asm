text:
    db '1 + 2 + 3 + 4 + 5 + ... + 100 = '

start:
    db 0
    mov ax, 0xb800
    mov es, ax
    mov di, 0

    mov ax, 0x07c0
    mov ds, ax

    mov cx, start - text

    mov si, text

; 显示"text"本文
show_text:
    mov al, [ds:si]
    mov es:di, al
    inc di
    mov byte es:di, 0x0b
    inc di
    inc si
    loop show_text

; 计算
mov bx, 1
mov ax, 0
calculate:
    add ax, bx
    inc bx
    cmp bx, 100
    jle calculate

; 除数
mov bx, 10
; cx用于计数
mov cx, 0

push_stack:
    xor dx, dx
    div bx,
    add dl, 0x30
    push dx
    inc cx
    cmp ax, 0
    jne push_stack

show_num:
    pop word dx
    mov [es:di], dl
    inc di
    mov byte [es:di], 0x0b
    inc di
    loop show_num

end:
    times 510 - ($ - $$) db 0
    db 0x55
    db 0xaa
