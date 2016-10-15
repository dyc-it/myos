; filename: showStringInScreen.asm
; description: show string in screen

; principle: if we put char in address 0xb8000-0xbffff, the char will be automatically displayed in the screen.
; we should put the segment address in es register

mov ax, 0xb800	; the physical address of video memory in text mode is 0xb800
mov es, ax	; the es register cannot be signed directly, so we use ax as bridge

; the following is the string we want to show in screen, eg:"myos"
; each char made up of two parts: char and mode(color and behavior)
mov byte [es:0x00], 'm'
mov byte [es:0x01], 0x07	; 0x07 represents white char and black background
mov byte [es:0x02], 'y'
mov byte [es:0x03], 0x07
mov byte [es:0x04], 'o'
mov byte [es:0x05], 0x07
mov byte [es:0x06], 's'
mov byte [es:0x07], 0x07


times 510-($-$$) db 0
dw 0xaa55
