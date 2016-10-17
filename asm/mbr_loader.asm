; filename: asm/mbr_loader.asm
; description: this is a loader to load other application


SECTION mbr align=16 vstart=0x7c00
    ; set stack and stack pointer
    mov ax, 0
    mov ss, ax
    mov sp, ax
