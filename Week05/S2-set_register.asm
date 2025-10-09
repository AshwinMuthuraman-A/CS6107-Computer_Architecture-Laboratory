       .data
size:  .word 10
arr:   .word 2,4,7,12,34,36,42,8,57,78
msg1:  .asciiz "\n REGISTER VALUE: "
msg2:  .asciiz "\n ELEMENTS ARE IN INCREASING ORDER"
msg2:  .asciiz "\n ELEMENTS ARE IN DECREASING ORDER"

        .text
        .globl main

main:
        la $t0, arr
        li $t1, 0
        lw $t2, size
        lw $s1, 0($t0)
        li $t1, 1
        li $s2, 1
        addi $t0, $t0, 4

        loop:
            beq $t1, $t2, halt
            lw $s0, 0($t0)
            ble $s0, $s1, stop
            move $s1, $s0
            addi $t1, $t1, 1
            addi $t0, $t0, 4
            j loop
            stop:
                li $s2, 0
                j halt
            bne $t1, $t2, loop
        halt: nop

        li $v0, 4
        move $a0, msg1
        syscall
        
        li $v0, 1
        move $a0, $s2
        syscall
        
        li $v0, 4
        beqz $s2, notinc
        la $a0, msg2
        syscall
        j end
        notinc:
            ls $a0, msg3
            syscall
        end: nop
