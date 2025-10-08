       .data
A:     .word 23
B:     .word 98
C:     .word 17
msg1:  .asciiz "\n\t MEDIAN IS: "

        .text
        .globl main

main:
        la $t0, A
        la $t1, B
        la $t2, C

        lw $s0, 0($t0)
        lw $s1, 0($t1)
        lw $s2, 0($t2)

        blt $s0, $s1, mainelse
        blt $s1, $s2, elseif1
        move $t3, $s1
        j print
        
        elseif1:
            bgt $s0, $s2, else1
            move $t3, $s0
            j print
        
        else1:
            move $t3, $s2
            j print
        
        mainelse:
            bgt $s2, $s0, elseif2
            move $t3, $s0
            j print
            elseif2:
                blt $s2, $s1, else2
                move $t3, $s1
                j print
                else2:
                    move $t3, $s2
                    j print
        
        print:
            li $v0, 4
            la $a0, msg1
            syscall
            
            li $v0, 1
            la $a0, $t3
            syscall
