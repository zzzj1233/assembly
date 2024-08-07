assume cs:code
assume ds:data

data segment
           dw 123, 12666, 1, 8, 3, 38
data ends

; 将data段内的数据以10进制字符串显示在屏幕中

code segment
      start:      
      ; 1. init ds
                  mov  ax , data
                  mov  ds , ax
      ; 2. init es
                  mov  ax , 0b800H
                  mov  es , ax
      ; 3. init cx
                  mov  cx , 5
      ; 4. init di
                  mov  di  , 0
      ; 5. init si
                  mov  si , 1920
      loop_number:
                  mov  ax , [di]               ; 被除数
                  xor  dx , dx                 ; dx清0
                  add  di , 2
                  call show_number
                  loop loop_number
      show_number:
                  push ax
                  push cx
                  xor  cx , cx
      do_div:     
                  mov  bx  , 10                ; 除数
                  div  bx                      ; div
                  add  dx , 0030H
      ; mov  es:[si], dl             ; 余数
      ; mov  es:[si + 1], 0071H      ; 颜色
                  push dx
                  xor  dx, dx
                  inc  cx
                  cmp  ax , 0
                  je   do_pop
                  jmp  do_div
      do_pop:     
                  pop  dx
                  mov  es:[si], dl             ; 余数
                  mov  es:[si + 1], 0071H      ; 颜色
                  add  si , 2
                  loop do_pop
      ok:         
                  mov  es:[si], ' '
                  add  si , 2
                  pop  cx
                  pop  ax
                  ret
                  mov  ax , 4c00h
                  int  21h
code ends

end start
