.data
    scan_int: .asciz "%d"
    fmtstr: .asciz "%d\n"
.text
.global main
main:
    subl  $4, %esp
    pushl %esp
    pushl $scan_int
    call  scanf
    addl  $8, %esp

    call fact
    addl $4, %esp

    pushl %eax
    pushl $fmtstr
    call  printf
    addl  $8, %esp

    xor %eax, %eax
    ret

# long fact(long x);
fact:
    pushl %ebp
    movl  %esp, %ebp

    cmpl  $0, 8(%ebp)
    jne  .recurse

    movl $1, %eax
    jmp .return

.recurse:
    pushl 8(%ebp)
    decl  (%esp)
    call  fact

    mull 8(%ebp)

.return:
    movl %ebp, %esp
    popl %ebp
    ret
