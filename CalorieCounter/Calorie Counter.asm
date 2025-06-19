org 100h

.model small

Calculate macro calories, protein, carbs, fat, subcategory
    mov ax, total_calories
    add ax, calories
    mov total_calories, ax

    mov ax, total_protein
    add ax, protein
    mov total_protein, ax

    mov ax, total_carbs
    add ax, carbs
    mov total_carbs, ax

    mov ax, total_fat
    add ax, fat
    mov total_fat, ax

    jmp subcategory
    hello endm

.stack 100h

.data
; fruits
    GRAPEFRUIT_CALORIES dw 131
    GRAPEFRUIT_PROTEIN dw 5
    GRAPEFRUIT_CARBS dw 25
    GRAPEFRUIT_FAT dw 1
    
    AVOCADO_CALORIES dw 130
    AVOCADO_PROTEIN dw 3
    AVOCADO_CARBS dw 28
    AVOCADO_FAT dw 0
    
    BANANA_CALORIES dw 89
    BANANA_PROTEIN dw 1
    BANANA_CARBS dw 23
    BANANA_FAT dw 0
    
    GUAVA_CALORIES dw 265
    GUAVA_PROTEIN dw 9
    GUAVA_CARBS dw 49
    GUAVA_FAT dw 3    
    
    APPLE_CALORIES dw 239
    APPLE_PROTEIN dw 27
    APPLE_CARBS dw 0
    APPLE_FAT dw 14
    
    
    ;Vegetables
    SPINACH_CALORIES dw 130
    SPINACH_PROTEIN dw 3
    SPINACH_CARBS dw 28
    SPINACH_FAT dw 0
    
    BROCCLI_CALORIES dw 265
    BROCCLI_PROTEIN dw 9
    BROCCLI_CARBS dw 49
    BROCCLI_FAT dw 3
    
    CARROT_CALORIES dw 239
    CARROT_PROTEIN dw 27
    CARROT_CARBS dw 0
    CARROT_FAT dw 14
    
    PEAS_CALORIES dw 131
    PEAS_PROTEIN dw 5
    PEAS_CARBS dw 25
    PEAS_FAT dw 1
    
    POTATO_CALORIES dw 250
    POTATO_PROTEIN dw 26
    POTATO_CARBS dw 0
    POTATO_FAT dw 15
    
    ;Grains 
    
    
    
    RICE_CALORIES dw 130
    RICE_PROTEIN dw 3
    RICE_CARBS dw 28
    RICE_FAT dw 0
    
    BREAD_CALORIES dw 265
    BREAD_PROTEIN dw 9
    BREAD_CARBS dw 49
    BREAD_FAT dw 3
    
    PASTA_CALORIES dw 131
    PASTA_PROTEIN dw 5
    PASTA_CARBS dw 25
    PASTA_FAT dw 1
    
    OAT_CALORIES dw 265
    OAT_PROTEIN dw 9
    OAT_CARBS dw 49
    OAT_FAT dw 3
    
    BARLEY_CALORIES dw 131
    BARLEY_PROTEIN dw 5
    BARLEY_CARBS dw 25
    BARLEY_FAT dw 1
    
    
    
    ; Meat
    
    CHICKEN_CALORIES dw 239
    CHICKEN_PROTEIN dw 27
    CHICKEN_CARBS dw 0
    CHICKEN_FAT dw 14
    
    BEEF_CALORIES dw 250
    BEEF_PROTEIN dw 26
    BEEF_CARBS dw 0
    BEEF_FAT dw 15
    
    MUTTON_CALORIES dw 239
    MUTTON_PROTEIN dw 27
    MUTTON_CARBS dw 0
    MUTTON_FAT dw 14
    
    FISH_CALORIES dw 239
    FISH_PROTEIN dw 27
    FISH_CARBS dw 0
    FISH_FAT dw 14
    
    RABBIT_CALORIES dw 239
    RABBIT_PROTEIN dw 27
    RABBIT_CARBS dw 0
    RABBIT_FAT dw 14
        

    total_calories dw 0
    total_protein dw 0
    total_carbs dw 0
    total_fat dw 0
    
    titl db 13, 10, "********** Welccome to My Fitness Pal **********$",13, 10, 13, 10 
    menuText db 13, 10, 13, 10, 13, 10, "1. Fruits", 13, 10, "2. Vegetables", 13, 10, "3. Grains", 13, 10, "4. Meat", 13, 10, "5. Total Calories", 13, 10, "0. Exit", 13, 10, 13, 10, "Enter choice (0-5): $"
    subMenu_01 db 13, 10, 13, 10, "1. Grape Fruit", 13, 10, "2. Avocado", 13, 10, "3. Banana", 10, 13, "4. Guava", 10, 13, "5. Apple", 10, 13, "0. Main Menu", 10, 13, 10, 13, "Enter choice (0-5): $"
    subMenu_02 db 13, 10, 13, 10, "1. Spinach", 13, 10, "2. Broccli", 13, 10, "3. Carrot", 10, 13, "4. Peas", 10, 13, "5. Potatao", 10, 13, "0. Main Menu", 10, 13, 10, 13, "Enter choice (0-5): $"
    subMenu_03 db 13, 10, 13, 10, "1. Rice", 13, 10, "2. Bread", 13, 10, "3. Pasta", 10, 13, "4. Oat", 10, 13, "5. Barley", 10, 13, "0. Main Menu", 10, 13, 10, 13, "Enter choice (0-5): $"
    subMenu_04 db 13, 10, 13, 10, "1. Chicken", 13, 10, "2. Beef", 13, 10, "3. Mutton", 10, 13, "4. Fish", 10, 13, "5. Rabbit", 10, 13, "0. Main Menu", 10, 13, 10, 13, "Enter choice (0-5): $"
    
    
    
    note db 13, 10, 13, 10, "Note: The nutritional values displayed are per 100 grams of food.$", 13, 10, 13, 10
    resultText_01 db 13, 10, 13, 10, "Total Calories: $"
    resultText_02 db 13, 10, "Total Protein:  $"
    resultText_03 db 13, 10, "Total Carbs:    $"
    resultText_04 db 13, 10, "Total Fats:     $"
    msg_error db 13, 10, "Invalid Input! You can only enter digits from 0 - 5$"

