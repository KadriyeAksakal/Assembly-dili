; multi-segment executable file template.

data segment
   isim db 'Cross-Platform Hybridde herhangi bir controller olusturdugumuzda$' 
    
   satir db 0
   sutun db 0 
   sayac db 0
   
ends

stack segment
    
ends

code segment
start:
    
    mov ax, data
    mov ds, ax
    mov es, ax
    
   
    lea si,isim
    
    mov ah,09h
    mov dx,offset isim
    int 21h
    
    inc satir 
    mov dl,sutun
    mov dh,satir
    mov bl,00h
    mov ah,02h    
    int 10h
    
    bak:
      mov al,[si]
      inc si
      
      cmp al,61h  ;a
      je sesli
      
      
      cmp al,65h  ;e
      je sesli
      
      cmp al,69h  ;i
      je sesli 
      
      cmp al,6Fh  ;o
      je sesli  
      
      cmp al,75h  ;u
      je sesli 
      
      
      mov ah,02
      mov dl,al
      int 21h
      call sutunatla
      
    
    don:
      inc sayac
      cmp sayac,63
      jbe bak
      
      jmp son 
         
   
    sesli:
       mov bl,3
       mov cx,0
       mov ah,09h
       int 10h
        call sutunatla
       jmp don  
       
     sutunatla proc
        ;sutun atlama
        inc sutun
        mov ax,00h
        mov dx,00h
        mov dl,sutun
        mov dh,satir 
        mov ah,02h
        mov bl,00h
        int 10h
        ret
        sutunatla endp
    jmp son
        
   
    
    son:
    mov ax, 4c00h ; exit to operating system.
    int 21h 
    
    
ends

end start ; set entry point and stop the assembler.

