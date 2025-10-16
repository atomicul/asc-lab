.data
mem:
    .space 12
.text
.global _start
_start:
    mov $3,   %eax # sys_read
    mov $0,   %ebx
    mov $mem, %ecx
    mov $12,  %edx
    int $0x80

    mov %eax, %edx
    mov $4,   %eax # sys_write
    mov $1,   %ebx 
    mov $mem, %ecx 
    int $0x80

    mov $1, %eax   # sys_exit
    mov $0, %ebx
    int $0x80
