# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -O2 -I/usr/src/linux-headers-$(shell uname -r)/include -I/usr/src/linux-headers-$(shell uname -r)/arch/x86/include -I/usr/src/linux-headers-$(shell uname -r)/include/asm-generic -Wno-unused-parameter

# Source directories
KERNEL_MAIN_LOOP_DIR = generic/Kernel_Main_Loop
PROCESS_MGMT_DIR = generic/Process_Mgmt
MEMORY_MGMT_DIR = generic/Memory_Mgmt
FILE_SYSTEMS_DIR = generic/File_Systems
DEVICE_DRIVERS_DIR = generic/Device_Drivers
SYSTEM_CALLS_DIR = generic/System_Calls

# Object files
KERNEL_MAIN_LOOP_OBJ = $(KERNEL_MAIN_LOOP_DIR)/main_loop.o
PROCESS_MGMT_OBJ = $(PROCESS_MGMT_DIR)/process_mgmt.o
MEMORY_MGMT_OBJ = $(MEMORY_MGMT_DIR)/memory_mgmt.o
FILE_SYSTEMS_OBJ = $(FILE_SYSTEMS_DIR)/file_systems.o
DEVICE_DRIVERS_OBJ = $(DEVICE_DRIVERS_DIR)/device_drivers.o
SYSTEM_CALLS_OBJ = $(SYSTEM_CALLS_DIR)/system_calls.o

# Main target
all: core_kernel

# Core kernel target
core_kernel: $(KERNEL_MAIN_LOOP_OBJ) $(PROCESS_MGMT_OBJ) $(MEMORY_MGMT_OBJ) $(FILE_SYSTEMS_OBJ) $(DEVICE_DRIVERS_OBJ) $(SYSTEM_CALLS_OBJ)
	$(CC) $(CFLAGS) -o $@ $^

# Rules for building each component
$(KERNEL_MAIN_LOOP_OBJ): $(KERNEL_MAIN_LOOP_DIR)/main_loop.c
	$(CC) $(CFLAGS) -c -o $@ $<

$(PROCESS_MGMT_OBJ): $(PROCESS_MGMT_DIR)/process_mgmt.c
	$(CC) $(CFLAGS) -c -o $@ $<

$(MEMORY_MGMT_OBJ): $(MEMORY_MGMT_DIR)/memory_mgmt.c
	$(CC) $(CFLAGS) -c -o $@ $<

$(FILE_SYSTEMS_OBJ): $(FILE_SYSTEMS_DIR)/file_systems.c
	$(CC) $(CFLAGS) -c -o $@ $<

$(DEVICE_DRIVERS_OBJ): $(DEVICE_DRIVERS_DIR)/device_drivers.c
	$(CC) $(CFLAGS) -c -o $@ $<

$(SYSTEM_CALLS_OBJ): $(SYSTEM_CALLS_DIR)/system_calls.c
	$(CC) $(CFLAGS) -c -o $@ $<

# Clean target
clean:
	rm -f core_kernel $(KERNEL_MAIN_LOOP_OBJ) $(PROCESS_MGMT_OBJ) $(MEMORY_MGMT_OBJ) $(FILE_SYSTEMS_OBJ) $(DEVICE_DRIVERS_OBJ) $(SYSTEM_CALLS_OBJ)

.PHONY: all clean
