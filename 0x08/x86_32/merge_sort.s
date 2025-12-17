.data
buffer: .space 1024*4

.text
.global merge_sort
.equ SAVED_REGISTERS, 1
.equ array, SAVED_REGISTERS*4 + 4
.equ len, array + 4
merge_sort:
    pushl %ebp
    movl  %esp, %ebp

    cmpl $2, len(%ebp)
    jl   return
    je   swap

    pushl $buffer # needed for merge function call

    movl  len(%ebp), %ecx
    shrl  $1, %ecx
    pushl %ecx

    pushl array(%ebp) 
    call  merge_sort

    movl (%esp), %eax
    movl 4(%esp), %ecx
    lea  (%eax, %ecx, 4), %eax

    movl len(%ebp), %ecx
    incl %ecx
    shrl $1, %ecx

    pushl %ecx
    pushl %eax
    call  merge_sort

    call merge_arrays

    movl len(%ebp), %ecx
    shll $2, %ecx

    pushl %ecx
    pushl $buffer
    pushl array(%ebp)
    call  memcpy

    jmp return
swap:
    movl array(%ebp), %eax 
    movl (%eax), %ecx
    cmpl 4(%eax), %ecx
    jl   return

    movl 4(%eax), %edx
    movl %edx, (%eax)
    movl %ecx, 4(%eax)

return:
    movl %ebp, %esp
    popl %ebp
    ret
