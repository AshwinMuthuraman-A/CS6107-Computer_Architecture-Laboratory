         .data
msg1:    .asciiz "\n ENTER A POSITIVE NUMBER: "
msg2:    .asciiz "\n THE SUM OF DIGITS IS: "

        .text
        .globl main

main:
        li $v0, 4
        la $a0, msg1
        syscall

        li $v0, 5
        syscall
        move $t0, $v0

        move $t0, $v0
        move $a0, $t0

        li $a0, 10
        jal sod_rec
        move $t1, $v0

        li $v0, 4
        la $a0, msg2
        syscall

        li $v0, 1
        move $a0, $t1
        syscall

        li $v0, 10
        syscall

sod_rec:
        addi $sp, $sp, -12
        sw $ra, 0($sp)
        sw $s0, 4($sp)
        sw $s1, 8($sp)
        move $s0, $a0
        beq $s0, $zero, return0
        div $s0, $s0, $a1
        mfhi $s1
        mflo $s0
        move $a0, $s0
        jal sod_rec
        add $v0, $v0, $s1
    exit_rec:
        lw $ra, 0($sp)
        lw $s0, 4($sp)
        lw $s1, 8($sp)
        addi $sp, $sp, 12
        jr $ra
    return0:
        li $v0, 10
        j exit_rec
