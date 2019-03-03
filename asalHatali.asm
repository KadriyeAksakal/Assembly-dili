; multi-segment executable file template.

data segment
    sayi db 0 
    carpim db 1 
    temp db 0  
    carp db 10 
    string1 db "asal degil$"
    string2 db "asal$"
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

    mov ah,01
    int 21h
    sub al,30h
    mul carp
    mov sayi,al
    mov ah,01
    int 21h 
    sub al,30h
    add sayi,al
    
    mov ch,00
    mov cl,sayi
    dec cl
    mov bl,1 
    mov ah,00
    dongu:
    mov ah,00
    mov al,sayi
    div bl
    cmp ah,00
    je git
    inc bl
    loop dongu
    jmp alt
    
    git:
    mov al,carpim
    mul bl
    mov carpim,al 
    inc bl
    loop dongu
    
    alt:
    cmp carpim,1
    je asal
    mov ah,09
    lea si,string1 
    int 21h
    jmp son
    
    
    asal:
    mov ah,09
    lea si, string2
    int 21h
    
    son: 
     
    
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
