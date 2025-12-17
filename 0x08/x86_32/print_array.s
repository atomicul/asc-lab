.data
fmtstr: .asciz "%d "
.text
.global print_array
.equ arr, 4
.equ len, 8
print_array:
    movl arr(%esp), %eax
    xorl %ecx, %ecx
    
loop:
    cmpl len(%esp), %ecx
    jge  break

    pushl %ecx

    pushl (%eax, %ecx, 4)
    pushl $fmtstr
    call  printf
    addl  $8, %esp

    popl %ecx
    movl arr(%esp), %eax

    incl %ecx
    jmp  loop

break:
    pushl stdout
    pushl $'\n'
    call  putc
    addl  $8, %esp

    pushl stdin
    call  fflush
    addl  $4, %esp
    
return:
    ret
