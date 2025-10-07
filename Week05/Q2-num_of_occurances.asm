       .data
msg1:  .asciiz "\n ENTER THE ARRAY SIZE: "
msg2:  .asciiz "\n ENTER THE ELEMENTS: "
msg3:  .asciiz "\n ENTER ELEMENTS TO COUNT: "
msg4:  .asciiz "\n THE NUMBER OF OCCURANCES IS: "

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
        la $a0, msg3
        syscall

        li $v0, 5
        syscall
        move $t4, $v0

        li $t2, 0
        li $t0, 0
        loop1:
            lw $t3, 0($s1)
            bne $t4, $t3, nomatch
            addi $t2, $t2, 1
            nomatch:
                addi $s1, $s1, 4
                addi $t0, $t0, 1
                bne $t0, $s0, loop1
        halt1: nop

        li $v0, 4
        move $a0, msg4
        syscall

        li $v0, 1
        move $a0, $t2
        syscall

        li $v0, 10