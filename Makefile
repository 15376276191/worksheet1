CC = gcc
ASM = nasm
CFLAGS = -m32
ASMFLAGS = -f elf -I src/
SRC_DIR = src
BIN_DIR = bin

# Default target: build all programs
all: $(BIN_DIR)/task2_1 $(BIN_DIR)/task2_2 $(BIN_DIR)/task2_3

# Build task2_1
$(BIN_DIR)/task2_1: $(SRC_DIR)/driver.o $(SRC_DIR)/task2_1.o $(SRC_DIR)/asm_io.o
	$(CC) $(CFLAGS) -o $(BIN_DIR)/task2_1 $(SRC_DIR)/driver.o $(SRC_DIR)/task2_1.o $(SRC_DIR)/asm_io.o

$(SRC_DIR)/task2_1.o: $(SRC_DIR)/task2_1.asm
	$(ASM) $(ASMFLAGS) -o $(SRC_DIR)/task2_1.o $(SRC_DIR)/task2_1.asm

# Build task2_2
$(BIN_DIR)/task2_2: $(SRC_DIR)/driver.o $(SRC_DIR)/task2_2.o $(SRC_DIR)/asm_io.o
	$(CC) $(CFLAGS) -o $(BIN_DIR)/task2_2 $(SRC_DIR)/driver.o $(SRC_DIR)/task2_2.o $(SRC_DIR)/asm_io.o

$(SRC_DIR)/task2_2.o: $(SRC_DIR)/task2_2.asm
	$(ASM) $(ASMFLAGS) -o $(SRC_DIR)/task2_2.o $(SRC_DIR)/task2_2.asm

# Build task2_3
$(BIN_DIR)/task2_3: $(SRC_DIR)/driver.o $(SRC_DIR)/task2_3.o $(SRC_DIR)/asm_io.o
	$(CC) $(CFLAGS) -o $(BIN_DIR)/task2_3 $(SRC_DIR)/driver.o $(SRC_DIR)/task2_3.o $(SRC_DIR)/asm_io.o

$(SRC_DIR)/task2_3.o: $(SRC_DIR)/task2_3.asm
	$(ASM) $(ASMFLAGS) -o $(SRC_DIR)/task2_3.o $(SRC_DIR)/task2_3.asm

# Compile driver.c
$(SRC_DIR)/driver.o: $(SRC_DIR)/driver.c
	$(CC) $(CFLAGS) -c $(SRC_DIR)/driver.c -o $(SRC_DIR)/driver.o

# Clean up build files
clean:
	rm -f $(SRC_DIR)/*.o $(BIN_DIR)/task2_1 $(BIN_DIR)/task2_2 $(BIN_DIR)/task2_3
	@echo "All build files cleaned."

# Individual build targets (optional)
task2_1: $(BIN_DIR)/task2_1
	@echo "task2_1 built successfully."

task2_2: $(BIN_DIR)/task2_2
	@echo "task2_2 built successfully."

task2_3: $(BIN_DIR)/task2_3
	@echo "task2_3 built successfully."

.PHONY: all clean task2_1 task2_2 task2_3
