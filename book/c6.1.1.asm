assume cs:code

; GOAL: 自定义的8个字累加到ax中

code segment
               dw   0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h
    start:     
               mov  cx , 8
               mov  bx , 0
               mov  ax , 0
    accumulate:
               add  ax , cs:[bx]
               add  bx , 2
               loop accumulate
               mov  ax , 4c00H
               int  21H
code ends

end start