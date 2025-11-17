.global mycpy
.equ dest, 12
.equ src, dest+4
.equ size, src+4
mycpy:
    pushl %esi
    pushl %edi

    movl $0, %ecx
    movl src(%esp), %esi
    movl dest(%esp), %edi

loop1:
    cmpl size(%esp), %ecx
    jae  return

    movb (%esi, %ecx), %dl
    movb %dl, (%edi, %ecx)

    incl %ecx
    jmp  loop1

return:
    movl %edi, %eax

    popl %edi
    popl %esi
    ret
