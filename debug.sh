if [ ! $# == 1 ]; then
    echo 'Usage: ./debug.sh asm_file'
    exit 1
fi
nasm $1 -o /tmp/debug.bin
dd if=/tmp/debug.bin of=/tmp/debug.img
bochs -f .bochsrc

