assume cs:code
assume ds:data

data segment
    db 0, 0
data ends

code segment
    start:
        mov ax , data
        mov ds , ax
        mov bx , 0
        jmp word ptr [bx + 1]
code ends

end start