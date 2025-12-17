.data
.text

main:

# int mergearr(int *src1, int len1, int *src2, int len2, int *dest)
# ..................a0........a1.........a2........a3.........a4...
mergearr:
    move t1, x0
    move t2, x0
    move t3, x0

loop:
    bge t1, a1, copy_b
    bge t2, a3, copy_a

    addi t0, a0, t1
    lw   t4, 0(t0)

    addi t0, a2, t2
    lw   t5, 0(t0)

    ble t5, t4, pick_b

pick_a:
    add t0, a0, t1
    lw  t4, 0(t0)
    
    add t0, a4, t3
    sw  t4, 0(t0)

    addi t1, t1, 1
    addi t3, t3, 1
    j    loop
    
pick_b:
    add t0, a2, t2
    lw  t4, 0(t0)
    
    add t0, a4, t3
    sw  t4, 0(t0)

    addi t2, t2, 1
    addi t3, t3, 1
    j    loop

copy_a:
    bge  t1, a1, return

    addi t0, a0, t1
    lw   t4, 0(t0)
    
    addi t0, a4, t3
    sw   t4, 0(t0)

    addi t1, t1, 1
    addi t3, t3, 1
    j    copy_a

copy_b:
    bge  t2, a3, return

    addi t0, a2, t2
    lw   t4, 0(t0)
    
    addi t0, a4, t3
    sw   t4, 0(t0)

    addi t2, t2, 1
    addi t3, t3, 1
    j    copy_b

return:
    move a0, a4
    ret
