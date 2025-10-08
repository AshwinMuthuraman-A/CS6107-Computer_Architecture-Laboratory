       .data
size:  .word 8
arr:   .word 23,-12,45,-32,52,-72,8,13
msg1:  .asciiz "\n MAXIMUM ELEMENT IS: "
msg2:  .asciiz "\n MINIMUM ELEMENT IS: "

        .text
        .globl main

main:
        la $t0, arr
        li $t1, 0
        lw $t2, size
        lw $s1, 0($t0)
        lw $s2, 0($t0)
        li $t1, 1

        loop:
            beq $t1, $t2, halt
            lw $s0, 0($t0)
            ble $s0, $s1, greater
            move $s1, $s0
            greater:
                bge $s0, $s2, lesser
                move $s2, $s0
            lesser:
                addi $t1, $t1, 1
                addi $t0, $t0, 4
            bne $t1, $t2, loop
        halt: nop

        li $v0, 4
        la $a0, msg1
        syscall

        li $v0, 1
        move $a0, $s1
        syscall
        
        li $v0, 4
        la $a0, msg2
        syscall

        li $v0, 1
        move $a0, $s2
        syscall