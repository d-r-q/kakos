C_SOURCES = $(wildcard kernel/*.c drivers/*.c)
HEADERS = $(wildcard kernel/*.h drivers/*.h)

OBJ = ${C_SOURCES:.c=.o}

all: os-image

run: all
	bochs -f ../bochsrc.txt

os-image: boot/boot_sect.bin kernel.bin
	cat $^ > os-image

kernel.bin: kernel/kernel_entry.o ${OBJ}
	ld -o $@ -Ttext 0x1000 -Tdata 0x2000 $^ --oformat binary

# For simplicity, C files depend on all header files
%.0 : %.c ${HEADERS}
	gcc -ffreestanding -c $< -o $@

# Assemble the kernel_entry
%.o : %.asm
	nasm $< -f elf64 -o $@

%.bin : %.asm
	nasm $< -f bin -o $@

clean:
	rm -rf *.bin *.dis *.o os-image
	rm -rf kernel/*.o boot/*.bin driver/*.o
