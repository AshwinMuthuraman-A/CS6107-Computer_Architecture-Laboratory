         .data
msg1:    .asciiz "\n ENTER n VALUE: "
msg2:    .asciiz "\n SUM OF NATURAL NUMBER TILL n IS: "

        .text
        .globl main

main:
        li $v0, 4
        la $a0, msg1
        syscall

        li $v0, 5
        syscall
        move $s0, $v0

        li $t0, 0
        li $s1, 0
        loop:
            bge $t0, $s0, halt
            addi $t0, $t0, 1
            add $s1, $s1, $t0
            bne $t0, $s0, loop
        halt: nop

        li $v0, 4
        la $a0, msg2
        syscall

        li $v0, 1
        move $a0, $s1
        syscall