assume cs:code
assume ds:data

code segment
    start:
          mov ax , 2000H
          mov ds , ax
          mov bx , 0
    s:    
          mov cx , ds:[bx]
          inc bx
          jcxz ok
          jmp short s
    ok:   
          mov dx , bx
          mov ax , 4c00H
          int 21h
code ends

end start