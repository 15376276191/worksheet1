all: task2_1 task2_2 task2_3

task2_1: src/task2_1.o src/driver.o src/asm_io.o
	gcc -m32 -o src/task2_1 src/driver.o src/task2_1.o src/asm_io.o

task2_2: src/task2_2.o src/driver.o src/asm_io.o
	gcc -m32 -o src/task2_2 src/driver.o src/task2_2.o src/asm_io.o

task2_3: src/task2_3.o src/driver.o src/asm_io.o
	gcc -m32 -o src/task2_3 src/driver.o src/task2_3.o src/asm_io.o

src/task2_1.o: src/task2_1.asm
	nasm -f elf -I src/ -o src/task2_1.o src/task2_1.asm

src/task2_2.o: src/task2_2.asm
	nasm -f elf -I src/ -o src/task2_2.o src/task2_2.asm

src/task2_3.o: src/task2_3.asm
	nasm -f elf -I src/ -o src/task2_3.o src/task2_3.asm

src/driver.o: src/driver.c
	gcc -m32 -c -o src/driver.o src/driver.c

src/asm_io.o: src/asm_io.asm
	nasm -f elf -o src/asm_io.o src/asm_io.asm

clean:
	rm -f src/*.o src/task2_1 src/task2_2 src/task2_3

.PHONY: all clean
