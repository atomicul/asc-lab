.set EOF, -1

.data
scan_int: .asciz "%d"
print_int: .asciz "%d "
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

.sort:
    movl  len, %ecx
.sort_loop:
    movl $array, %eax
    movl $1, %esi

.bubble_loop:
    cmp len, %esi
    jae .bubble_loop_break

    movl (%eax, %esi, 4), %ebx
    cmp  -4(%eax, %esi, 4), %ebx
    jg   .bubble_loop_continue
    
    movl  -4(%eax, %esi, 4), %ebx
    movl  (%eax, %esi, 4), %edi
    movl  %ebx, (%eax, %esi, 4)
    movl  %edi, -4(%eax, %esi, 4)

.bubble_loop_continue:
    inc %esi
    jmp .bubble_loop
.bubble_loop_break:
    loop .sort_loop

.output:
    movl  $array, %eax
    xor   %esi, %esi
    
.output_loop:
    cmp  len, %esi
    jge  .output_loop_break

    pushl %eax
    pushl (%eax, %esi, 4)
    pushl $print_int
    call  printf
    add   $8, %esp
    popl  %eax

    inc %esi
    jmp .output_loop

.output_loop_break:
    pushl stdout
    pushl $'\n'
    call  putc
    add $8, %esp

.exit:
    mov $0, %eax
    ret
