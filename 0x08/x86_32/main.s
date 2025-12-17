.equ MAX_SIZE, 1024
.data
vec: .long 5, 7, 7, 53, 175, 7579, 53322
.equ LEN, (. - vec) / 4

.text
.global main
main:
    pushl %ebp
    movl  %esp, %ebp

    pushl $LEN
    pushl $vec
    call  print_array
    call  merge_sort
    call  print_array

exit:
    movl %ebp, %esp
    popl %ebp
    xorl %eax, %eax
    ret
