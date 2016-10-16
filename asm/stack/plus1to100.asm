; filename: plus1to100.asm
; description: calculate 1 plus to 100 using stack

; jump to the code section to execute
jmp near start

message db '1+2+3+...+100='

start:
    mov ax, 0x7c0	; set data segment base address
    mov ds, ax

    mov ax, 0xb800	; set video ram base address
    mov es, ax

    ; show string in screen
    mov si, message
    mov di, 0
    mov cx, start-message

    show:
        mov al, [si]
        mov [es:di], al
        inc di
        mov byte [es:di], 0x07
        inc di
        inc si
        loop show


    ; calculate sum(1..100)
    xor ax, ax
    mov cx, 1
    sum:
        add ax, cx
        inc cx
        cmp cx, 100
        jle sum

    ; convert sum in ax register to decimal 
    xor cx, cx
    mov ss, cx
    mov sp, cx
    mov bx, 10
    xor cx, cx
    toDecimal:
        inc cx
        xor dx, dx
        div bx
        or dl, 0x30
        ; push the remainder to stack
        push dx
        ; if quotient is not equal to zero, continue
        cmp ax, 0
        jne toDecimal


    ; show the result
    showResult:
        pop dx
        mov [es:di], dl
        inc di
        mov byte [es:di], 0x07
        inc di
        loop showResult

    ; $ represents the current instruction address, 'jmp near $' equals to 'infi: jmp near infi', it is a infinite loop
    jmp near $

times 510-($-$$) db 0
db 0x55, 0xaa


