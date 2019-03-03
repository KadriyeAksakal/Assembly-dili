; multi-segment executable file template.

data segment
   
ends

stack segment
    
ends

code segment
start:
    org 100h
    mov cx,5
    
    git:
        mov dh,1
     
        basla:
        call kursor
        call yaz
        inc dl
        inc dh
        cmp dh,5
        jne basla
        
        basla2:
        call kursor
        call yaz
        inc dl
        dec dh
        cmp dh,1
        jne basla2
    loop git
    
    kursor proc
        mov ah,02h
        mov bh,00h
        int 10h
        ret
    kursor endp
    
    yaz proc 
        push dx
        lea dx,isim
        mov ah,09h
        int 21h
        pop dx
        ret
    yaz endp
    
    ret 
    isim db "*$"
    
     
ends

end start ; set entry point and stop the assembler.
