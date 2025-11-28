.data
    nums: .float 1.1, 2.2, 3.3
    .equ LEN, (. - nums)/4
    fmtstr: .asciz "%f\n"
.text
.global main
main:
    xorl %ecx, %ecx

loop:
    cmpl $LEN, %ecx
    jae  break

    cvtss2sd nums(, %ecx, 4), %xmm0

    pushl %ecx

    subl  $8, %esp
    movsd %xmm0, (%esp)
    pushl $fmtstr
    call printf
    addl $12, %esp

    popl %ecx

    incl %ecx
    jmp loop

break:
    xorl %eax, %eax
    ret
