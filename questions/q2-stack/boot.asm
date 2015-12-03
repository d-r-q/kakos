; Implement simple program, that pushes ABC chars into processor stack
; and prints them in reverse order
  mov ah, 0x0e
  
  mov bp, 0x8000
  mov sp, bp

  push 'A'
  push 'B'
  push 'C'

  mov al, [0x7ffe]
  int 0x10

  mov al, [0x7ffc]
  int 0x10

  mov al, [0x7ffa]
  int 0x10

  pop bx
  mov al, bl
  int 0x10

  pop bx
  mov al, bl
  int 0x10

  mov al, [0x7ffe]
  int 0x10

;  mov al, [0x7c09]
;  int 0x10

  jmp $

the_secret:
  db "X"

  times 510-($-$$) db 0
  dw 0xaa55
