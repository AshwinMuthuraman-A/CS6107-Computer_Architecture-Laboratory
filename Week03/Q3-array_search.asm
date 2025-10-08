       .data
msg1:  .asciiz "\n ENTER THE ARRAY SIZE: "
msg2:  .asciiz "\n ENTER THE ELEMENTS: "
msg3:  .asciiz "\n THE ARRAY ELEMENTS ARE: "
msg4:  .asciiz "\n ENTER SEARCH ELEMENT: "
msg5:  .asciiz "\n THE ELEMENT FOUND AT INDEX: "
msg6:  .asciiz "\n ELEMENT NOT FOUND"
space: .asciiz " "

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
            addi $s1, $s1, 4
            addi $t0, $t0, 1
            bne $t0, $s0, loop
        halt: nop

        move $s1, $s2
        
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
            addi $s1, $s1, 4
            addi $t0, $t0, 1
            bne $t0, $s0, loop1
        halt1: nop

        li $v0, 4
        la $a0, msg4
        syscall

        li $v0, 5
        syscall
        move $s3, $v0

        li $s4, 0
        li $t0, 0
        loop2:
            lw $s5, 0($s2)
            beq $s5, $s3, found
            addi $s2, $s2, 4
            addi $t0, $t0, 1
            bne $t0, $s0, loop2
            beq $t0, $s0, halt2
            found:
                li $s4, 1
                li $v0, 4
                move $a0, msg5
                syscall
                li $v0, 1
                move $a0, $t0
                syscall
                j halt3
        halt2: nop

        beq $s4, $zero, notfound
        notfound:
            li $v0, 4
            move $a0, msg6
            syscall
            
        halt3: nop


        
