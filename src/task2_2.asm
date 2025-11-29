%include "asm_io.inc"

segment .data
result_msg db "Sum of array: ",0

segment .bss
array resd 100
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

mov ecx, 0
mov eax, 0

sum_loop:
add eax, [ebx + ecx*4]
inc ecx
cmp ecx, 100
jl sum_loop

mov [sum], eax

mov eax, result_msg
call print_string
mov eax, [sum]
call print_int
call print_nl

popa
mov eax, 0
leave
ret
