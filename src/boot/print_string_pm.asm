; Print string in protected mode
[bits 32]
VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f

print_string_pm:
  pusha
  mov edx, VIDEO_MEMORY

  mov al, 'A'
  mov ah, WHITE_ON_BLACK ; put char attributes
  mov [edx], ax ; copy char into video memory

print_string_pm_loop:
  mov al, [ebx]          ; put char to print
  mov ah, WHITE_ON_BLACK ; put char attributes

  cmp al, 0 ; if (al == 0)
  je print_string_pm_done   ;   jump to done

  mov [edx], ax ; copy char into video memory

  add ebx, 1 ; move to next char in string
  add edx, 2 ; move to next char in video memory

  jmp print_string_pm_loop

print_string_pm_done:
  popa
  ret
