; lib.asm
global capture
global splice

section .data
    return_address dq 0

section .text

capture:
    mov rax, [rsp]
    mov [return_address] ,rax
    ret

splice:
    add rsp, 8
    jmp [return_address]


