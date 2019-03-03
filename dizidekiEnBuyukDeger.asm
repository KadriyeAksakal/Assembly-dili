; multi-segment executable file template.

data segment
   SAYI db 1,2,3,4,5
   enBuyuk db ?
ends

stack segment
    
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    lea si,SAYI
    mov cx,5
    mov ax,0
    mov enBuyuk,0
    
    dongu:
        mov al,[si]
        cmp al,enBuyuk
        ja dongu1
        inc si
    Loop dongu
    jmp son
    
    dongu1:
        mov enBuyuk,al
        inc si
    Loop dongu
    
    son:
        mov ax,4c00h
        int 21h    
   
ends

end start ; set entry point and stop the assembler.
