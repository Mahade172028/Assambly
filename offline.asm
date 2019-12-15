.model small
.stack 100h
.data 
ar db 1,2,4
n dw ?
t dw ?
num1 db ?
temp dw ?
cost db "val $" 
k dw 0
value dw 0
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,1
    int 21h
    sub ax,48
    mov k,ax
    
    
    
   jmp sort
   
   Loop1:
      mov ax,k
      cmp al,0
      je exit
      mov bx,2
      mov cl,[bx+ar]
      add value,cx
      sub cx,1
      mov [bx+ar],cl 
      sub k,1
      jmp sort 
    
    
    
    
    
    
    
 sort:
    
    mov n,3
    mov cx,2
outer_loop:
    cmp cx,n
    jge Loop1
    mov Si,cx
    mov bl,ar[Si]
    mov num1,bl
    mov t,cx
    dec t
    mov ax,t
inner_loop:
    mov Si,ax
    mov bl,ar[Si]
    cmp bl,num1
    jg exchange_
    jmp continue_
continue_:
    inc ax
    mov Si,ax 
    mov bl,num1
    mov ar[Si],bl
    inc cx
    jmp outer_loop
exchange_:
    mov temp,ax
    inc temp
    mov Si,temp
    mov ar[Si],bl
    dec ax
    jmp inner_loop 


exit: 
  mov ah,9
  lea dx,cost
  mov ah,2
  int 21h
  mov dx,value
  add dx,48
  mov ah,2
  int 21h 
  
  mov ah,4ch
  int 21h
      
main endp
end main