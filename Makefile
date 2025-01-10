##
# OS_64
#
# @file
# @version 0.1

TARGET := bin/os.bin
BOOTLOADER := bin/bootloader.bin
BOOTLOADER_SRC := $(shell find boot -name *.asm)
KERNEL := bin/kernel.bin

default: $(TARGET) run

.PHONY: run
run: $(TARGET)
	qemu-system-x86_64 -drive format=raw,file=$(TARGET)

$(TARGET): $(BOOTLOADER)
	cp $(BOOTLOADER) $(TARGET)

$(BOOTLOADER): $(BOOTLOADER_SRC)
	nasm -fbin $^ -o $(BOOTLOADER)

# end
