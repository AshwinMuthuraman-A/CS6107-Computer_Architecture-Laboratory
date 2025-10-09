          .data
msg1:     .asciiz "\n ENTER FIRST NUMBER: "
msg2:     .asciiz "\n ENTER SECOND NUMBER: "
res_and:  .asciiz "\n AND Value is: "
res_or:   .asciiz "\n OR Value is: "
res_not:  .asciiz "\n NOT (of first number) Value is: "
res_sll:  .asciiz "\n SHIFT LEFT (first number by 2 bits) is: "
res_srl:  .asciiz "\n SHIFT RIGHT (first number by 2 bits) is: "

        .text
        .globl main

main:
        li $v0, 4
        la $a0, msg1
        syscall

        li $v0, 5
        syscall
        move $t0, $v0

        li $v0, 4
        la $a0, msg2
        syscall

        li $v0, 5
        syscall
        move $t1, $v0

        and $a1, $t0, $t1
        la $a0, res_and
        jal display

        or $a1, $t0, $t1
        la $a0, res_or
        jal display

        not $a1, $t0
        la $a0, $res_not
        jal display

        sll $a1, $t0, 2
        la $a0, res_sll
        jal display

        srl $a1, $t0, 2
        la $a0, res_srl
        jal display
        
        li $v0, 10
        syscall

display:
        li $v0, 4
        syscall
        li $v0, 1
        move $a0, $a1
        syscall
        jr $ra
