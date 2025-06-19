.model small
.stack 100h  
.data       
Sneakers_stock dw 20
boots_stock dw 20
football_stock dw 20
cricket_stock dw 20
boxing_stock dw 20
volleyball_stock dw 20
tabletennis_stock dw 20
baseball_stock dw 20
golf_stock dw 20
Sneakers_sold dw 0
Boots_sold dw 0
Football_shoes_sold dw 0
Cricket_shoes_sold dw 0
Boxing_shoes_sold dw 0
Volleyball_shoes_sold dw 0
Tabletennis_shoes_sold dw 0
Baseball_shoes_sold dw 0
Golf_shoes_sold dw 0
Sneakers_print db 10,13, 'Sneakerss sold = $'
Golf_shoes_print db 10,13, 'Golf_shoes sold = $'
Baseball_shoes_print db 10,13, 'Baseball_shoes Vaccine sold = $'
Tabletennis_shoes_print db 10,13, 'Tabletennis_shoes sold = $'
Volleyball_shoes_print db 10,13, 'Volleyball_shoes sold = $'
Cricket_shoes_print db 10,13, 'Cricket_shoes sold = $'
Boxing_shoes_print db 10,13, 'Boxing_shoes sold = $'
Football_shoes_print db 10,13, 'Football_shoes sold = $'
Boots_print db 10,13, 'Boots sold = $'
 present_amount db 10,13, 'present amount :',10,13 ,'$' 
 
 Sneakers_print1 db 10,13, 'Sneakerss stock = $'
Golf_shoes_print1 db 10,13, 'Golf_shoes stock = $'
Baseball_shoes_print1 db 10,13, 'Baseball_shoes  stock = $'
Tabletennis_shoes_print1 db 10,13, 'Tabletennis_shoes stock = $'
Volleyball_shoes_print1 db 10,13, 'Volleyball_shoes stock = $'
Cricket_shoes_print1 db 10,13, 'Cricket_shoes stock = $'
Boxing_shoes_print1 db 10,13, 'Boxing_shoes stock = $'
Football_shoes_print1 db 10,13, 'Football_shoes stock = $'
Boots_print1 db 10,13, 'Boots stock = $'

 
 
  q1 dw ?  
    price_Sneakers dw 40
price_Boots dw 30
price_Football_shoes dw 20
price_Cricket_shoes dw 20
price_Boxing_shoes dw 10
price_Volleyball_shoes dw 50
price_Tabletennis_shoes dw 40
price_Baseball_shoes dw 20
price_Golf_shoes dw 80
 
 quantity db 10,13, 'Enter Quantity', 10,13 ,'$'  
       
    welcome db 10,13,10,13, 'WELCOME TO SHOE STORE$'
msg1 db 10,13,10,13, 'Choose a Option',10,13  ,"$"
msg2 db 10,13,10,13, 'What Do You Want To Buy$'
msg_Shoes db 10,13, 'Press 1 to Buy Shoes$'
Shoes_sold db 10,13, 'Press 2 to see Shoes Statistics$'
amount_print db 10,13,'Press 3 to show Amount Due :$'
input_again db 10,13, 'Please Press one of the above given keys$'
exit_program db 10,13,'Press 4 to exit$'
wrong_input db 10,13, 'Wrong Input$'
    input_password db 'Please Enter Your Password$'
password db 'abcd$'
incorrect_password db 10,13, 'Incorrect Password$' 
opt1 db 10,13, '1. Sneakers -- Rs. 40 ' ,10,13, '$'
opt2 db 10,13, '2. Boots -- Rs. 30 $'           ,10,13 , '$'
opt3 db 10,13, '3. Football_shoes -- Rs. 20 $'         ,10,13,  '$'
opt4 db 10,13, '4. Cricket_shoes -- Rs. 20 $'                 ,10,13,   '$'
opt5 db 10,13, '5. Boxing_shoes -- Rs. 10 $'                     ,10,13,  '$'
opt6 db 10,13, '6. tabletennis_shoes -- Rs. 40 $'       ,10,13,    '$'
opt7 db 10,13, '7. baseball_shoes -- Rs. 20 $'       ,10,13 , '$'
opt8 db 10,13, '8. Volleyball_shoes -- Rs. 50$'        ,10,13 , '$'
opt9 db 10,13, '9. Golf_shoes -- Rs. 80 $'                   ,10,13,  '$'
 re db 10,13, 'do you want to continue(1) or not (2)',10,13,'$'
 result dw ?  
 wrong1 db 10,13,'WRONG INPUT < TRY AGAIN ' ,10,13 , "$"
           p1 db ?
    a db ?
    q db ?
     total1 dw 0
    num2 db ?
   
    total db 10,13,'total $'
.code
main proc    
    
mov ax,@data
mov ds,ax
mov dx,offset input_password
mov ah,9
int 21h

mov bx,offset password

