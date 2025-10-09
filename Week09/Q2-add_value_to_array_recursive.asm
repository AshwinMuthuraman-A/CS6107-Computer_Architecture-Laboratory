       .data
msg1:  .asciiz "\n ENTER ARRAY SIZE: "
msg2:  .asciiz "\n ENTER THE ELEMENTS: "
msg3:  .asciiz "\n THE ARRAY ELEMENTS ARE: "
msg4:  .asciiz "\n ENTER VALUE TO BE ADDED: "
msg5:  .asciiz "\n ARRAY ELEMENTS AFTER ADDITION: "
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
            addi $t0, $t0, 4
            bne $t0, $s0, loop

        move $s1, $s2

        li $v0, 4
        la $a0, msg3
        syscall

        jal display_arr

        move $s1, $s2

        li $v0, 4
        la $a0, msg4
        syscall

        li $v0, 5
        syscall
        move $s3, $v0

        li $t0, 0
        loop2:
            lw $t1, 0($s1)
            add $t1, $t1, $s3
            sw $t1, 0($s1)
            addi $s1, $s1, 4
            addi $t0, $t0, 1
            bne $t0, $s0, loop2
        
        move $s1, $s2

        li $v0, 4
        la $a0, msg5
        syscall

        jal display_arr
        move $s1, $s2

        li $v0, 10
        syscall

display_arr:
        li $t0, 0
        loop1:
            li $v0, 1
            lw $a0, 0($s1)
            syscall
            li $v0, 4
            move $a0, space
            syscall
            addi $s1, $s1, 4
            addi $t0, $t0, 1
            bne $t0, $s0, loop1
        jr $ra
