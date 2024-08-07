assume cs:code

code segment
      start:
            mov ax , 1
            mov cx , 3
            call s
            ; 求此时ax的值
            mov ax , 4c00h
            int 21h
      s:
            add ax , ax
            loop s
code ends

end start