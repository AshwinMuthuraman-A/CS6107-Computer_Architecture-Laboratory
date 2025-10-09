        .data
str1:   .asciiz "\n ENTER BASE NUMBER: "
str2:   .asciiz "\n ENTER EXP NUMBER: "
ans:    .asciiz "\n THE RESULT IS: "
ensl:   .asciiz "\n"

        .text
        .globl main

main:
        li $v0, 4
        move $a0, str1
        syscall

        li $v0, 5
        syscall
        move $t0, $v0

        li $vo, 4
        move $a0, str2
        syscall

        li $v0, 5
        syscall
        move $t1, $v0

        move $a0, $t0
        move $a1, $t1
        jal power_function
        move $t2, $v0

        li $v0, 4
        move $a0, ans
        syscall

        li $v0, 1
        move $a0, $t2
        syscall

        li $v0, 10
        syscall

power_function:
        li $v0, 1
        bne $a1, $zero, endif
        jr $ra
    end_if:
        li $t0, 0
        loop:
            bge $t0, $a1, end_loop
            mul $v0, $v0, $a0
            addi $t0, $t0, 1
            j loop
        end_loop:
            jr $ra
