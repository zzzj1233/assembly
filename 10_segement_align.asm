; 预期的二进制格式:
; （ 低端字节序 ）
; 1000 0000 0000 0000
; 2000 0000 0000 0000
; b8 00 00  ( b8 : mov ax )
; bb 04 00  ( b8 : mov bx )
; 0000 

SECTION data1 ; ALIGN=16 : 无需填写, 因为第一个段在0字节开始, 默认就是16的字节对齐的(0也是16的倍数)
    d1 db 1

SECTION data2  ALIGN=16
    d2 db 2

SECTION code1  ALIGN=16
    mov ax, d1
    mov bx, d2
    