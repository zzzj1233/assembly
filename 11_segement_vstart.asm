
; 地址
; str1 = 0x0100
; str2 = 0x0105
; num  = 0x0020
SECTION s1
    offset dw str1, str2, num

SECTION s2 ALIGN=16 vstart=0x100
    str1 db 'hello'
    str2 db 'world'

SECTION s3 ALIGN=16
    num dw 0xbad