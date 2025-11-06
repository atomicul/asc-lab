.data
    scan_int: .asciz "%d"
    fmt_str: .asciz "%d\n"
.global main
.text
main:
    pushl %ebp
    movl  %esp, %ebp

    subl  $4, %esp
    pushl %esp
    pushl $scan_int
    call  scanf
    addl  $8, %esp

    call fib

    pushl %eax
    pushl $fmt_str
    call  printf

    xor  %eax, %eax
    movl %ebp, %esp
    popl %ebp
    ret

# long fib(long n)
fib:
    pushl %ebp
    movl  %esp, %ebp

    subl $4, %esp

    cmpl $0, 8(%ebp)
    je   .zero

    cmpl $2, 8(%ebp)
    jbe  .lt_2

    jmp .recurse

.zero:
    xor %eax, %eax
    jmp .return

.lt_2:
    mov $1, %eax
    jmp .return

.recurse:
    pushl 8(%ebp)
    decl  (%esp)
    call  fib
    movl  %eax, -4(%ebp)

    decl (%esp)
    call fib
    addl -4(%ebp), %eax

.return:
    movl  %ebp, %esp
    popl  %ebp
    ret
