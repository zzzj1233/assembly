; 向内存 [ 0:200 - 0:23F ] 写入 0 ~ 63

assume cs:code

code segment

    start:
          mov  ax , 0020H
          mov  ds , ax
          mov  bx , 0
          mov  cx , 64
    move: 
          mov  [bx], bx
          inc  bx
          loop move
          mov  ax , 4c00H
          int  21H
code ends

end start