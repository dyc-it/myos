;nasm section.asm -l section.lst -o section.bin
;hexdump section.bin
;check the section of the following sections
section data1 align=16
	db 0x55

section data2 align=16
	db 0xaa

section data3 align=16
	db 0x99
