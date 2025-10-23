.data
    v: .long 1, 7, 3, 4, 9, 6
    n: .long 6
    tmp: .long 0
    chr: .ascii " \n"

.text
    .global _start

_start:
    mov $0, %esi
    mov $v, %eax

lp:
    mov (%eax, %esi, 4), %ebx

    cmp $9, %ebx
    ja  fail

    add $'0', %ebx
    movb %bl, chr

    mov %eax, tmp
    mov $4, %eax # sys_write
    mov $1, %ebx
    mov $chr, %ecx
    mov $2, %edx
    int $0x80
    mov tmp, %eax

    inc %esi
    cmp n, %esi
    jne lp

end:
    mov $1, %eax
    mov $0, %ebx
    int $0x80

fail:
    mov $1, %eax
    mov $1, %ebx
    int $0x80
