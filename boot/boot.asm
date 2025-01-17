[org 0x7c00]

[bits 16]

start:
    mov ah, 0
    mov al, 0x03
    int 0x10
    mov bx, hello
    call print_string
    jmp $



%include "boot/print_string.asm"

hello:  db "Welcome", 10, 13, 0

times 510-($-$$) db 0
dw 0xAA55
