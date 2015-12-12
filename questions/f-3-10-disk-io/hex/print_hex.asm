; Print to screen hexedecimal value stored in dx
; Value should be at dx

print_hex:
  pusha

  ; Print '0x'
  mov ah, 0x0e
  mov al, '0'
  int 0x10
  mov al, 'x'
  int 0x10

  ; Print first 4-bits
  mov ah, dh
  shr ah, 4
  mov cl, ah
  call print_hex_char

  ; Print second 4-bits
  mov cl, dh
  and cl, 0xF
  call print_hex_char

  ; Print third 4-bits
  mov ah, dl
  shr ah, 4
  mov cl, ah
  call print_hex_char


  ; Print forth 4-bits
  mov cl, dl
  and cl, 0xF
  call print_hex_char

  popa
  ret

print_hex_char:
  pusha
  
  cmp cl, 0xA
  jge add_letter
  add cl, 0x30
  jmp print_char

add_letter:
  add cl, 0x57

print_char:
  mov al, cl
  mov ah, 0x0e
  int 0x10

  popa
  ret

