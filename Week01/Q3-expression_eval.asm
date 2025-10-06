        .text
        .globl main

main:
          li $v0, 4
	  la $a0, msg1
	  syscall
  
	  li $v0, 5
	  syscall
	  move $t0, $v0
	
	  add $t1, $t0, 3
	  mul $t0, $t0, $t1
	
	  li $v0, 4
	  la $a0, msg2
	  syscall
  
	  li $v0, 1
          move $a0, $t0
	  syscall
        
          li $v0, 4
          la $a0, endl
          syscall
        
        .data
msg1:   .asciiz "Enter the value of N : "
msg2:   .asciiz "The value of i is : "
