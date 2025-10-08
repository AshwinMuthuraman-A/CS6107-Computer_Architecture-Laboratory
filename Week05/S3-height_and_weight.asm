       .data

pairs: .word 5
       .word 60, 90
       .word 65, 105
       .word 72, 255
       .word 68, 270
       .word 60, 115

msg1:  .asciiz "\n AVERAGE HEIGHT IS: "
msg2:  .asciiz "\n AVERAGE WEIGHT IS: "

        .text
        .globl main

main:
        la $t0, pairs
        li $t1, 0($t0)
        lw $t2, 0
        addi $t0, $t0, 4
        li $s0, 0
        li $s1, 0

        loop:
            beq $t2, $t1, halt
            lw $t3, 0($t0)
            add $s0, $s0, $t3
            addi $t0, $t0, 4
            lw $t3, 0($t0)
            add $s1, $s1, $t3
            addi $t0, $t0, 4
            addi $t2, $t2, 1
            bne $t2, $t1, loop
        halt: nop

        div $s0, $s0, $t1
        div $s1, $s1, $t1

        li $v0, 4
        move $a0, msg1
        syscall

        li $v0, 1
        move $a0, $s0
        syscall

        li $v0, 4
        move $a0, msg2
        syscall

        li $v0, 1
        move $a0, $s1
        syscall

        li $v0, 10
