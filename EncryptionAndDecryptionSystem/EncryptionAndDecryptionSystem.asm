ORG 0100H

JMP start

; Constants
newline                EQU 0AH   ; Newline character (\n)
cret                   EQU 0DH   ; Carriage return (\r)
bcksp                  EQU 08H   ; Backspace (\b)

; Hard-coded string for testing
hardcoded_string       DB  'Oh hi there! This is an encrypted message', cret, newline, '$'

; Input buffer for user-entered strings (max 256 chars + \r + \n + $)
input_string           DB  259 dup ('$')

; UI messages
message_welcome        DB  newline, 'Welcome to the monoalphabetic encryption system!', cret, newline
                       DB  'Please choose how you wish to proceed:', cret, newline
                       DB  '1- Enter string as input (max: 256 chars)', cret, newline
                       DB  '2- Use hard-coded string', cret, newline, '$'

message_using_hc       DB  '===============================', cret, newline
                       DB  'USING YOUR HARDCODED STRING', cret, newline
                       DB  '===============================', cret, newline, '$'

message_using_input    DB  '===============================', cret, newline
                       DB  'Please enter your string below', cret, newline
                       DB  '===============================', cret, newline, '$'

message_try_again      DB  cret, newline, 'Give it one more try? (y/n)', cret, newline, '$'
message_press_key      DB  'Press any key to exit...$', cret, newline

message_display_org    DB  cret, newline, 'Your original string: $'
message_display_enc    DB  cret, 'Encrypted message: $'
message_display_dec    DB  cret, 'Decrypted message: $'
message_encrypting     DB  'Encrypting...$'
message_decrypting     DB  'Decrypting...$'

; Encryption/Decryption tables
encryption_table_lower DB  97 dup (' '), 'qwertyuiopasdfghjklzxcvbnm'
decryption_table_lower DB  97 dup (' '), 'kxvmcnophqrszyijadlegwbuft'

encryption_table_upper DB  65 dup (' '), 'QWERTYUIOPASDFGHJKLZXCVBNM'
decryption_table_upper DB  65 dup (' '), 'KXVMCNOPHQRSZYIJADLEGWBUFT'

; Start of program
start:                 
                       LEA  DX, message_welcome
                       MOV  AH, 09h
                       INT  21h

                       MOV  AH, 0
                       INT  16h                     ; Wait for user input

                       CMP  AL, '2'                ; If user selects '2', use the hardcoded string
                       JE   use_hc
                       CMP  AL, '1'                ; If user selects '1', take input from the user
                       JNE  start                  ; Invalid choice, restart
                       
                       CALL get_input              ; Get user input
                       JMP  start_process

use_hc:                
                       LEA  DX, message_using_hc   ; Display hardcoded string message
                       MOV  AH, 09h
                       INT  21h

                       LEA  SI, hardcoded_string   ; Use the hardcoded string
                       
start_process:
; Display the original string
                       LEA  DX, message_display_org
                       MOV  AH, 09h
                       INT  21h

                       LEA  DX, SI                 ; Display the string
                       MOV  AH, 09h
                       INT  21h

; Encryption
                       LEA  DX, message_encrypting
                       MOV  AH, 09h
                       INT  21h

                       MOV  AH, 1                  ; Set flag for encryption
                       CALL encrypt_decrypt

; Display encrypted message
                       LEA  DX, message_display_enc
                       MOV  AH, 09h
                       INT  21h

                       LEA  DX, SI
                       MOV  AH, 09h
                       INT  21h

; Decryption
                       LEA  DX, message_decrypting
                       MOV  AH, 09h
                       INT  21h

                       MOV  AH, 0                  ; Set flag for decryption
                       CALL encrypt_decrypt

; Display decrypted message
                       LEA  DX, message_display_dec
                       MOV  AH, 09h
                       INT  21h

                       LEA  DX, SI
                       MOV  AH, 09h
                       INT  21h

; Try again prompt
try_again:             
                       LEA  DX, message_try_again
                       MOV  AH, 09h
                       INT  21h

                       MOV  AH, 0
                       INT  16h

                       CMP  AL, 'y'                ; If 'y', restart
                       JE   start
                       CMP  AL, 'n'                ; If 'n', exit
                       JNE  try_again

; Exit the program
                       LEA  DX, message_press_key
                       MOV  AH, 09h
                       INT  21h

                       MOV  AH, 0
                       INT  16h                    ; Wait for keypress

                       RET   

; Encryption/Decryption subroutine
encrypt_decrypt PROC NEAR
                       PUSH SI
next_char:             
                       MOV  AL, [SI]
                       CMP  AL, '$'                ; End of string
                       JE   end_of_string

                       CMP  AL, ' '                ; Skip spaces
                       JNE  cont
                       CALL omit_space
                       JMP  next_char

cont:                  
                       CALL enc_dec_char           ; Encrypt/Decrypt current character
                       INC  SI
                       JMP  next_char

end_of_string:         
                       POP SI
                       RET
encrypt_decrypt ENDP

; Omit spaces by moving them to the end of the string
omit_space PROC NEAR
                       PUSH SI
omit_space_loop:       
                       MOV  AL, [SI+1]
                       MOV  [SI+1], ' '
                       MOV  [SI], AL
                       INC  SI
                       CMP  [SI-1], '$'
                       JNE  omit_space_loop
                       POP SI
                       RET
omit_space ENDP

; Convert character using appropriate table
enc_dec_char PROC NEAR
                       PUSH BX
                       CMP  AL, 'a'
                       JB   check_upper_char
                       CMP  AL, 'z'
                       JA   skip_char

                       CMP  AH, 1                  ; Encrypt lowercase
                       JE   encrypt_lower_char
                       CMP  AH, 0                  ; Decrypt lowercase
                       JNE  skip_char
                       LEA  BX, decryption_table_lower
                       JMP  translate_char

encrypt_lower_char:    
                       LEA  BX, encryption_table_lower
                       JMP  translate_char

check_upper_char:      
                       CMP  AL, 'A'
                       JB   skip_char
                       CMP  AL, 'Z'
                       JA   skip_char

                       CMP  AH, 1                  ; Encrypt uppercase
                       JE   encrypt_upper_char
                       CMP  AH, 0                  ; Decrypt uppercase
                       JNE  skip_char
                       LEA  BX, decryption_table_upper
                       JMP  translate_char

encrypt_upper_char:    
                       LEA  BX, encryption_table_upper

translate_char:        
                       XLATB                       ; Use table to translate character
                       MOV  [SI], AL
skip_char:             
                       POP  BX
                       RET
enc_dec_char ENDP

; Input string subroutine
get_input PROC NEAR
                       LEA  DX, message_using_input
                       MOV  AH, 09h
                       INT  21h

                       LEA  SI, input_string
                       MOV  AH, 1
                       MOV  CX, 255                ; Max 256 characters
                       
input_loop:            
                       INT  21h
                       MOV  [SI], AL
                       CMP  AL, bcksp
                       JNE  cont_input

                       CMP  SI, offset input_string
                       JE   input_loop             ; If empty, loop
                       MOV  [SI], ' '
                       CALL omit_space
                       DEC  SI
                       JMP  input_loop

cont_input:            
                       INC  SI
                       CMP  AL, cret
                       JE   terminate_string
                       LOOP input_loop

terminate_string:      
                       MOV  [SI-1], cret
                       MOV  [SI], newline
                       MOV  [SI+1], '$'
                       LEA  SI, input_string
                       RET
get_input ENDP

END
