; Read some sectors from the boot disk
[org 0x7c00]
  mov [BOOT_DRIVE], dl ; BIOS stores our boot drive in DL, so it's best to remember this for later

  mov bp, 0x8000       ; Set stack base to 0x8000
  mov sp, bp           ; Set stack tip

  mov bx, 0x9000       ; Load 5 sectors to 0x0000(ES):0x9000(BX) from boot disk
  mov dh, 5
  mov dl, [BOOT_DRIVE]
  call disk_load

  mov dx, [0x9000]
  call print_hex

  mov dx, [0x9000 + 512]
  call print_hex

  jmp $

%include "print/print_string.asm"
%include "hex/print_hex.asm"
%include "disk_load.asm"

BOOT_DRIVE: db 0

  times 510-($-$$) db 0
  dw 0xaa55

  ; BIOS loads only first 512-bytes from disk, so next bytes we can use to store "data"
  times 256 dw 0xdada
  times 256 dw 0xface
