         .data
string: .asciiz "\n Hi, this is Computer Architecture Lab"
space: .asciiz " "
msg1:   .asciiz "\n THE ORIGINAL MESSAGE IS: "
msg2:   .asciiz "\n THE NEW MESSAGE IS: "
endl:   .asciiz "\n"

        .text
        .globl main

main:
        li $v0, 4
        move $a0, $msg1
        syscall
        la $a0, string
        syscall
        la $a0, endl
        syscall

        la $a0, string
        jal remove_space
        move $a1, $v0

        li $v0, 4
        move $a0, msg2
        syscall
        move $a0, string
        syscall
        move $a0, endl
        syscall

        li $v0, 10
        syscall
    
remove_space:
        li $v0, 0
        la $a0, string
        li $t7, 0
        la $t6, string
        check_letter:
            lb $a1, ($a0)
            beq $a1, $zero, exit
            la $t1, space
            check_space:
                lb $t2, ($t1)
                beq $t2, $zero, end_space_loop
                beq $t2, $a1, count
                addi $t1, $t1, 1
                j check_space
            count:
                addi $v0, $v0, 1
                addi $a0, $a0, 1
                j check_letter
            end_space_loop:
                add $t6, $t6, $t7
                sb $a1, $t6
                addi $a0, $a0, 1
                la $t6, string
                addi $t7, $t7, 1
                j check_letter
        exit:
            add $t6, $t6, $t7
            sb $zero, ($t6)
            la $t6, string
            jr $ra