mov cx,4
l1:
mov ah,1
int 21h
cmp al,[bx]
jne incorrect
inc bx
loop l1

 mov dx,offset welcome
 mov ah,9
 int 21h 
 
 menu: 
 
  mov dx,offset msg_Shoes
 mov ah,9
 int 21h
 
  mov dx,offset Shoes_sold
 mov ah,9
 int 21h
 
  mov dx,offset amount_print
 mov ah,9
 int 21h
 
  mov dx,offset exit_program
 mov ah,9
 int 21h  
 
   mov dx,offset msg1
 mov ah,9
 int 21h
 
   mov ah,1
    int 21h
   cmp al,'1'
     je shoesdisplay  
   cmp al,'2'
   je stats
    
   cmp al,'3'
   je tot
   cmp al,'4'
   je exit 
   
   jmp wrong
   
   
   
   
   
   wrong:
   lea dx,wrong1
   mov ah,9
   int 21h
   jmp menu 
   
   
   tot: 
   lea dx,total
   mov ah,9
   int 21h
   mov ax,total1      
   call convert1
   jmp re1
    
    shoesdisplay:
   
 
        mov dx,offset opt1
 mov ah,9
 int 21h    
 
        mov dx,offset opt2
 mov ah,9
 int 21h    
 
        mov dx,offset opt3
 mov ah,9
 int 21h    
 
        mov dx,offset opt4
 mov ah,9
 int 21h    
 
        mov dx,offset opt5
 mov ah,9
 int 21h    
 
        mov dx,offset opt6
 mov ah,9
 int 21h    
 
        mov dx,offset opt7
 mov ah,9
 int 21h    
 
        mov dx,offset opt8
 mov ah,9
 int 21h 
 
         mov dx,offset opt9
 mov ah,9
 int 21h 
 
     mov dx,offset msg1
 mov ah,9
 int 21h          
 
 
      mov ah,1
    int 21h
   cmp al,'1'
   je sneaker   
   
    cmp al,'2'
   je boots1
    cmp al,'3'
   je football1
   
    cmp al,'4'
   je cricket1
   
    cmp al,'5'
   je boxing1
   
    cmp al,'6'
   je tabletennis1
   
    cmp al,'7'
   je basetball1
   
    cmp al,'8'
   je volleyball1
   
    cmp al,'9'
   je golf1
   
   
   sneaker: 
  
     mov bx,price_Sneakers
      mov dx,offset quantity
    mov ah,9
    int 21h   
        
        mov ah,1
        int 21h 
        sub ax,48 
        mov ah,0
          sub Sneakers_stock,ax  
          add Sneakers_sold,ax
         
    mul bx
      add total1,ax

    ; Convert result to ASCII
    mov cx, 0
            ; Initialize counter for digits
call convert1
jmp re1
   boots1:
  
     mov bx,price_Boots 
    mov dx,offset quantity
    mov ah,9
    int 21h   
        
        mov ah,1
        int 21h 
        sub ax,48 
        mov ah,0
            sub boots_stock,ax  
          add boots_sold,ax
    mul bx
      add total1,ax

    ; Convert result to ASCII
    mov cx, 0         ; Initialize counter for digits     
       
call convert1
jmp re1
   football1:
            
     mov bx,price_Football_shoes 
    mov dx,offset quantity
    mov ah,9
    int 21h   
        
        mov ah,1
        int 21h 
        sub ax,48 
        mov ah,0  
        sub football_stock,ax  
          add football_shoes_sold,ax
        
    mul bx
      add total1,ax

    ; Convert result to ASCII
    mov cx, 0 
           ; Initialize counter for digits
call convert1
jmp re1
     
   cricket1:
   
   mov bx, price_Cricket_shoes 
      mov dx,offset quantity
    mov ah,9
    int 21h   
        
        mov ah,1
        int 21h 
        sub ax,48 
        mov ah,0 
        sub cricket_stock,ax  
          add cricket_shoes_sold,ax
         
    mul bx
     add total1,ax

    ; Convert result to ASCII
    mov cx, 0         ; Initialize counter for digits    
     
call convert1
jmp re1
    boxing1:
    
     mov bx,price_Boxing_shoes 
      mov dx,offset quantity
    mov ah,9
    int 21h   
        
        mov ah,1
        int 21h 
        sub ax,48 
        mov ah,0 
        sub boxing_stock,ax  
          add boxing_shoes_sold,ax
          
    mul bx

        add total1,ax
    ; Convert result to ASCII
    mov cx, 0         ; Initialize counter for digits  
     
call convert1
jmp re1
     tabletennis1:
     
     mov bx,price_Tabletennis_shoes 
            mov dx,offset quantity
    mov ah,9
    int 21h   
        
        mov ah,1
        int 21h 
        sub ax,48 
        mov ah,0 
        sub tabletennis_stock,ax  
          add tabletennis_shoes_sold,ax
           
    mul bx
      add total1,ax

    ; Convert result to ASCII
    mov cx, 0         ; Initialize counter for digits 
     
