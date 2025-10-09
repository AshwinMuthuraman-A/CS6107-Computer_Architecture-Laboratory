         .data
string1: .asciiz "\n Hi, this is Computer Architecture Lab"
string2: .asciiz "\n Hi, this is Ashwin Muthuraman"
vowels: .asciiz "AEIOUaeiou"
msg1:   .asciiz "\n THE ORIGINAL MESSAGE IS: "
msg2:   .asciiz "\n COUNT OF VOWELS IS: "  
msg3:   .asciiz "\n THE NEW MESSAGE IS: "
endl:   .asciiz "\n"

        .text
        .globl main

main:
        li $v0, 4
        move $a0, $msg1
        syscall
        la $a0, string1
        syscall
        la $a0, endl
        syscall

        la $a0, string1
        jal count_vowels
        move $a1, $v0

        li $v0, 4
        move $a0, msg2
        syscall

        li $v0, 1
        move $a0, $a1
        syscall

        li $v0, 4
        move $a0, endl
        syscall

        li $v0, 4
        move $a0, msg3
        syscall
        la $a0, string1
        syscall
        la $a0, endl
        syscall

        li $v0, 4
        move $a0, $msg1
        syscall
        la $a0, string2
        syscall
        la $a0, endl
        syscall

        la $a0, string2
        jal count_vowels
        move $a1, $v0

        li $v0, 4
        move $a0, msg2
        syscall

        li $v0, 1
        move $a0, $a1
        syscall

        li $v0, 4
        move $a0, endl
        syscall

        li $v0, 4
        move $a0, msg3
        syscall
        la $a0, string2
        syscall
        la $a0, endl
        syscall

        li $v0, 10
        syscall
    
count_vowels:
        li $v0, 0
        li $t7, 0
        move $t6, $a0
        move $t5, $a0
        check_letter:
            lb $a1, ($a0)
            beq $a1, $zero, exit
            la $t1, vowels
        check_vowel:
            lb $t2, ($t1)
            beq $t2, $zero, end_vowel_loop
            beq $t2, $a1, count
            addi $t1, $t1, 1
            j check_vowel
        count:
            addi $v0, $v0, 1
            addi $a0, $a0, 1
            j check_letter
        end_vowel_loop:
            add $t6, $t6, $t7
            sb $a1, ($t6)
            addi $a0, $a0, 1
            move $t6, $t5
            addi $t7, $t7, 1
            j check_letter
        exit:
            add $t6, $t6, $t7
            sb $zero, ($t6)
            move $t6, $t5
            jr $ra
