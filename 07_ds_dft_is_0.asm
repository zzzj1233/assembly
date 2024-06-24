

buffer:
    db 'hello world'
again:
    ; =======================================
    ; ds默认指向0, 如果不将ds执行0x7c0, 那么将无法在屏幕上显示 'hello world'
    mov ax, 0x7c0,
    mov ds, ax
    ; =======================================
    ; BOOT将内存
    mov cx, again - buffer
    mov ax, 0xb800
    mov es, ax
    mov di, 0
    mov si, buffer
show_text:
    ; 因为这里在访问si的时候, CPU取的是[ds << 4 : si]内存地址的值
    ; 如果ds为0                    那么将访问 [1] -> [2] -> [3] ...
    ; 将ds设置为0x7C0后             那么将访问 [7c00:1] -> [7c00:1] -> [7c00:3] ... : 那么就是buffer处的数据
    mov al, [si]
    mov [es:di], al
    inc di
    mov byte [es:di], 0x0b
    inc di
    inc si
    loop show_text
current:
    times 510 -($- $$) db 0
    db 0x55
    db 0xaa
