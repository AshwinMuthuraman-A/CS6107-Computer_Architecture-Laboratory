        .data
msg1:   .asciiz "\n ENTER THE NUMBER OF FIBONACCI TERMS: "
msg2:   .asciiz "\n THE FIBONACCI SERIES IS: "
space:  .asciiz " "

        .text
        .globl main

main:
        li $v0, 4
        la $a0, msg1
        syscall

        li $v0, 5
        syscall
        move $t0, $v0

        li $t1, 2
        li $t2, 0
        li $t3, 1

        li $v0, 4
        la $a0, msg2
        syscall

        li $v0, 1
        move $a0, $t2
        syscall

        li $v0, 4
        move $a0, space
        syscall

        li $v0, 1
        move $a0, $t3
        syscall

        li $v0, 4
        move $a0, space
        syscall

        loop:
            add $t4, $t2, $t3
            li $v0, 1
            move $a0, $t4
            syscall
            li $v0, 4
            move $a0, space
            syscall
            move $t2, $t3
            move $t3, $t4
            addi $t1, $t1, 1
            bne $t1, $t0, loop
            
        halt:
            nop
