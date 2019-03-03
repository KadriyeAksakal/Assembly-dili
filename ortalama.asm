; multi-segment executable file template.

data segment
    
    sayilar db 2,6,4,5,8
    toplam db 0
    ortalama db 0
    bol5 db 5 
    
ends

stack segment
    
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
   
    lea si,sayilar
    mov cx,5
    
    dongu:
        mov al,[si]
        add toplam,al
        inc si
    Loop dongu
    
    mov ax,0
    mov al,toplam
    div bol5
    mov ortalama,al 
           

    

     
   
   
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
