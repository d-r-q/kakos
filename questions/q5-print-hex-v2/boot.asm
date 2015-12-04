; Print dx register value on the screen, implementation using hints from book
[org 0x7c00]
  mov dx, 0x1a2b
  call print_hex

  mov dx, 0x0000
  call print_hex

  mov dx, 0x1111
  call print_hex

  mov dx, 0x9999
  call print_hex

  mov dx, 0xaaaa
  call print_hex

  mov dx, 0xffff
  call print_hex

  mov dx, 0x0fff
  call print_hex

  mov dx, 0x1fff
  call print_hex

  mov dx, 0x9fff
  call print_hex

  mov dx, 0xafff
  call print_hex

  mov dx, 0xffff
  call print_hex

  mov dx, 0xf0ff
  call print_hex

  mov dx, 0xf1ff
  call print_hex

  mov dx, 0xf9ff
  call print_hex

  mov dx, 0xfaff
  call print_hex

  mov dx, 0xffff
  call print_hex

  mov dx, 0xff0f
  call print_hex

  mov dx, 0xff1f
  call print_hex

  mov dx, 0xff9f
  call print_hex

  mov dx, 0xffaf
  call print_hex

  mov dx, 0xffff
  call print_hex

  mov dx, 0xfff0
  call print_hex

  mov dx, 0xfff1
  call print_hex

  mov dx, 0xfff9
  call print_hex

  mov dx, 0xfffa
  call print_hex

  jmp $

%include "print_hex.asm"

  times 510-($-$$) db 0
  dw 0xaa55
