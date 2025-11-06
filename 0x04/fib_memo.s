.data
    scan_int: .asciz "%d"
    fmt_str: .asciz "%u\n"
.bss
    memo: .space 4*1000
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

    movl 8(%ebp), %edx

    cmpl $0, %edx
    je   .zero

    cmpl $2, %edx
    jbe  .lt_2

    cmpl $0, memo(, %edx, 4)
    je   .recurse

    movl memo(, %edx, 4), %eax
    jmp  .return
    
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
    movl  8(%ebp), %edx
    movl  %eax, memo(, %edx, 4)
    movl  %ebp, %esp
    popl  %ebp
    ret
