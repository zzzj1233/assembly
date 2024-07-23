assume cs:code

; GOAL: 
;    将 [ ffff:0 - ffff:b ] 内存中的数据移动到 [ 0:200 - 0:20b ] 
; warning
; 1. masm编译器无法直接通过内存访址 
;    mov ax , [0] ❌
;    mov bx , 0
;    mov ax , [b] ✔
;
; 2. 使用段前缀语法和nasm不同
;    mov ax , [ds:bx] ❌
;    mov ax , ds:[bx] ✔
;
; 3. 定义十六进制的写法和nasm不同
;    db 0x0F ❌
;    db 0FH  ✔
code segment
    start:
          mov ax , 0FFFFh
          mov ds , ax
          mov ax , 20h
          mov es , ax

          mov  bx , 0
          mov  cx , 0bH
    move: 
          mov  ax , ds:[bx]
          mov  es:[bx] , ax
          inc  bx
          loop move
          mov  ax , 4c00H
          int  21H
code ends

end start