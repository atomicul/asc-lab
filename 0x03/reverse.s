.data
str: .space 64
tmp: .space 1
    .global main
.text
main:
    pushl stdin
    pushl $64
    pushl $str
    call  fgets
    add   $12, %esp

.loop1:
    cmp $0, (%eax)
    je  .break
    inc %eax
    jmp .loop1
.break:
    dec  %eax

.reverse_str:
    movl %eax, %edi
    movl $str, %esi

.loop2:
    movb (%esi), %al  
    movb (%edi), %ah
    movb %ah, (%esi)
    movb %al, (%edi)

    inc %esi
    dec %edi
    cmp %edi, %esi
    jb  .loop2

.print_str:
    pushl $str
    call  puts
    add   $4, %esp

.exit:
    movl $0, %eax
    ret
