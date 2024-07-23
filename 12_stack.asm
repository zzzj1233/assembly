
; ss: stack segment : 栈段寄存器 
; sp: stack pointer : 栈顶寄存器

; 这两个寄存器结合来确定栈顶的位置 [ss:sp]

; 8086从栈高地址往低地址压栈

start:

mov ax, 0x1000
mov sp, ax

mov ax, 0x10 
mov bx, 0x20

push ax ; sp = 0ffe
push bx ; sp = 0ffc

pop ax  ; sp = 0ffe
pop bx  ; sp = 0x1000