
; 不再使用dx来保存cx
; 而是使用压栈和出栈 

assume cs:code
assume ds:data
assume ss:stack

data segment
           db 'file            '
           db 'edit            '
           db 'sear            '
           db 'view            '
           db 'opti            '
           db 'help            '
data ends

; 栈段8个字节大小
stack segment
            db 0,0,0,0,0,0,0,0
stack ends

code segment
      start:
            mov  ax , data
            mov  ds , ax             ; 初始化 ds

            mov  ax , stack
            mov  ss , ax
            mov  sp , 8              ; 初始化 ss & sp

            mov  cx , 6              ; 外层循环6次
            mov  bx , 0              ; [bx] 等同于 [i]
      i:    
            push cx                  ; 进入内层循环前把[cx]压栈
            mov  si , 0
            mov  cx , 4              ; 内存循环4次
      j:    
            sub  [bx + si] , 32      ; 转换为大写字母
            inc  si
            loop j

            pop  cx                  ; 退出内存循环后把[cx]出栈
            add  bx , 16             ; 换到下一行
            loop i

            mov  ax , 4c00H
            int  21H
code ends

end start   