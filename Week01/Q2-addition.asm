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
        
        add $t0, $t0, $t1
        
        li $v0, 4
        la $a0, msg3
        syscall
        
        li $v0, 1
        move $a0, $t0
        syscall
        
        li $v0, 4
        la $a0, newline
        syscall
        
        li $v0, 10
        
        .data
msg1:   .asciiz "Enter A : "
msg2:   .asciiz "Enter B : "
msg3:   .asciiz "A + B = "
newline:.asciiz "\n"
