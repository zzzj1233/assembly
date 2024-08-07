assume cs:code
assume ds:data

; 利用call将字符串转大写
; 遇到0结束

data segment
           db 'conversation', 0
data ends

code segment
      start:   
               mov  ax , data
               mov  ds , ax
               mov  bx , 0
               call to_upper
               mov  ax , 4c00h
               int  21h
      to_upper:
               sub [bx] , 32
               inc bx
               cmp [bx] , 0
               jne to_upper
      ok:      
               ret
code ends

end start
