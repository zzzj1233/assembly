; 使用si和di将 welcome to masm!复制到它后面的数据区中

assume cs:code
assume ds:data

data segment
        ; 年份
             db '1975','1976','1977','1978','1979','1980','1981','1982','1983'
             db '1984','1985','1986','1987','1988','1989','1990','1991','1992'
             db '1993','1994','1995'
        ; 收入
             dd 12, 22, 382, 1356, 2390, 8000, 16000, 24486, 50065, 97479, 140417, 197514
             dd 345980, 590827, 803530, 1183000, 1843000, 2759000, 3753000, 4649000, 5937000
        ; 雇员数
             dw 3, 7, 9, 13, 28, 38, 130, 220, 476, 778, 1001, 1442, 2258, 2793, 4037, 5635, 8226
             dw 11542, 14430, 15257, 17800
data ends

table segment
              db 21 dup ('year summ ne ?? ')
table ends



code segment
        start:          
                        mov  ax , data
                        mov  ds , ax
                        mov  ax , table
                        mov  es , ax                  ; 初始化ds和es
              
                        mov  cx , 21                  ; 循环次数21
                        mov  bx , 0
                        mov  si , 0
        fill_year:      
                        mov  ax , ds:[si]
                        mov  es:[bx] , ax
                        mov  ax , ds:[si + 2]
                        mov  es:[bx + 2] , ax
                        add  bx , 16
                        add  si , 4
                        loop fill_year

                        mov  cx , 21                  ; 循环次数21
                        mov  bx , 0
                        mov  si , 84
        fill_income:    
                        mov  ax , ds:[si]
                        mov  es:[bx + 5] , ax
                        mov  ax , ds:[si + 2]
                        mov  es:[bx + 7] , ax
                        add  bx , 16
                        add  si , 4
                        loop fill_income

                        mov  cx , 21                  ; 循环次数21
                        mov  bx , 0
                        mov  si , 84 * 2
        fill_empolyee:  
                        mov  ax , ds:[si]
                        mov  es:[bx + 10] , ax
                        add  bx , 16
                        add  si , 2
                        loop fill_empolyee
        
                        mov  cx , 21                  ; 循环次数21
                        mov  bx , 0
                        mov  si , 21 * 4 * 2
                        mov  di , 21 * 4
        fill_avg_income:
        ; 1. 把被除数低16位放入ax
                        mov  ax , ds:[di]
        ; 2. 把被除数高16位放入dx
                        mov  dx , ds:[di + 2]
        ; 3. 执行div, 商在ax中
                        div  word ptr ds:[si]
        ; 4. 将ax的内容放入table中
                        mov  es:[bx + 13], ax
        ; 5. 指向下一行
                        add  bx , 16
        ; 6. 指向下一个被除数
                        add  di , 4
        ; 7. 指向下一个除数
                        add  si , 2
                        loop fill_avg_income          ; avg =  income / employee
        
                        mov  ax , 4c00H
                        int  21H
code ends

end start