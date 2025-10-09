       .data
msg1:  .asciiz "\n ENTER ARRAY SIZE: "
msg2:  .asciiz "\n ENTER THE ELEMENTS: "
msg3:  .asciiz "\n THE ARRAY BEFORE SORTING: "
msg4:  .asciiz "\n THE ARRAY AFTER SORTING: "
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
        move $t0, $v0

        mul $a0, $t0, 4
        li $v0, 9
        syscall
        move $t1, $v0
        move $t2, $v0

        li $v0, 4
        la $a0, msg2
        syscall

        li $t3, 0
        loop:
            li $v0, 5
            syscall
            sw $v0, 0($t1)
            addi $t3, $t3, 1
            addi $t1, $t1, 4
            bne $t3, $t0, loop
        halt: nop

        move $t1, $t2
        
        li $v0, 4
        la $a0, endl
        syscall

        li $v0, 4
        la $a0, msg3
        syscall

        jal display

        li $v0, 4
        la $a0, endl
        syscall

        move $t1, $t2
        move $a0, $t1
        move $a1, $t0

        li $a2, 0
        li $a3, 0
        jal arr_sort
        move $t4, $v0

        li $v0, 4
        move $a0, msg4
        syscall

        jal display
        move $t1, $t2

        li $v0, 4
        la $a0, endl
        syscall

        li $v0, 10
        syscall

arr_sort:
        addi $sp, $sp, -12
        sw $ra, 0($sp)
        sw $s0, 4($sp)
        sw $s1, 8($sp)
        move $s0, $a2
        move $s1, $a3
        beq $s0, $t0, exit_rec
        addi $t5, $t0, -2
        mul $t6, $s1, 4
        add $t7, $t1, $t6
        lw $t8, 0($t7)
        lw $t9, 4($t7)
        ble $t8, $t9, no_swap
        move $v1, $t8
        sw $t9, 0($t7)
        sw $v1, 4($t7)
        no_swap:
            bne $s1, $t5, check_swap
            addi $s0, $s0, 1
            move $s1, $zero
            j recursion
            check_swap:
                addi $s1, $s1, 1
            recursion:
                move $a0, $s0
                move $a3, $s1
                jal arr_sort
        exit_rec:
            la $ra, 0($sp)
            lw $s0, 4($sp)
            lw $s1, 8($sp)
            addi $sp, $sp, 12
            jr $ra

display:
        li $t3, 0
        loop1:
            li $v0, 1
            lw $a0, 0($t1)
            syscall
            li $v0, 4
            la $a0, space
            syscall
            addi $t3, $t3, 1
            addi $t1, $t1, 4
            bne $t3, $t0, loop1
        jr $ra
