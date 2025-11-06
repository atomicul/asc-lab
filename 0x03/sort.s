.set EOF, -1
.set MAX_SIZE, 256

.data
scan_int: .asciz "%d"
print_int: .asciz "%d "
len: .long 0
array: .space MAX_SIZE*4
.text
    .global main
main:
    xorl  %edi, %edi

.read_loop:
    cmpl  $MAX_SIZE, %edi
    jae   .read_loop_break

    lea   array(, %edi, 4), %eax
    pushl %eax
    pushl $scan_int
    call  scanf
    addl  $8, %esp

    cmpl  $EOF, %eax
    je    .read_loop_break

    inc   %edi
    jmp   .read_loop

.read_loop_break:
    movl  %edi, len

.sort:
    movl len, %ecx

.sort_loop:
    movl $1, %esi

.bubble_loop:
    cmpl len, %esi
    jae  .bubble_loop_break

    movl array(, %esi, 4), %ebx
    cmp  array-4(, %esi, 4), %ebx
    jg   .bubble_loop_continue

    xchgl %ebx, array-4(, %esi, 4)
    movl  %ebx, array(, %esi, 4)

.bubble_loop_continue:
    inc %esi
    jmp .bubble_loop

.bubble_loop_break:
    loop .sort_loop

.output:
    xorl %esi, %esi

.output_loop:
    cmp  len, %esi
    jge  .output_loop_break

    pushl array(, %esi, 4)
    pushl $print_int
    call  printf
    add   $8, %esp

    inc %esi
    jmp .output_loop

.output_loop_break:
    pushl stdout
    pushl $'\n'
    call  putc
    add $8, %esp

.exit:
    xorl %eax, %eax
    ret
