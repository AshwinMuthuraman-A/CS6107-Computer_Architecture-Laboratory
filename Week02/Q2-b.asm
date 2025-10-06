        .text
        .globl main
        
 main:
        lw $t0, 16($s7)
        sll $t1, $t0, 2
        add $t2, $t1, $s6
        lw $t3, 0($t2)
        sub $s0, $s1, $t3