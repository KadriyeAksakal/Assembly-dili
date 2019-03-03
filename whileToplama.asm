; multi-segment executable file template.

data segment
    toplam db 0
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
    
    mov ax,0
    mov bx,1
    mov cx,5 
    mov toplam,al
    
    while:
    
        add ax,bx
        inc bx
    
    loop while    
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
