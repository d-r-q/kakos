; Put together all of the ideas in this section to make a self-contained function 
; for printing null-terminated strings, that can be used in following code
[org 0x7c00]

  mov bx, HELLO_MSG
  call print_string

  mov bx, GOODBYE_MSG
  call print_string

  jmp $

%include "print_string.asm"

HELLO_MSG:
  db 'Hello, World!', 0

GOODBYE_MSG:
  db 'Goodbye!', 0

  times 510-($-$$) db 0
  dw 0xaa55
