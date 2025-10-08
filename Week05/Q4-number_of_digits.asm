        .data
msg1:   .asciiz "\n ENTER A POSITIVE NUMBER: "
msg2:   .asciiz "\n NUMBER OF DIGITS IS: "

        .text
        .globl main

main:
        li $v0, 4
        la $a0, msg1
        syscall

        li $v0, 5
        syscall
        move $s0, $v0

        li $t0, 10
        li $t1, 0

        loop:
            ble $s0, $zero, halt
            div $s0, $s0, $t0
            mflo $s0
            addi $t1, $t1, 1
            bne $s0, $zero, loop
        halt: nop

        li $v0, 4
        la $a0, msg2
        syscall

        li $v0, 1
        move $a0, $t1
        syscall
