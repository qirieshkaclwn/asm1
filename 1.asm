org 100h        

jmp start        


a   db 23
b   db -30
c   db 42   
d   db 21
res dw ?


start:
    mov al, a; a->al
    imul al;ax = al**al
    mov res, ax;529
    ;call print_ax
    
    xor ax,ax; çàòèðàåì ax
    mov al, c;c->al
    mov cl, b;b->cl
    idiv cl;AL-÷àñòíîå, AH-îñòàòîê
    cbw;ðàñøèðÿåì al äî ax ÷òî áû íå ïîòåðÿòü ìèíóñ 
    ;call print_ax;âûâîäèì ax    
    sub res,ax;âû÷åòàåì ax èç res
    
    xor ax,ax; çàòèðàåì ax
    mov al, d 
    mov bl, 4
    mul bl
    add res,ax;
    
    xor ax,ax;
    mov ax,res; 
    call print_ax;
    
    print_ax:
       test ax, ax
       jns oi1
       mov cx, ax
       mov ah, 02h
       mov dl, '-'
       int 21h
       mov ax, cx
       neg ax
    oi1:  
        xor cx, cx
        mov bx, 10
    oi2:
        xor dx,dx
        div bx
        push dx
        inc cx
        test ax, ax
        jnz oi2
        mov ah, 02h
    oi3:
        pop dx
        add dl, '0'
        int 21h
        loop oi3 
        
