CC = riscv64-unknown-elf-gcc
CFLAGS = -O2 -Wall
SRC_DIR = /main/main
BUILD_DIR = $(SRC_DIR)/build

SRC_FILES = $(SRC_DIR)/main.c
OBJ_FILES = $(BUILD_DIR)/main.o
TARGET = $(BUILD_DIR)/main.elf

.PHONY: all clean

all: $(BUILD_DIR) $(TARGET)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

$(TARGET): $(OBJ_FILES)
	$(CC) $(CFLAGS) $(OBJ_FILES) -o $@

clean:
	rm -rf $(BUILD_DIR)
