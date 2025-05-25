org 100h  
;----------------------------------------
show_creator_name:
    mov ah, 09h
    lea dx, creator
    int 21h
;---------------------------------------- 
create_newlinee:
    mov ah, 09h
    lea dx, newline
    int 21h
;----------------------------------------    
show_str:
    mov ah, 09h
    lea dx, str
    int 21h
;---------------------------------------- 
create_newlineeee:
    mov ah, 09h
    lea dx, newline
    int 21h
;----------------------------------------
show_strr:
    mov ah, 09h
    lea dx, str
    int 21h
;----------------------------------------
create_newlineee:
    mov ah, 09h
    lea dx, newline
    int 21h
;-------------------------------------------------------------------------Commands---------------------------------------------------------------------------------------------------------------------------
show_password_message:
    mov ah, 09h
    lea dx, message
    int 21h         
;----------------------------------------
password_input:
    mov ah, 0Ah 
    lea dx, password    
    int 21h         
;----------------------------------------
create_newline:
    mov ah, 09h
    lea dx, newline
    int 21h
;----------------------------------------
show_strrr:
    mov ah, 09h
    lea dx, str
    int 21h
;----------------------------------------
show_filename_message:
    mov ah, 09h
    lea dx, filename_message
    int 21h
;----------------------------------------
filename_input:
    mov ah, 0Ah
    lea dx, file_name
    int 21h
;----------------------------------------
terminate_filename_with_null:
    mov bl, file_name + 1
    mov file_name + 2 [bx], 0
;----------------------------------------    
file_open:                
    lea dx, file_name + 2 
    mov ah, 3Dh
    mov al, 2
    int 21h
    jc  done
    mov bx, ax
;----------------------------------------
    mov di, 0
;----------------------------------------
read_from_file:                 
    lea dx, buffer
    mov ah, 3Fh
    mov cx, 1
    int 21h
    cmp ax, 0
    je  file_close
;----------------------------------------
encrypt_decrypt:
    mov al, [buffer]
    xor al, [password + 2 + di]
    mov [buffer], al
;----------------------------------------
move_file_pointer:
    mov cx, 0FFFFh
    mov dx, 0FFFFh
    mov al, 1
    mov ah, 42h
    int 21h
;----------------------------------------
wrtie_in_file:
    lea dx, buffer
    mov cx, 1
    mov ah, 40h
    int 21h
;----------------------------------------
loop_for_password_index:
    inc di
    mov al, [password + 2 + di]
    cmp al, 13 
    jne read_from_file
    mov di, 0
    jmp read_from_file
;----------------------------------------
file_close:
    mov ah, 3Eh
    int 21h
;----------------------------------------
done:
    mov ah, 4Ch
    int 21h
;----------------------------------------
password   db   21, 0, 22 dup('$')
buffer     db   0 
message    db   'Please enter your password:$'
file_name  db   21, 0, 22 dup('$')
filename_message  db ' Please enter file name:$'
;----------------------------------------   
newline db 13, 10, '$'
;---------------------------------------- 
creator db '                Mohammad Amin Nasiri | Encrypt/Decrypt Your Files$'  
str db '-------------------------------------------------------------------------------$'