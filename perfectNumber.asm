.model small
.stack 100h
.data
msgp db "yes$"
msgnp db "no$"
per dw 7


.code
main proc
    
    mov ax,data
    mov ds,ax
    
    mov cx,0
    mov bx,per
    sub bx,1
    
    itter:
         cmp bx,0
         je check
         mov dx,0
         mov ax,per
         div bx
         cmp dx,0
         je sum
         sub bx,1 
         jmp itter
    
    
    
   sum:
      add cx,bx 
      sub bx,1
      jmp itter
    
   check:
      cmp cx,per
      je yes
      mov ah,9
      lea dx,msgnp 
      int 21h
      jmp end
      
      
    yes:
      mov ah,9
      lea dx,msgp
      int 21h
      jmp end
    
    
    
    
    
    end:
    mov ah,4ch
    int 21h
main endp
end main