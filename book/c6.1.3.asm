assume cs:code

; GOAL: 利用栈将 [ 0123h - 0987h ] 逆放到 [ 17 ~ 32 ] 内存单元处

; 最终预期的效果为
; 0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h | 0987h,0cbah,0fedh,0defh,0abch,0789h,0456h,0123h

code segment
            dw   0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h
            dw   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    start:  
            mov  ax , cs
            mov  ss , ax
            mov  ax , 0030H
            mov  sp , ax
            mov  cx , 8
            mov  bx , 0
    do_push:
            push cs:[bx]
            add  bx , 2
            loop do_push
            mov  cx , 8
            mov  bx , 16
    do_pop: 
            pop  cs:[bx]
            add  bx , 2
            loop do_pop
            mov  ax , 4c00H
            int  21H
code ends

end start