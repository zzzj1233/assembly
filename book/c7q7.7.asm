; 将每行的字符串改成大写

; 需要用到双重循环

assume cs:code
assume ds:data

data segment
           db 'file            '
           db 'edit            '
           db 'sear            '
           db 'view            '
           db 'opti            '
           db 'help            '
data ends
code segment
      start:     
                 mov  ax , data
                 mov  ds , ax
                 mov  cx , 6              ; 外层循环6次
                 mov  bx , 0              ; 初始化bx = 0 , 在第0行
      loop_outer:
                 mov  dx ,cx              ; 进入内层循环前保存[cx]的值
                 mov  cx , 4              ; 内存循环4次
                 mov  si , 0              ; 可以理解 bx = i , si = j
      loop_inner:
                 sub  [bx + si] , 32
                 inc  si
                 loop loop_inner

                 mov  cx ,dx              ; 退出内层循环后还原[cx]的值
                 add  bx , 16             ; +16 = 进入下一行
                 loop loop_outer

                 mov  ax , 4c00H
                 int  21H
code ends

end start