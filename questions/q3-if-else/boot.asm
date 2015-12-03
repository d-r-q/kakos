; Implement following if-else statement:
;  if (bx <= 4) print A
;  else if (bx < 4) print B
;  else print C

  mov bx, 40

a_branch:
  cmp bx, 4
  jg b_branch
  mov al, 'A'
  jmp end_if

b_branch:
  cmp bx, 40
  jge c_branch
  mov al, 'B'
  jmp end_if

c_branch:
  mov al, 'C'

end_if:

  int 0x10

;  mov al, [0x7c09]
;  int 0x10

  jmp $

  times 510-($-$$) db 0
  dw 0xaa55
