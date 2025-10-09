        .data
msg1:   .asciiz "\n ENTER PYRAMID SIZE: "
msg2:   .asciiz "\n PYRAMID IS: "
msg3:   .asciiz " "
msg4:   .asciiz "\n"
msg5:   .asciiz "*"

        .text
        .globl main

main:
        li $v0, 4
        la $a0, msg1
        syscall

        li $v0, 5
        syscall
        move $s0, $v0

        li $v0, 4
        la $a0, msg2
        syscall

        li $t0, 0
        li $t1, 0
        li $t2, 0
        li $t3, 2
        li $v0, 4
        loop:
            sub $t1, $s0, $t0
            loop1:
                la $a0, msg3
                syscall
                sub1 $t1, $t1, 1
                bgt $t1, $zero, loop1
            li $t2, 0
            mul $t4, $t0, $t3
            addi $t4, $t4, 1
            loop2:
                la $a0, msg5
                syscall
                addi $t2, $t2, 1
                blt $t2, $t4, loop
            la $a0, msg4
            syscall
            addi $t0, $t0, 1
            bne $t0, $so, loop
        halt: nop