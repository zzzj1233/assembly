; 将每行的首字母改成大写

assume cs:code
assume ds:data

data segment
             db '1. file         '
             db '2. edit         '
             db '3. search       '
             db '4. view         '
             db '5. options      '
             db '6. help         '
data ends
code segment
        start:
              mov  ax , data
              mov  ds , ax
              mov  cx , 6
              mov  bx , 0
        row:  
              sub [bx + 3] , 32
              add bx , 16
              loop row
              mov  ax , 4c00H
              int  21H
code ends

end start