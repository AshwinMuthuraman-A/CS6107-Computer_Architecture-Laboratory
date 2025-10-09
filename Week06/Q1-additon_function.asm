        .data 
msg1:   .asciiz "\n ENTER NUMBER 1: "
msg2:   .asciiz "\n ENTER NUMBER 2: "
msg3:   .asciiz "\n ENTER NUMBER 3: "
msg4:   .asciiz "\n SUM OF 3 NUMBERS IS: "

        .text
        .globl main

main:
        addi $sp, $sp, -12
        
        li $v0. 4
        move $a0, msg1
        syscall

        li $v0, 5
        syscall
        move $a0, $v0
        sw $a0, 0($sp)

        li $v0. 4
        move $a0, msg2
        syscall

        li $v0, 5
        syscall
        move $a1, $v0
        sw $a1, 4($sp)

        li $v0. 4
        move $a2, msg3
        syscall

        li $v0, 5
        syscall
        move $a2, $v0
        sw $a2, 8($sp)

        lw $a0, 0($sp)
        lw $a1, 4($sp)
        lw $s2, 8($sp)
        addi $sp, $sp, 12

        jal sum
        move $t0, $v0
        
        li $v0, 4
        move $a0, msg4
        syscall

        li $v0, 1
        move $a0, $t0
        syscall

        li $v0, 10
        syscall

sum:
        add $v0, $a0, $a1
        add $v0, $v0, $a2
        jr $ra
