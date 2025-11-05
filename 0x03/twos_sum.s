.set EOF, -1

.data
scan_int: .asciz "%d"
print_int: .asciz "%d "
print_int_newline: .asciz "%d\n"
sum: .long 0
len: .long 0
array: .space 1024
array_end:
.text
    .global main
main:
    movl $array, %edi

.read_loop:
    cmp   $array_end, %edi
    jae   .read_loop_break

    pushl %edi
    pushl $scan_int
    call  scanf
    add   $8, %esp

    cmp   $EOF, %eax
    je    .read_loop_break

    add   $4, %edi
    jmp   .read_loop

.read_loop_break:
    movl  %edi, %eax
    sub   $array, %eax
    xor   %edx, %edx
    movl  $4, %ebx
    div   %ebx
    movl  %eax, len

.sum:
    mov   $1, %esi
    mov   $0, %ecx

.loop:
    cmp len, %ecx
    jge .output

    movl array(, %ecx, 4), %ebx
    movl %esi, %eax
    mull %ebx

    test $1, %ecx
    jz   .even

.odd:
    subl %eax, sum
    jmp  .continue

.even:
    addl %eax, sum

.continue:
    incl %ecx
    shll %esi
    jmp  .loop

.output:
    pushl sum
    pushl $print_int_newline
    call  printf
    add   $8, %esp

.exit:
    mov $0, %eax
    ret
