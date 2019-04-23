.text

strcpy:
    # pop addresses from the stack and dealloc
    lw $a0 4($sp)
    lw $a1 0($sp)
    addi $sp $sp 8

    # offset
    addi $t0 $zero $zero

while:
    # get addr of x + offset
    add $t1 $a0 $t0
    add $t2 $a1 $t0

    # load value of x + offset, store it in y + offset
    lb $t3 0($t1)
    sb $t3 0($t2)

    # check if 0
    beq $t3 $zero endwhile

    #otherwise increment offset
    addi $t0 $t0 1

endwhile:
    # push 1 onto the stack
    addi $sp $sp -4
    addi $t0 $zero 1
    sw $t0 0($sp)
    jr $ra