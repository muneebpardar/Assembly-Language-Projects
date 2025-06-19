display macro parameter  
    
    mov dx,offset parameter
    mov ah,9
    int 21h   
    
endm      
                                            
newLine macro                                
                                             
    mov dl,10                                					    
    mov ah,2                                 
    int 21h                                                                                                            
    mov dl,13                                
    mov ah,2
    int 21h
                                 
    
endm

.model small
.stack 100h
.data
                    
                    
   input_password db 'Please Enter Your Password$'
   password db 'qwerty$'
   incorrect_password db 10,13, 'Incorrect Password$'    
   welcome db 10,13,10,13, '===========|||||WELCOME TO MEDICAL STORE===========|||||$'
   
   
   msg1 db 10,13,10,13, 'Choose a Option$' 
   
   
   msg2 db 10,13,10,13,           'What Do You Want To Buy$'
   msg_medicines db 10,13,        'Press 1 to buy medicines$'
   medicines_sold db 10,13,       'Press 2 to see medicines statistics$'
   input_again db 10,13,          'Please Press one of the above given keys$'
   
   wrong_input db 10,13,   'Wrong Input$'
   exit_program db 10,13,  'Press 4 to exit$'
   
   opt1 db 10,13, '1. Panadol                 - 40rs$'
   opt2 db 10,13, '2. Paracetamol             - 30rs$'
   opt3 db 10,13, '3. Cleritek                - 20rs$'
   opt4 db 10,13, '4. Aspirin                 - 20rs$'
   opt5 db 10,13, '5. Brufen                  - 10rs$'
   opt6 db 10,13, '6. Surbex Z                - 50rs$'
   opt7 db 10,13, '7. Arinac                  - 40rs$'
   opt8 db 10,13, '8. Sinopharm Vaccine       - 20rs$'
   opt9 db 10,13, '9. Pfizer Vaccine          - 80rs$'
   
   newLine db 10,13, '$'  
      
   msg_panadol db 10,13,     'How many panadols do you want to buy$'
   msg_paracetamol db 10,13, 'How many paracetamol do you want to buy$'
   msg_cleritek db 10,13,    'How many cleritek do you want to buy$'
   msg_aspirin db 10,13,     'How many aspirin do you want to buy$'
   msg_brufen db 10,13,      'How many brufen do you want to buy$'
   msg_surbex db 10,13,      'How many subex do you want to buy$'
   msg_arinac db 10,13,      'How many arinac do you want to buy$'
   msg_sinopharm db 10,13,   'How many Sinopharm Vaccine do you want to buy$'
   msg_pfizer db 10,13,      'How many Pfizer Vaccine do you want to buy$'
   
   
   total_msg db 'Total Bill= $'
   
   ;Prices Variables
   
   price_panadol dw 40
   price_paracetamol dw 30
   price_cleritek dw 20    
   price_aspirin dw 20
   price_brufen dw 10
   price_surbex dw 50    
   price_arinac dw 40
   price_sinopharm dw 20
   price_pfizer dw 800    
   
   ; Amount
   
   amount_earned db 10,13,'Amount earned= $'
   amount dw 0
   amount_print db 10,13,'Press 3 to show amount earned today$'
  
   
   ;Medicines Sold
   panadol_sold dw 0
   paracetamol_sold dw 0
   cleritek_sold dw 0
   aspirin_sold dw 0
   brufen_sold dw 0
   surbex_sold dw 0
   arinac_sold dw 0
   sinopharm_sold dw 0
   pfizer_sold dw 0
   
   ;Medicines Print
   
   panadol_print db 10,13,'Panadols           sold = $'
   pfizer_print db 10,13,'Pfizer Vaccine     sold = $'
   sinopharm_print db 10,13,'Sinopharm Vaccine  sold = $'
   arinac_print db 10,13,'Arinac             sold = $'
   surbex_print db 10,13,'Surbex             sold = $'
   aspirin_print db 10,13,'Aspirin            sold = $'
   brufen_print db 10,13,'Brufen             sold = $'
   cleritek_print db 10,13,'Cleritek           sold = $'
   paracetamol_print db 10,13,'Paracetamol        sold = $'
    
  
