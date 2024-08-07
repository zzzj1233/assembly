assume cs:code
assume ds:data

data segment
           db 'welcome to masm!', 0
data ends

; 在指定的位置上(由参数传递)显示字符串

; dh = 行号
; dl = 列号
; cl = 颜色
; ds:si 指向字符串的首地址
code segment
      start:           
                       mov  dh , 8
                       mov  dl , 3
                       mov  cl , 2

                       mov  ax , data
                       mov  ds , ax

                       mov  si , 0
                  
                       
                       mov  ax , 0b800H
                       mov  es , ax                 ; 初始化ES, 指向显存
                       call call_show_screen
      call_show_screen:
                       push dx
                       push cx
                       dec  dh
                       mov  ax , 160
                       mul  dh
                       add  ax  , 4

                       mov  di , ax                 ; 初始化di, 指向8行3列
      lp:              
                       mov  al, [si]
                       inc  si
                       mov  es:[di] , al
                       mov  es:[di + 1], 0071H
                       add  di , 2
                       cmp  al , 0                  ; 遇到字符串结尾
                       je   ok
                       jmp  lp                      ; 否则继续循环
      ok:              
                       pop  dx
                       pop  cx
                       ret
                       mov  ax , 4c00h
                       int  21h
code ends

end start
