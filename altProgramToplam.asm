.model small

data segment
    sonuc dw ?
ends

stack segment
    dw   64  dup(0)
ends

code segment
start:
    
   ANA PROC FAR 
    mov ax, data
    mov ds, ax
    mov es, ax

    mov ax,5
    
    bas:
      add bx,ax
      inc ax
      cmp ax,100
      jbe bas
      mov sonuc,bx
      
      mov ax, 4c00h ; exit to operating system.
      int 21h
      
      ANA ENDP
   END ANA
ends

end start ; set entry point and stop the assembler.
