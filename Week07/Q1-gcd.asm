        .data
msg1:   .asciiz "\n ENTER FIRST NUMBER: "
msg2:   .asciiz "\n ENTER SECOND NUMBER: "
ans:    .asciiz "\n GCD of 2 NUMBERS IS: "

        .text
        .globl main

main:
        li $vo, 4
        move $a0, msg1
        syscall

        li $v0, 5
        syscall
        move $t0, $v0

        li $vo, 4
        move $a0, msg2
        syscall

        li $v0, 5
        syscall
        move $t1, $v0

        move $t2, $t0
        li $t3, 1
        ble $t2, $zero, end
        jal gcd

        li $vo, 4
        move $a0, ans
        syscall

        li $v0, 1
        move $a0, $t0
        syscall

        li $v0, 10
        syscall

gcd:
        div $t2, $t1, $t0
        mfhi $t2
        beq $t2, $zero, endl
        move $t1, $t0
        move $t0, $t2
        bgt $t2, $zero, gcd
    end:
        jr $ra
