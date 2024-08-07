assume cs:code
assume ds:data

data segment
    dd 12345678H
data ends

code segment
    start:
        mov ax , data
        mov ds , ax
        mov bx , 0
        mov [bx] , start
        mov [bx + 2] , code
        jmp dword ptr ds:[0]
code ends

end start