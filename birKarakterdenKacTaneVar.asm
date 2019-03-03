; multi-segment executable file template.

data segment
   Kelime db 'aazer'
ends

stack segment
    
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    mov cx,5
    mov al,0
    mov bl,0
    lea si,Kelime
    
    dongu:
        mov al,[si]
        inc si
        cmp al,61h
        je dongu1
    Loop dongu
    jmp son
    
    dongu1:
        inc bl
        Loop dongu
        
            
    son:
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
