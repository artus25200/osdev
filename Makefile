##
# OS_64
#
# @file
# @version 0.1
CC := x86_64-elf/bin/x86_64-elf-gcc

TARGET := bin/os.bin
BOOTLOADER := bin/bootloader.bin
BOOTLOADER_SRC := $(shell find boot -name *.asm)
KERNEL := bin/kernel.bin
KERNEL_SRC := $(shell find kernel -name *.c)

default: $(TARGET) run

.PHONY: run
run: $(TARGET)
	qemu-system-x86_64 -drive format=raw,file=$(TARGET)

$(TARGET): $(BOOTLOADER) $(KERNEL)
	cat $(BOOTLOADER) $(KERNEL) > $(TARGET)

$(BOOTLOADER): $(BOOTLOADER_SRC)
	nasm -fbin $^ -o $@

$(KERNEL): $(KERNEL_SRC)
	$(CC) -ffreestanding -nostdlib $^ -o $@
# end
