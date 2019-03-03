; multi-segment executable file template.

data segment
    dizi db 1,2,3,4,5
    sonuc db ?
ends

stack segment
    
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    lea si,dizi
    mov cx,5
    mov al,0
    
    dongu:
        mov bl,[si]
        add al,bl
        inc si
    Loop dongu
    
    mov sonuc,al
        
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