call convert1
jmp re1
     basetball1:
      
     mov bx,price_Baseball_shoes 
       mov dx,offset quantity
    mov ah,9
    int 21h   
        
        mov ah,1
        int 21h 
        sub ax,48 
        mov ah,0 
         sub baseball_stock,ax  
          add baseball_shoes_sold,ax
        
          
    mul bx
       add total1,ax

    ; Convert result to ASCII
    mov cx, 0         ; Initialize counter for digits 
    
call convert1
jmp re1
  
    volleyball1:
   
     mov bx,price_Volleyball_shoes
       mov dx,offset quantity
    mov ah,9
    int 21h   
        
        mov ah,1
        int 21h 
        sub ax,48 
        mov ah,0 
         sub volleyball_stock,ax  
          add volleyball_shoes_sold,ax
       
    mul bx
     add total1,ax

    ; Convert result to ASCII
    mov cx, 0         ; Initialize counter for digits 
    
call convert1
jmp re1
   golf1: 
  
     mov bx,price_Golf_shoes  
       mov dx,offset quantity
    mov ah,9
    int 21h   
        
        mov ah,1
        int 21h 
        sub ax,48 
        mov ah,0 
         sub golf_stock,ax  
          add golf_shoes_sold,ax
       
       
    mul bx
      add total1,ax

    ; Convert result to ASCII
    mov cx, 0         ; Initialize counter for digits  
     
call convert1
jmp re1
   
   
       
  
re1:

        
   mov dx,offset re
   mov ah,9
   int 21h
   
   mov ah,1
   int 21h
   
   cmp al,'1'
   je menu
   
   cmp al,'2'
   je exit
  
        
      
        
stats:   

mov dx,offset Sneakers_print
mov ah,9
int 21h
mov ax,Sneakers_sold
call convert1 

mov dx,offset Sneakers_print1
mov ah,9
int 21h
mov ax,Sneakers_stock
call convert1
 
  
 mov dx,offset Golf_shoes_print
mov ah,9
int 21h
mov ax,Golf_shoes_sold
call convert1 

 mov dx,offset Golf_shoes_print1
mov ah,9
int 21h
mov ax,Golf_stock
call convert1
 
 
mov dx,offset Baseball_shoes_print
mov ah,9
int 21h
mov ax,Baseball_shoes_sold
call convert1 

mov dx,offset Baseball_shoes_print1
mov ah,9
int 21h
mov ax,Baseball_stock
call convert1

 
 mov dx,offset Tabletennis_shoes_print
mov ah,9
int 21h
mov ax,Tabletennis_shoes_sold
call convert1    

 mov dx,offset Tabletennis_shoes_print1
mov ah,9
int 21h
mov ax,Tabletennis_stock
call convert1
 
 
 mov dx,offset Volleyball_shoes_print
mov ah,9
int 21h
mov ax,Volleyball_shoes_sold
call convert1 

 mov dx,offset Volleyball_shoes_print1
mov ah,9
int 21h
mov ax,Volleyball_stock
call convert1

 
 mov dx,offset Cricket_shoes_print
mov ah,9
int 21h
mov ax,Cricket_shoes_sold
call convert1 

 mov dx,offset Cricket_shoes_print1
mov ah,9
int 21h
mov ax,Cricket_stock
call convert1
 
 
 mov dx,offset Boxing_shoes_print
mov ah,9
int 21h
mov ax,Boxing_shoes_sold
call convert1   

 mov dx,offset Boxing_shoes_print1
mov ah,9
int 21h
mov ax,Boxing_stock
call convert1
 
 
  
 mov dx,offset Football_shoes_print
mov ah,9
int 21h
mov ax,Football_shoes_sold
call convert1    

 mov dx,offset Football_shoes_print1
mov ah,9
int 21h
mov ax,Football_stock
call convert1

 
  
 mov dx,offset Boots_print
mov ah,9
int 21h
mov ax,Boots_sold  

  
 mov dx,offset Boots_print1
mov ah,9
int 21h
mov ax,Boots_stock
call convert1
 
     jmp re1
  
        
   
      
      
                                    
    
   jmp exit
incorrect:
mov dx,offset incorrect_password
mov ah,9
int 21h
jmp exit
exit:
mov ah,4ch
int 21h
         endp main 
         
         newline proc
    mov dx,10
    mov ah,2
    int 21h
    mov dx,13
    mov ah,2
    int 21h         ; Call BIOS interrupt
    ret               ; Return from procedure
newline endp
         
       convert1 proc
 
    mov dx, 0         ; Clear DX for division
    mov bx, 10        ; Divisor for decimal conversion
    div bx            ; Divide AX by 10
    add dl, '0'       ; Convert remainder to ASCII
    push dx           ; Push ASCII digit onto stack
    inc cx            ; Increment counter
    test ax, ax       ; Check if AX is 0
    jnz convert1       ; Repeat if AX is not 0
         
    
        
    ; Print result
    call newline
print_result1:

    mov ah, 2         ; Function to print character
    pop dx            ; Pop digit from stack
    int 21h           ; Print character
    loop print_result1
    ret ; Repeat for all digits
       endp convert1                
    end main