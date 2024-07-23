; 将a段和b段的数据相加, 放入到d段中

assume cs:code

a segment
      db 1,2,3,4,5,6,7,8
a ends

b segment
      db 1,2,3,4,5,6,7,8
b ends

d segment
      db 0,0,0,0,0,0,0,0
d ends

code segment
    start: 
           mov  ax , a
           mov  ds , ax
           mov  ax , b
           mov  es , ax
           mov  cx , 8
           mov  bx , 0
    do_add:
           mov  al , es:[bx]
           add  ds:[bx] , al
           inc  bx
           loop do_add
           mov  ax , d
           mov  es , ax
           mov  cx , 8
           mov  bx , 0
    do_mov:
           mov  al , ds:[bx]
           mov  es:[bx] , al
           inc  bx
           loop do_mov
           mov  ax , 4c00H
           int  21H
code ends

end start