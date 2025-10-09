       .data
msg1:  .asciiz "\n ENTER THE ARRAY SIZE: "
msg2:  .asciiz "\n ENTER THE ELEMENTS: "
msg3:  .asciiz "\n THE ARRAY ELEMENTS ARE: "
msg4:  .asciiz "\n COUNT OF +ve NUMBERS: "
msg5:  .asciiz "\n COUNT OF -ve NUMS: "
space: .asciiz " "
endl:  .asciiz "\n"

        .text
        .globl main

main:
        li $v0, 4
        la $a0, msg1
        syscall

        li $v0, 5
        syscall
        move $s0, $v0

        mul $a0, $s0, 4
        li $v0, 9
        syscall
        move $s1, $v0
        move $s2, $v0

        li $v0, 4
        la $a0, msg2
        syscall

        li $t0, 0
        loop:
            li $v0, 5
            syscall
            sw $v0, 0($s1)
            addi $t0, $t0, 1
            addi $s1, $s1, 4
            bne $t0, $s0, loop
        halt: nop

        move $s1, $s2
        
        li $v0, 4
        la $a0, endl
        syscall

        li $v0, 4
        la $a0, msg3
        syscall

        li $t0, 0
        loop1:
            li $v0, 1
            lw $a0, 0($s1)
            syscall
            li $v0, 4
            la $a0, space
            syscall
            addi $t0, $t0, 1
            addi $s1, $s1, 4
            bne $t0, $s0, loop1
        halt1: nop

        li $v0, 4
        la $a0, endl
        syscall

        move $s1, $s2
        move $a0, $s1
        move $a1, $s0
        jal count_positive
        move $t2, $v0
        sub $t3, $s0, $t2

        li $v0, 4
        la $a0, msg4
        syscall

        li $v0, 1
        move $a0, $t2
        syscall

        li $v0, 4
        move $a0, msg5
        syscall

        li $v0, 1
        move $a0, $t3
        syscall

        li $v0, 10
        syscall

count_positive:
        li $t0, 0
        li $v0, 0
        loop2:
            lw $t3, 0($a0)
            blt $t3, $zero, contd
            addi $v0, $v0, 1
            contd:
                addi $t0, $t0, 1
                addi $a0, $a0, 4
                bne $t0, $a1, lopp2
            halt2:
                jr $ra
