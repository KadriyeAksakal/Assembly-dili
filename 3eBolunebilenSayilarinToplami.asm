; multi-segment executable file template.

data segment
   sonuc dw ? 
ends

stack segment
    
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    mov ax,0
    mov bx,0
    mov cx,100
    mov dx,0
    
    dongu:
        inc ax
        inc dx
        cmp dx,3
        jz git
     loop dongu
     jmp son
     
     git:
        add bx,ax
        mov dx,0
        loop dongu
           
     son:
        mov sonuc,bx
        mov ax, 4c00h ; exit to operating system.
        int 21h    
ends

end start ; set entry point and stop the assembler.
