

start:
    ; goal : 在显示器上显示65535

    ; 1. 定义除数至ax
    mov ax, 65535
    ; 2. bx作为被除数
    mov bx, 10

    mov dl, 0
    ; 3. ax / bx , 商在ax , 余数在dl
    div bx
    ; 4. 将数字转换为数字字符 : 例如数字5, ASCII码为 53 = 5 + 0x30(48)
    add dl, 0x30
    ; 5. 将dl的数赋值给内存
    mov [buffer + 0], dl

    ; 循环
    mov dl, 0
    div bx
    add dl, 0x30
    mov [buffer + 1], dl

    mov dl, 0
    div bx
    add dl, 0x30
    mov [buffer + 2], dl

    mov dl, 0
    div bx
    add dl, 0x30
    mov [buffer + 3], dl

    mov dl, 0
    div bx
    add dl, 0x30
    mov [buffer + 4], dl

    ; 6. 将es定位显存区
    mov ax, 0xb800
    mov es, ax

    ; 7. 向显存写入数据
    mov al, [buffer + 4]
    mov byte [es:0x00], al
    mov byte [es:0x01], 0x0b

    mov al, [buffer + 3]
    mov byte [es:0x02], al
    mov byte [es:0x03], 0x0b

    mov al, [buffer + 2]
    mov byte [es:0x04], al
    mov byte [es:0x05], 0x0b

    mov al, [buffer + 1]
    mov byte [es:0x06], al
    mov byte [es:0x07], 0x0b

    mov al, [buffer + 0]
    mov byte [es:0x08], al
    mov byte [es:0x09], 0x0b

buffer:
    db 0, 0, 0, 0, 0
end:
    times 510 - ( end - start ) db 0
    db 0x55
    db 0xaa
