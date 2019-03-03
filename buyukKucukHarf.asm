.model small

data segment
     yazi db 'karabuk universitesi$'
ends

stack segment
    db   64  dup(0)
ends

code segment
start:
; set segment registers:
    ANA PROC FAR
    mov ax, data
    mov ds, ax
    ;mov es, ax  
                       
    mov al,0
    mov cx,20
    lea si,yazi
    
    bas:
        mov al,[si]
        cmp al,61h
        jae git
    
    don:
        inc si
        loop bas
        jmp son
    git:
        sub al,20h
        mov [si],al
        jmp don
    son:    
    mov ah,4CH
    int 21h
    
    ANA ENDP        
    END ANA
     
ends

end start ; set entry point and stop the assembler.
