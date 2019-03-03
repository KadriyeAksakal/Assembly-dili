; multi-segment executable file template.

data segment
    ; add your data here!
    sayi1 db 0
    sayi2 db 0
    toplam dw 0
    fark db 0
    carpim dw 0
    bolum db 0
    sayi1u db '1. sayiyi giriniz = $'
    sayi2u db '2. sayiyi giriniz = $'
    top db 'Toplam = $'
    frk db 'Fark = $'
    carp db 'Carpim = $'
    bol db 'Bolum = $'
    satir db 0
    sutun db 0   
    sayi db 4 dup(0)   4
    bas1 db 100
    bas2 db 100
    bas3 db 100
    bas4 db 100


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
    
   
    mov ax,00h
    lea dx,sayi1u
    mov ah,09h
    int 21h 
    
    mov ax,00h
    mov ah,01h
    int 21h
    sub al,30h
    mov bl,10
    mul bl
    mov sayi1,al 
    
    mov ah,01h
    int 21h
    sub al,30h
    add al,sayi1
    mov sayi1,al
    
    call imlec
    
    mov ax,00h
    lea dx,sayi2u
    mov ah,09h
    int 21h  
    
    
    mov ax,00h
    mov ah,01h
    int 21h 
    sub al,30h  
    mov bl,10
    mul bl
    mov sayi2,al
    
    mov ah,01h
    int 21h
    sub al,30h
    add al,sayi2
    mov sayi2,al
    
    call imlec
    
    call toplamyazdir 
    
    call imlec
    
    call farkyazdir
    
    call imlec
    
    call carpimyaz
    
    call imlec
    
    call bolumyaz
                    
                    
    
    
    
    
    
            
    imlec proc
        inc satir
        mov ax,00h
        mov dl,sutun
        mov dh,satir 
        mov ah,02h
        mov bl,00h
        int 10h
        
        ret
    imlec endp
    
    toplamyazdir proc 
         
        lea dx,top
        mov ah,09h
        int 21h
        
        mov ax,00h
        mov al,sayi1
        add al,sayi2
        
        mov bl,10
        div bl
        push ax 
        mov dh,ah
        mov ah,00h
        div bl 
        push ax 
        add al,30h
        add ah,30h
        mov dh,ah
        mov dl,al
        mov ah,02h
        int 21h 
        mov dl,dh
        mov ah,02h
        int 21h
        pop ax
        pop ax
        mov al,ah
        add al,30h
        mov dl,al
        mov ah,02h
        int 21h
       
        ret
    toplamyazdir endp 
    
    farkyazdir proc
        
        lea dx,frk
        mov ah,09h
        int 21h
        
        mov ax,00h
        mov al,sayi1
        cmp al,sayi2
        jb ikieksibir
        jnb devam
        devam:
        sub al,sayi2
        cmp al,10
        jnb bireksiikiic
        add al,30h
        mov dl,al
        mov ah,02h
        int 21h
        jmp son
        bireksiikiic: 
            mov ax,00h
            mov al,sayi1
            sub al,sayi2
            mov bl,10
            div bl
            add ah,30h
            add al,30h
            mov dl,al
            mov dh,ah
        
            mov ah,02h
            int 21h
            mov dl,dh
            mov ah,02h
            int 21h
            jmp son
        
        ikieksibir:
            mov al,sayi2
            sub al,sayi1
            cmp al,10
            ja ikieksibiric
            add al,30h
            mov dl,al
            mov ah,02h
            int 21h  
            jmp son
        ikieksibiric:
            mov bl,10
            div bl
            add ah,30h
            add al,30h
            mov dl,al
            mov dh,ah
            
            mov ah,02h
            int 21h
            mov dl,dh
            mov ah,02h
            int 21h  
            son:
            
        ret
    farkyazdir endp 
    
    carpimyaz proc 
        
         lea dx,carp
        mov ah,09h
        int 21h  
        
       ; mov al,sayi1
       ; mul sayi2
       ; mov carpim,ax
       ; push ax
        
       ; mov ah,00h
       ; mov bl,10
       ; div bl
         
      ;  mov bx,1000
      ;  div bx    
      ;  add al,30h
      ;  add ah,30h
      ;  add dl,30h
      ;  add dh,30h
      ;  mov bas1,al
      ;  pop ax
      ;  push ax
      ;  mov bx,100
      ;  div bx
      ;  add al,30h
      ;  mov bas2,al
      ;  pop ax
      ;  push ax
      ;  mov ah,00h
      ;  mov bl,10
      ;  add al,30h
      ;  add ah,30h
      ;  mov bas3,al
      ;  mov bas4,ah
        
              ; çcozulemedi
        ret
    carpimyaz endp
    
    
    
    bolumyaz proc 
        
        lea dx,bol
        mov ah,09h
        int 21h
                
        mov ax,00h
        mov al,sayi1
        div sayi2
        
        cmp al,10
        jae ikibas
        add al,30h
        mov dl,al
        mov ah,02h
        int 21h
        jmp ikibasson
        ikibas:
        
        mov ah,00h
        mov bl,10
        div bl
        add al,30h
        add ah,30h
        mov dh,ah
        mov dl,al
        
        mov ah,02h
        int 21h
        mov dl,dh
        mov ah,02h
        int 21h        
         
        ikibasson:       
        
        
        
        
        
        
        ret
    bolumyaz endp  
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
