; 使用push将a段中的前8个word放入到b段中

assume cs:code

a segment
        dw 1,2,3,4,5,6,7,8,9,0AH,0BH,0CH,0DH,0EH,0FH,0FFH
a ends

b segment
        dw 0,0,0,0,0,0,0,0
b ends


code segment
      start:

            mov ax , a
            mov ds , ax
            
            mov ax , b
            mov ss , ax
            
            mov ax , 16
            mov sp , ax

            mov bx , 14
            
            mov cx , 8
      do_push:
            push ds:[bx]
            sub bx , 2
            loop do_push

            mov ax , 4c00H
            int 21H
code ends

end start