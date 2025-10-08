        .text
        .globl main
main:
        li $t0, 1
        li $t5, 100
        loop:
                lw $t1, 0($a1)
                lw $t2, 4($a2)
                add $t3, $t1, $t2
                sw $t3, 4($a1)
                addi $a1, $a1, 4
                addi $a2, $a2, 4
                addi $t0, 1
                bne $t0, $t5, loop
        halt:
                nop
