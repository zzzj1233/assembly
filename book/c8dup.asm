; 使用si和di将 welcome to masm!复制到它后面的数据区中

assume cs:code
assume ds:data

data segment
        db 3 dup(0, 1, 2)       ; 0,1,2 0,1,2 0,1,2 
        db 3 dup('abc')         ; abc abc abc
data ends

code segment
        start:

              mov ax , 4c00H
              int 21H
code ends

end start