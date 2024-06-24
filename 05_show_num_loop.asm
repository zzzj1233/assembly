
; 通过循环显示65535到屏幕上

; 1. 定义5个字节的内存空间, 用于保存余数
buffer:
    db 0, 0, 0, 0, 0

; 2.1 被除数和除数
mov ax, 12333
mov bx, 10

; 2.2 循环次数
mov cx, 5

mov di, buffer

do_division:
     xor dl, dl
     div bx
     add dl, 0x30
     mov [di], dl
     inc di
     loop do_division

; 3. 拷贝到显存中
mov ax, 0xb800
mov es, ax

mov cx, 5

mov si, buffer
add si, 4

mov di, 0

do_copy:
    mov al, [si]
    mov byte [es:di], al
    inc di
    mov byte [es:di], 0x0b
    inc di
    dec si
    loop do_copy
end:
    times 510 - ($ - $$) db 0
    db 0x55
    db 0xaa
