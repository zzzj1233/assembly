
jmp start

text:
    db 'h', 0x0b, 'e', 0x0b, 'l', 0x0b, 'l', 0x0b, 'o', 0x0b
start:
    ; =====================================================
    ; 1. 从 `ds:si` 处读取一个字节的数据。
    ; 2. 将读取的字节写入 `es:di` 处。
    ; 3. 自动递增 `si` 和 `di` 寄存器，使它们指向下一个字节位置。
    ; 4. 重复上述步骤，直到复制完成（根据 `cx` 寄存器的值来控制循环次数）
    ; =====================================================

    ; ds指向0x7c0处, 而不是0x7c00, 因为待会要会通过si偏移到text处
    mov ax, 0x7c0
    mov ds, ax

    ; es指向text处
    mov ax, 0xb800
    mov es, ax

    ; 偏移量
    xor si, text
    xor di, di

    ; 设置循环次数
    mov cx, (start - text)

    ; 清除方向标志寄存器，使得数据方向为正向（向上增长）
    cld

    ; 执行cx次movsb
    rep movsb

end:
    times 510 - ($ - $$)  db 0
    db 0x55
    db 0xaa