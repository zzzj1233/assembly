;8位除法
;
;被除数:    AX
;除数：     立即数 | 8位寄存器
;商数:      AL
;余数       AX

;16位除法
;
;被除数:     DX:AX ( 形成16位被除数 )
;除数:       立即数 | 16位寄存器
;商数:       AX
;余数        DX

div8:
    mov ax, 0x1000      ;   AX = 0x1000
    mov bx, 0x0010      ;   BX = 0x0010
    div bx              ;   AX = 0x0100 , BX不变

div16:
    mov dx, 0x0010
    mov ax, 0x1000      ;   DX:AX = 0x00101000
    mov bx, 0x0010      ;   BX    = 0x10
    div bx              ;   AX    = 0x1010 (商)  DX = 0x0000 (余)