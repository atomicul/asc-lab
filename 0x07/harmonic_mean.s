.data
    one: .float 1
    sum: .double 0
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
    call  inverse
    addl  $8, %esp
    
    movsd sum, %xmm1
    addsd %xmm1, %xmm0
    movsd %xmm0, sum

    popl %ecx

    incl %ecx
    jmp loop

break:
    movsd    sum, %xmm0
    movl     $LEN, sum
    cvtsi2sd sum, %xmm1
    divsd    %xmm0, %xmm1

    subl  $8, %esp
    movsd %xmm1, (%esp)
    pushl $fmtstr
    call  printf
    addl  $12, %esp

    xorl %eax, %eax
    ret


inverse:
    cvtss2sd one, %xmm0
    movsd    4(%esp), %xmm1

    divsd %xmm1, %xmm0
    ret