.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; Printing Title
    mov ah, 09h
    lea dx, titl
    int 21h
    
    call DisplayMenu


DisplayMenu:
    
    ; Display menu options for the user
    lea dx, menuText
    mov ah, 09
    int 21h

    ; Read user input
    call input
    
    ; Process user input
    cmp al, 1
    je fruits
    cmp al, 2
    je vegetables
    cmp al, 3
    je grains
    cmp al, 4
    je meat
    cmp al, 5
    je CalculateTotal
    cmp al, 0
    je Exit
    jmp DisplayMenu ; Unconditional jmp, for displaying menu after each choice

fruits:
    lea dx, subMenu_01
    mov ah, 09
    int 21h
    
    call input
    cmp al, 1
    je Grapefruit
    cmp al, 2
    je Avocado
    cmp al, 3
    je Banana
    cmp al, 4
    je Guava
    cmp al, 5
    je Apple    
    cmp al, 0
    je DisplayMenu
    
    jmp fruits
    
vegetables:
    lea dx, subMenu_02
    mov ah, 09
    int 21h
    
    call input
    cmp al, 1
    je Spinach
    cmp al, 2
    je Broccli
    cmp al, 3
    je Carrot
    cmp al, 4
    je Peas
    cmp al, 5
    je Potato    
    cmp al, 0
    je DisplayMenu
    
    jmp vegetables

grains:
    lea dx, subMenu_03
    mov ah, 09
    int 21h
    
    call input
    cmp al, 1
    je Rice
    cmp al, 2
    je Bread
    cmp al, 3
    je Pasta
    cmp al, 4
    je Oat
    cmp al, 5
    je Barley    
    cmp al, 0
    je DisplayMenu
    
    jmp grains

meat:
    lea dx, subMenu_04
    mov ah, 09
    int 21h
    
    call input
    cmp al, 1
    je Chicken
    cmp al, 2
    je Beef
    cmp al, 3
    je Mutton
    cmp al, 4
    je Fish
    cmp al, 5
    je Rabbit    
    cmp al, 0
    je DisplayMenu
    
    jmp meat
        
Grapefruit:
    Calculate GRAPEFRUIT_CALORIES, GRAPEFRUIT_PROTEIN, GRAPEFRUIT_CARBS, GRAPEFRUIT_FAT, fruits
        
Avocado:
    Calculate AVOCADO_CALORIES, AVOCADO_PROTEIN, AVOCADO_CARBS, AVOCADO_FAT, fruits

Banana:
    Calculate BANANA_CALORIES, BANANA_PROTEIN, BANANA_CARBS, BANANA_FAT, fruits

Guava:
    Calculate GUAVA_CALORIES, GUAVA_PROTEIN, GUAVA_CARBS, GUAVA_FAT, fruits
    
