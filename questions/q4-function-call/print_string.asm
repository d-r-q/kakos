print_string:
  pusha

  mov ah, 0x0e ; scrolling teletype BIOS routine
  mov ch, 0 ; clean cx high byte
loop_start:

  mov cl, [bx] ; put char into cl
  cmp cx, 0 ; check is char nil
  je loop_end ; if so, go to end

  mov al, [bx] ; print char
  int 0x10
  
  add bx, 0x1 ; move to next char
  jmp loop_start ; repeat
loop_end:

  popa
  ret
