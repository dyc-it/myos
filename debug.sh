nasm asm/mbr.asm -o /tmp/mbr.bin
dd if=/tmp/mbr.bin of=/tmp/mbr.img
bochs -f asm/mbr.bochsrc
