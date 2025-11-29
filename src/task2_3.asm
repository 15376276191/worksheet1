%include "asm_io.inc"

segment .data
prompt_start db "Enter start index (0-99): ",0
prompt_end db "Enter end index (0-99): ",0
result_msg db "Sum of range: ",0
error_msg db "Error: Invalid range",0

segment .bss
array resd 100
start resd 1
end resd 1
sum resd 1

segment .text
global asm_main

asm_main:
    enter 0,0
    pusha

    mov ecx, 0
    mov ebx, array

init_loop:
    mov [ebx + ecx*4], ecx
    inc ecx
    cmp ecx, 100
    jl init_loop

    mov eax, prompt_start
    call print_string
    call read_int
    mov [start], eax

    mov eax, prompt_end
    call print_string
    call read_int
    mov [end], eax

    mov eax, [start]
    cmp eax, 0
    jl error
    cmp eax, 99
    jg error

    mov eax, [end]
    cmp eax, 0
    jl error
    cmp eax, 99
    jg error

    mov eax, [start]
    cmp eax, [end]
    jg error

    mov ecx, [start]
    mov eax, 0
    mov ebx, array

sum_loop:
    add eax, [ebx + ecx*4]
    inc ecx
    cmp ecx, [end]
    jle sum_loop

    mov [sum], eax

    mov eax, result_msg
    call print_string
    mov eax, [sum]
    call print_int
    call print_nl
    jmp program_exit

error:
    mov eax, error_msg
    call print_string
    call print_nl

program_exit:
    popa
    mov eax, 0
    leave
    ret
