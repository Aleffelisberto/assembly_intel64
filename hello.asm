global _start

section .data
message: db 'hello :)', 10

section .text
_start:
    mov rax, 1          ; syscall number to be stored in rax
    mov rdi, 1          ; argument number to write on (descriptor)
    mov rsi, message    ; where string starts
    mov rdx, 9          ; quantity of bytes that will be written
    syscall             ; make a syscall

    mov rax, 60         ; syscal 'exit' (avoid seg fault :p)
    xor rdi, rdi
    syscall
