.model small
.stack 100h
.data
msg db "*$" 
spp db " $"
new1 db 0ah,0dh,"$" 
count dw 1  
i dw 0
j dw 0
inner dw 0
outer dw 0
.code
main proc 
     
     mov ax,data
     mov ds,ax
     
     mov ah,1
     int 21h
     sub ax,48 
     mov outer,ax 
     mov inner,ax
     sub ax,1
     add inner,ax
     
     
     
     mov bx,1
     ;add bx,1  
     
     ;mov cx,bx 
     mov cx,0
     
      
     mov ah,9
     lea dx,new1 
     int 21h
     
     while: 
         mov ax,outer
         cmp bl,al
         jle print
         jmp end
         
         
         
     print:
         
         cmp cl,bl
         jge dd 
         mov ah,9
         lea dx,msg
         int 21h
         add cx,1 
         jmp print 
         
         
         
         
         
         
     dd:mov dx,inner
        add i,bx
        add i,bx
        sub dx,i
        mov i,dx 
        mov cx,0
        ;mov ax,i
        jmp space
        
     space:
         mov ax,i
         cmp cl,al
         jge dd2
         mov ah,9
         lea dx,spp
         int 21h
         add cx,1
         jmp space
         
      dd2:
         mov ax,outer
         cmp bl,al
         je cx1 
         mov cx,0
         jmp dd3 
      cx1:
      mov cx,1
      jmp dd3
         
       dd3:
         cmp cl,bl
         je renew 
         mov ah,9
         lea dx,msg
         int 21h 
         add cl,1
         jmp dd3
       renew:
         add bx,1
         mov cx,0
         mov i,cx
         mov ah,9
         lea dx,new1 
         int 21h
         jmp while
         
           
           
          
     
    
    
    
    
   end: 
    mov ah,4ch
    int 21h
    main endp
end main