        .data
msg1:   .asciiz "\n ENTER x VALUE: "
msg2:   .asciiz "\n ENTER y VALUE: "
msg3:   .asciiz "\n ENTER z VALUE: "
msg4:   .asciiz "\n THE RESULT IS: "

        .text
        .globl main

main:
        li $v0, 4
        la $a0, msg1
        syscall

        li $v0, 5
        syscall
        move $t0, $v0

        li $v0, 4
        la $a0, msg2
        syscall

        li $v0, 5
        syscall
        move $t1, $v0

        li $v0, 4
        la $a0, msg3
        syscall

        li $v0, 5
        syscall
        move $t3, $v0

        mul $s0, $t0, $t1
        div $s0, $s0, $t3

        li $v0, 4
        move $a0, msg4
        syscall

        li $v0, 1
        move $a0, $s0
        syscall
