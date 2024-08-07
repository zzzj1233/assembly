assume cs:code
assume ss:stack

; 补全程序 , 实现从内存1000:0000处开始执行指令

stack segment
            db 16 dup (0)
stack ends

code segment4
      start:
            mov  ax , stack
            mov  ss , ax
            mov  sp , 16
            mov  ax , 1000H      ; mov ax , ?
            push ax
            mov  ax , 0000H      ; mov ax , ?
            push ax
            retf
code ends

end start