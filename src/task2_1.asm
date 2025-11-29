%include "asm_io.inc"

segment .data
prompt_times db "Enter number of times to print (50-100): ",0
welcome_msg db "Welcome, User",0
error_msg db "Error: Number must be between 50 and 100",0

segment .bss
count resd 1

segment .text
global asm_main

asm_main:
enter 0,0
pusha

mov eax, prompt_times
call print_string
call read_int
mov [count], eax

cmp eax, 50
jl error
cmp eax, 100
jg error

mov ecx, [count]

print_loop:
mov eax, welcome_msg
call print_string
call print_nl

loop print_loop
jmp end

error:
mov eax, error_msg
call print_string
call print_nl

end:
popa
mov eax, 0
leave
ret
