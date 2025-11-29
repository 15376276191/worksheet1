# Worksheet 1 - Operating Systems
## Assembly Programming Tasks

### Task 1: Basic Assembly Programs
**Files:**
- `src/task1.asm` - Basic assembly program
- `src/task1.2.asm` - Extended assembly program

**Description:**
Learning basic assembly language syntax and program structure.

**Screenshot:**
![Task 1 Output](docs/images/task1_output.png.png)

### Task 2: Array Operations
**Files:**
- `src/task2_1.asm` - Array initialization and access
- `src/task2_2.asm` - Array element summation
- `src/task2_3.asm` - Array range summation

**Code Example (task2_3.asm):**
```asm
mov ecx, [start_index]
mov eax, 0
sum_loop:
    add eax, [ebx + ecx*4]
    inc ecx
    cmp ecx, [end_index]
    jle sum_loop
