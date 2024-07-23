; 多个段程序
; assume只是一个注释的作用, 无法让 ds / ss 直接指向对于的代码块
; 还是得通过代码赋值 ds / ss
; code:
;
; mov ax , data
; mov ds , ax
; 
; mov ax , stack
; mov ss , ax
assume cs:code , ds:data , ss:stack

data segment
         dw 0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h
data ends

stack segment
          dw 0 , 0 , 0 , 0
          dw 0 , 0 , 0 , 0
          dw 0 , 0 , 0 , 0
          dw 0 , 0 , 0 , 0
stack ends

code segment
    init: 

          mov ax , data
          mov ds , ax        ; 初始化ds

          mov ax , stack
          mov ss , ax        ; 初始化ss
          
          mov ax , 2 * 16    ; 16个dw
          mov sp , ax        ; todo sp 目前只能通过hardCode初始化
    start:k

code ends

end start