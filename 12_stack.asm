
; ss: stack segment : 栈段寄存器 
; sp: stack pointer : 栈顶寄存器

; 这两个寄存器结合来确定栈顶的位置 [ss:sp]

; 8086从栈高地址往低地址压栈

; 压栈前 ss:sp : 0000:1000

; push ax

; 压栈后 ss:sp : 0000:0ffe

; pop ax

; 出栈后 ss:sp: 0000:1000