Apple:
    Calculate APPLE_CALORIES, APPLE_PROTEIN, APPLE_CARBS, APPLE_FAT, fruits
    



Spinach:
    Calculate SPINACH_CALORIES, SPINACH_PROTEIN, SPINACH_CARBS, SPINACH_FAT, vegetables
    
Broccli:
    Calculate BROCCLI_CALORIES, BROCCLI_PROTEIN, BROCCLI_CARBS, BROCCLI_FAT, vegetables
    
Carrot:
    Calculate CARROT_CALORIES, CARROT_PROTEIN, CARROT_CARBS, CARROT_FAT, vegetables
    
Peas:
    Calculate PEAS_CALORIES, PEAS_PROTEIN, PEAS_CARBS, PEAS_FAT, vegetables
    
Potato:
    Calculate POTATO_CALORIES, POTATO_PROTEIN, POTATO_CARBS, POTATO_FAT, vegetables




Rice:
    Calculate RICE_CALORIES, RICE_PROTEIN, RICE_CARBS, RICE_FAT, grains
    
Bread:
    Calculate BREAD_CALORIES, BREAD_PROTEIN, BREAD_CARBS, BREAD_FAT, grains
    
Pasta:
    Calculate PASTA_CALORIES, PASTA_PROTEIN, PASTA_CARBS, PASTA_FAT, grains

Oat:
    Calculate OAT_CALORIES, OAT_PROTEIN, OAT_CARBS, OAT_FAT, grains
    
Barley:
    Calculate BARLEY_CALORIES, BARLEY_PROTEIN, BARLEY_CARBS, BARLEY_FAT, grains
    



Chicken:
    Calculate CHICKEN_CALORIES, CHICKEN_PROTEIN, CHICKEN_CARBS, CHICKEN_FAT, meat

Beef:
    Calculate BEEF_CALORIES, BEEF_PROTEIN, BEEF_CARBS, BEEF_FAT, meat
    
Mutton:
    Calculate MUTTON_CALORIES, MUTTON_PROTEIN, MUTTON_CARBS, MUTTON_FAT, meat
    
Fish:
    Calculate FISH_CALORIES, FISH_PROTEIN, FISH_CARBS, FISH_FAT, meat

Rabbit:
    Calculate RABBIT_CALORIES, RABBIT_PROTEIN, RABBIT_CARBS, RABBIT_FAT, meat


    

CalculateTotal:
    ; Display message "Total Calories:"
    lea dx, resultText_01
    mov ah, 09
    int 21h

    ; Display total_calories
    mov ax, total_calories
    call PrintNumber
    
    ; Display message "Total Protein:"
    lea dx, resultText_02
    mov ah, 09
    int 21h

    ; Display total_protein
    mov ax, total_protein
    call PrintNumber
    
    ; Display message "Total Carbs:"
    lea dx, resultText_03
    mov ah, 09
    int 21h

    ; Display total_calories
    mov ax, total_carbs
    call PrintNumber
    
    ; Display message "Total Fats:"
    lea dx, resultText_04
    mov ah, 09
    int 21h

    ; Display total_calories
    mov ax, total_fat
    call PrintNumber
    
    lea dx, note
    mov ah, 09
    int 21h
    
    jmp DisplayMenu
    
Exit:
.exit

invalidEntry:
    lea dx, msg_error
    mov ah,09
    int 21h
    jmp DisplayMenu

PrintNumber:
    ; Display the number stored in AX register
    mov bx, 10 ; will be used as diviser
    mov cx, 0  ; setting counter register to 0
    
    ; Loop to extract digits
    L1:
    mov dx, 0 ; setting DX to 0, because remainder stores in DX register
    div bx    ; divide AX by BX. AX receives the quotient, and DX receives the remainder.
    push dx   ; pushing quotient (least significant digit) in stack
    inc cx    ; incrementing counter register
    cmp ax, 0 ; checks if AX (quotient) is not zero (if more digits need to be processed) 
    jnz L1    ; Jumps back to L1 if there are more digits in AX.
    
    ; Loop to display digits
    L2:
    pop dx      ; popping from stack
    add dl, '0' ; converting numbers back to characters
    mov ah, 02  ; printing popped digit
    int 21h
    loop L2

    ret


main endp
;end main

input proc
    mov ah, 01
    int 21h
    sub al, "0"
    cmp al, 0
    jl invalidEntry
    cmp al, 5
    jg invalidEntry
    ret
    input endp