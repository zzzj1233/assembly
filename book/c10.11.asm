assume cs:code
assume ds:data
; 利用call将字符串转大写

data segment
           db 'helloworld'
data ends


code segment
      start:   
               mov  ax , data
               mov  ds , ax
               mov  cx , 10
               mov  bx , 0
               call to_upper
               mov  ax , 4c00h
               int  21h
      to_upper:
               sub [bx] , 32
               inc bx
               loop to_upper
               ret
code ends

end start
