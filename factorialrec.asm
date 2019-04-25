.text
main:
# ask for input
li $v0 5
syscall
# move it to a new var
move $t9 $v0

# call recursion
addi $sp $sp -4
sw $t9 0($sp)
jal fact

# get the value back
lw $t8 0($sp)
add $sp $sp 4

li $v0 1
move $a0 $t8
syscall

#exit
li $v0 10
syscall


fact:
    lw $t0 0($sp)
    addi $sp $sp 4
    bne $t0 $zero rec

    # push 1 and return
    li $t1 1
    addi $sp $sp -4
    sw $t1 0($sp)
    jr $ra

rec:
    # store t0, then store ra
    # then fact(x-1)
    addi $sp $sp -4
    sw $t0 0($sp)
    addi $sp $sp -4
    sw $ra 0($sp)
    
    addi $t0 $t0 -1
    addi $sp $sp -4
    sw $t0 0($sp)

    # call factorial
    jal fact

    # compute fact
    lw $t2 0($sp)
    addi $sp $sp 4
    # restore ra
    lw $ra 0($sp)
    addi $sp $sp 4
    # x
    lw $t0 0($sp)
    addi $sp $sp 4
    # push x*(x-1)! and return
    mul $t2 $t2 $t0
    addi $sp $sp -4
    sw $t2 0($sp)
    jr $ra