.code
    main proc
        
        
        mov ax,@data
        mov ds,ax
        retry_password:         
        display input_password
        newLine
    
        mov bx,offset password
        mov cx,6
    
        l1:
        mov ah,7
        int 21h
        cmp al,[bx]
        jne incorrect
        inc bx
        loop l1
    
        start:
    
        newLine  
  
        call menu
        newLine
   
        mov ah,1
        int 21h
    
        cmp al,'1'
        je menu2  
        cmp al,'2'
        je medicines_stats
        cmp al,'3'
        je show_amount
        cmp al,'4'
        je exit
    
        display wrong_input
   
        display input_again
     
        jmp start
     
     
     
        panadol:
        display msg_panadol
       
        newLine
          
        
        mov ah,1
        int 21h
        mov ah,0
        sub al,48
        
        
        add panadol_sold,ax
        
        mul price_panadol
        
        add amount,ax
        mov cx,ax
        newLine
       
        display total_msg
     
        
        mov bx,cx
        call print_digits
        
        jmp start
    
        paracetamol:
    
        display msg_paracetamol
       
        newLine
               
        
        mov ah,1
        int 21h
         xor ah,ah
        sub al,48
        
        add paracetamol_sold,ax
        mul price_paracetamol
        
        add amount,ax
        mov cx,ax
        newLine
        
        display total_msg
        
        mov bx,cx
        call print_digits
        jmp start
        
                              
    
        cleritek:
        
        display msg_cleritek
        newLine
              
        
        mov ah,1
        int 21h
        
        sub al,48
        xor ah,ah
        add cleritek_sold,ax
        mul price_cleritek
        
        add amount,ax
        mov cx,ax
         newLine
        
        display  total_msg
        
        

        mov bx,cx
        call print_digits
        jmp start
        
        aspirin:
         
        display msg_aspirin
        
            
        newLine
            
        
        mov ah,1
        int 21h
        
        sub al,48
         xor ah,ah
        add aspirin_sold,ax
        mul price_aspirin
        
        add amount,ax
        mov cx,ax
        newLine
       
        display  total_msg
       
        
      

         mov bx,cx
        call print_digits
         
                
        jmp start
           
        brufen:
         
        display msg_brufen
        
            
        newLine
        
        mov ah,1
        int 21h
        
        sub al,48
          xor ah,ah
        add brufen_sold,ax
        mul price_brufen
        
        add amount,ax
        mov cx,ax
        newLine
        
        
        display total_msg
       
        
        mov bx,cx
        call print_digits
         
                
        jmp start
        
        surbex:
         
        display msg_surbex
       
        newLine
              
        
        mov ah,1
        int 21h
        
        sub al,48
          xor ah,ah
        add surbex_sold,ax
        mul price_surbex
        
        add amount,ax
        mov cx,ax
        
        newLine
        display total_msg
       
        
        mov bx,cx
        call print_digits 
                
        jmp start
     
        arinac:
         
        display msg_arinac
        
        newLine
          
        
        mov ah,1
        int 21h
        
        sub al,48
         xor ah,ah
        add arinac_sold,ax
        mul price_arinac
        
        add amount,ax
        mov cx,ax
        
        newLine
        display total_msg
       
       
        

        mov bx,cx
        call print_digits
                
        jmp start
        
        sinopharm:
         
        display msg_sinopharm
       
        newLine
      
        mov ah,1
        int 21h
        
        sub al,48
          xor ah,ah
        add sinopharm_sold,ax
        mul price_sinopharm
        
        add amount,ax
        mov cx,ax
       
        newLine
        display total_msg
       
                
        mov bx,cx
        call print_digits        
                
        jmp start
     
        
        
        pfizer:
         
       display msg_pfizer
       
            
        newLine
             
        
        mov ah,1
        int 21h
          
        sub al,48
          xor ah,ah
        add pfizer_sold,ax
        mul price_pfizer
        
        add amount,ax
        mov cx,ax
        newLine
       
       display total_msg
        
        ;mov dl,cl
        ;add dl,48
        ;mov ah,2
        ;int 21h

        mov bx,cx
        call print_digits
                
        jmp start
      
        
        ; Show Medicine Statistics Start
        
        
        medicines_stats:
          
       display panadol_print
       
        
        mov bx,panadol_sold
        call print_digits
        
       display paracetamol_print
       
        mov bx,paracetamol_sold
        call print_digits
        
        
       display cleritek_print
       
        mov bx,cleritek_sold
        call print_digits
        
       display aspirin_print
       
        mov bx,aspirin_sold
        call print_digits
        
                
       display brufen_print
       
        
        mov bx,brufen_sold
        call print_digits
        
       display arinac_print
       
        
        mov bx,arinac_sold
        call print_digits
        
       display pfizer_print
       
                
        mov bx,pfizer_sold
        call print_digits
        
       display sinopharm_print
       
        
        mov bx,sinopharm_sold
        call print_digits
        
        jmp start
        
        ; Show Medicine Statistics End
        
        ;Show Amount Function
        
        show_amount: 
        
        display amount_earned
       
         
        mov bx,amount
        call print_digits
        jmp start 
          
        ;Show Amount Function End
        
        incorrect:
        
        display incorrect_password
        newLine
        jmp retry_password 
        
        exit:
        mov ah,4ch
        int 21h
            
main endp
    
  menu proc
      
         display welcome

         display msg1            

         display msg_medicines

         display medicines_sold
                                           
         display amount_print
 
         display exit_program
             
        ret
          
    menu endp
    
    menu2 proc  
                   display msg2
       
                  
                   display opt1
       
        
                   display opt2
        
            
                   display opt3
       
        
                   display opt4
        
        
                   display opt5
         
            
                   display opt6
        
        
                   display opt7
       
        
                   display opt8
       
                  
                   display opt9
       
        newLine
        
        mov ah,1
        int 21h
        
        cmp al,'1'
        je panadol  
        cmp al,'2'
        je paracetamol
        cmp al,'3'
        je cleritek
        cmp al,'4'
        je aspirin
        cmp al,'5'
        je brufen  
        cmp al,'6'
        je surbex
        cmp al,'7'
        je arinac
        cmp al,'8'
        je sinopharm
        cmp al,'9'
        je pfizer
        
        ret
            
            
    menu2 endp 
    
    print_digits proc
    
        mov ax,bx
        
        xor dx,dx   ;clears reg
        mov bx,10     ;divisor 
        xor cx,cx
        ll1:
        div bx
        push dx   ;ax store qoutient dx store remainder
        xor dx,dx
        xor ah,ah
        inc cx      ;track cx
        cmp ax,0       ;if no quotient left
        jne ll1
        
        ll2:
        pop dx
        add dx,48
        mov ah,2
        int 21h
        loop ll2 
            ret

        print_digits endp     
                
end main