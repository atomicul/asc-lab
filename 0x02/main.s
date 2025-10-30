.data
num: .long 0b11110011001011111000000011100000
cnt: .long 0
max: .long 0
.text
.global _start
_start:
    mov num, %eax

lp:
    mov $1, %ebx
    and %eax, %ebx
  
    cmp $0, %ebx
    je reset

    mov cnt, %ebx
    inc %ebx
    mov %ebx, cnt

    cmp max, %ebx
    jb continue

    mov %ebx, max
    jmp continue

reset:
    movl $0, cnt
    
continue:
    shr $1, %eax
    cmp $0, %eax
    jne lp

end:
    mov $1, %eax   # sys_exit
    mov $0, %ebx
    int $0x80
