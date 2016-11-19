; Ensures that we jump straight into the kernel's entry function
[bits 32]

[extern main] ; Declare that we will be referencing the external symbol 'main'.
              ; so the linker can substitute the final address

mov ebx, IN_KERNEL_ENTRY
call print_string_pm ; Use our 32-bit print routine

call main     ; invoke main() in our C kernel
jmp $         ; Hang forever when we return from the kernel

%include "boot/print_string_pm.asm"

IN_KERNEL_ENTRY   db "In kernel entry", 0
