.text
.global merge_arrays
.equ SAVED_REGISTERS, 3
.equ src1, SAVED_REGISTERS*4 + 4
.equ len1, src1+4
.equ src2, len1+4
.equ len2, src2+4
.equ dest, len2+4
merge_arrays:
    pushl %ebp
    pushl %esi
    pushl %edi
    movl  %esp, %ebp

    xorl %esi, %esi # src1Counter
    xorl %edi, %edi # src2Counter
    xorl %edx, %edx # destCounter

loop:
    cmpl len1(%ebp), %esi
    jge  pick2

    cmpl len2(%ebp), %edi
    jge  pick1

    movl src1(%ebp), %eax
    movl (%eax, %esi, 4), %ecx

    movl src2(%ebp), %eax
    cmpl (%eax, %edi, 4), %ecx

    jge pick2

pick1:
    cmpl len1(%ebp), %esi
    jge  return

    movl src1(%ebp), %eax
    movl (%eax, %esi, 4), %ecx

    movl dest(%ebp), %eax
    movl %ecx, (%eax, %edx, 4)
    
    incl %esi
    incl %edx
    jmp  loop

pick2:
    cmpl len2(%ebp), %edi
    jge  return

    movl src2(%ebp), %eax
    movl (%eax, %edi, 4), %ecx

    movl dest(%ebp), %eax
    movl %ecx, (%eax, %edx, 4)
    
    incl %edi
    incl %edx
    jmp  loop

return:
    movl %ebp, %esp
    popl %edi
    popl %esi
    popl %ebp
    ret
