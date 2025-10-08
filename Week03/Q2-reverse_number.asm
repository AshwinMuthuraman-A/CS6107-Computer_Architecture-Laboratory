        .data
msg1:   .asciiz "\n ENTER A NUMBER: "
msg2:   .asciiz "\n THE REVERSE IS: "

        .text
        .globl main

main:
        li $v0, 4
        la $a0, msg1
        syscall

        li $v0, 5
        syscall
        move $t0, $v0

        li $t1, 10
        li $s0, 0
        
        while:
              ble $t0, 0, exit
              div $t2, $t0, $t1
              mfhi $t2
              mul $s0, $s0, 10
              add $s0, $s0, $t2
              div $t2, $t0, $t1
              mflo $t0j while
        exit:

        li $v0, 4
        la $a0, msg2
        syscall

        li $v0, 1
        move $a0, $s0
        syscall
        