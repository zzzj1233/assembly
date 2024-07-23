; 使用si和di将 welcome to masm!复制到它后面的数据区中

assume cs:code
assume ds:data

data segment
           db 'welcome to masm!'
           db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data ends

; code segment
;       start:  
;               mov  ax , data
;               mov  ds , ax
;               mov  di , 0
;               mov  si , 16
;               mov  cx , 16
;       do_move:
;               mov  al , [di]
;               mov  [si] , al
;               inc  di
;               inc  si
;               loop do_move

;               mov  ax , 4c00H
;               int  21H
; code ends


; 更加简洁的写法 : 使用 [ si + idata ]
code segment
      start:  
              mov  ax , data
              mov  ds , ax
              mov  si , 0
              mov  cx , 16
      do_move:
              mov  al , [si]
              mov  [si + 16] , al
              inc  di
              inc  si
              loop do_move

              mov  ax , 4c00H
              int  21H
code ends

end start