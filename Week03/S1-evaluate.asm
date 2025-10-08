        .data
msg1:   .asciiz "\n ENTER x VALUE: "
msg2:   .asciiz "\n ENTER y VALUE: "
msg3:   .asciiz "\n THE RESULT OF (3x-5y) IS: "

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

        mul $t2, $t0, 3
        mul $t3, $t1, 5
        sub $t2, $t2, $t3

        li $v0, 4
        la $a0, msg3
        syscall

        li $v0, 1
        move $a0, $t2
        syscall


        