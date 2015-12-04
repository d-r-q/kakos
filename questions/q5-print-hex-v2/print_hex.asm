; Print to screen hexedecimal value stored in dx
; Value should be at dx

print_hex:
  pusha

  mov al, dl
  and al, 0xF
  mov cl, al
  call to_ascii
  shl cx, 8
  mov al, dl
  shr al, 4
  mov cl, al
  call to_ascii

  push cx
  pop word [HEX_OUT + 4]

  mov al, dh
  and al, 0xF
  mov cl, al
  call to_ascii
  shl cx, 8
  mov al, dh
  shr al, 4
  mov cl, al
  call to_ascii

  push cx
  pop word [HEX_OUT + 2]

  mov bx, HEX_OUT
  call print_string

  popa
  ret

to_ascii:
  cmp cl, 0xA
  jge add_letter
  add cl, 0x30
  jmp exit

add_letter:
  add cl, 0x57

exit:
  ret

%include "print_string.asm"
HEX_OUT: db '0x0000 ', 0
