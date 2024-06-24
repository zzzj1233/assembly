; 默认段是4字节对齐的
; 预期的二进制格式:
; （ 低端字节序 ）
; 1000
; 2000
; b8 00 00  ( b8 : mov ax )
; bb 04 00  ( b8 : mov bx )

SECTION data1 
    d1 db 1

SECTION data2 
    d2 db 2

SECTION code1
    mov ax, d1
    mov ax, d2
    