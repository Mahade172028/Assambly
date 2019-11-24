.model small
.stack 100h
.data
A db 6 dup(?) 
sum dw 0 
t dw 0
.code
main proc 
     
     mov ax,data
     mov ds,ax
     mov di,0 
     mov bx,1 
     mov cx,0
     mov si,0
     
     Loop1: 
      cmp di,6
      je Loop2 
      mov ah,1
      int 21h
      sub al,30h
      mov A[di],al
      add di,1
      jmp Loop1
      
      Loop2:
      cmp bx,6
      je dd
       
      mov cl,[bx+A]
      mov si,bx
      sub si,1
      jmp innerloop
      add bx,1
      jmp Loop2
      
      innerloop:
        cmp si,0
        jge test2
        add si,1
        mov A[si],cl
        add bx,1
        jmp Loop2
        
        
        test2:
            cmp A[si],cl
            jg test3 
            add si,1
            mov A[si],cl
            add bx,1
            jmp Loop2
      
         
         test3:
              ;mov t,si
              mov al,A[si]
              add si,1 
              ;mov ax,A[t]
              mov A[si],al
              sub si,2
              jmp innerloop
           
      
     dd:
       mov di,0
       jmp print
      
           
      print: 
          
           cmp di,6
           je end
           mov ah,2
           ;mov cx,sum
           mov dl,A[di]
           add dl,30h 
           int 21h
           add di,1
           jmp print    
     
    
    
    
    
    end:
    mov ah,4ch
    int 21h
    main endp
end main