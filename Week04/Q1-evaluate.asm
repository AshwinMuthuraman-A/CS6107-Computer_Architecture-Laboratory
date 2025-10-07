         .data
msg1:    .asciiz "\n ENTER A: "
msg2:    .asciiz "\n ENTER B: "
msg3:    .asciiz "\n THE VALUE OF (A+2B-5) IS: "
newline: .asciiz "\n"

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

        li $t3, 2
        mul $t1, $t1, $t3
        add $t0, $t0, $t1
        sub $t0, $t0, 5

        li $v0, 4
        la $a0, msg3
        syscall

        li $v0, 1
        move $a0, $t0
        syscall
        
        li $v0, 4
        la $a0, newline
        syscall

        li $v0, 10