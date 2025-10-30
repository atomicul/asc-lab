.data
    v: .long 1, 7, 30, 4, 9, 6
    n: .long 6
    fmtstr: .asciz "%d\n"

.text
    .global main

main:
    mov $0, %esi
    mov $v, %eax

lp:
    mov (%eax, %esi, 4), %ebx

    push %eax
    push %ebx
    push $fmtstr
    call printf
    add  $8, %esp
    pop  %eax

    inc %esi
    cmp n, %esi
    jne lp

end:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
