; show the rax register value in hexadecimal

section .data
codes:
    db      '0123456789ABCDEF'

section .text
global _start
_start:
    mov     rax, 0x1122334455667788 ; number 1122... in hex
    mov     rdi, 1
    mov     rdx, 1
    mov     rcx, 64
    ; each 4 bits must be shown as a hexadecimal digit
    ; use shift and bitwise operator AND to isolate'em
    ; the result is the offset in 'codes'

.loop:
    push    rax
    sub     rcx, 4
    sar     rax, cl ; cl -> minor part of rcx. rcx -- ecx -- cx -- ch + cl
    and     rax, 0xf

    lea     rsi, [codes + rax]
    mov     rax, 1

    push    rcx
    syscall
    pop     rcx

    pop     rax
    test    rcx, rcx ; it is a 0?
    jnz     .loop
    ; exit
    mov     rax, 60 
    xor     rdi, rdi
    syscall