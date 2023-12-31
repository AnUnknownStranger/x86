CC = riscv64-unknown-elf-gcc
CFLAGS = -O2 -Wall -MMD

SRC_DIR = ./main/main
BUILD_DIR = $(SRC_DIR)/build

SRC_FILES = $(wildcard $(SRC_DIR)/*.c)
OBJ_FILES = $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(SRC_FILES))
DEPS = $(OBJ_FILES:.o=.d)
TARGET = $(BUILD_DIR)/main.elf

.PHONY: all clean

all: $(BUILD_DIR) $(TARGET)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

-include $(DEPS)

$(TARGET): $(OBJ_FILES)
	$(CC) $(CFLAGS) $(OBJ_FILES) -o $@

clean:
	rm -rf $(BUILD_DIR)
