; lib.asm
global capture
global splice

section .data
    return_address dq 0

section .text

capture:
    ; сохраняем адресс возврата
    mov rax,[rsp]
    mov [return_address], rax
    ;выпрыгиваем из f
    jmp [rsp + 16]
  .return1:
    ; вот здесь оказываемся после splice
    ; делаем чтобы после f вернулись в splice, и из splice корректно вышли
    mov rdi, [rsp]
    mov [rsp+16],rdi
    mov  rax, [return_address]
    mov [rsp],rax
    ret



splice:
    jmp capture.return1


