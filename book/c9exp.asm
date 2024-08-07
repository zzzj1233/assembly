assume cs:code
assume ds:data

data segment
           db 'welcome to masm!' , 0
data ends

code segment
      start:
            mov ax , 0B800H
            mov es , ax

            mov ax , data
            mov ds , ax

            mov si , 0
            mov di , 0
      s:    
            mov ah , ds:[di]
            inc di

            mov es:[si + 1920] , ah
            mov word ptr es:[si + 1 + 1920] , 0071H
            add si , 2

            cmp ds:[di] , 0
            jne s
      ok:   
            mov dx , bx
            mov ax , 4c00H
            int 21h
code ends

end start