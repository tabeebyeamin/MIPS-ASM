# A[100], B[100]
# for (int i=0; i < 100; i++){
#   A[i] = B[i] + 1
# }

# need to store the arrays
.data
A: .space 400
B: .word 42:100 # inits 100 ints to 42


.text 
main:
la $t8 A 
la $t9 B 
# i = t0, max = t1
li $t0 0
li $t1 400


for: bge $t0 $t1 endfor
    # load in the two arrays, t2 = A, t3 = B
    sll $t2 $t0 2

    # ptr for address of A
    add $t3 $t8 $t2
    add $t4 $t9 $t2

    # do offset by doing sll
    lw $t5 0($t4)
    addi $t5 $t5 1
    sw $t5 0($t3)

    # access items by memadr = start + i*4
update: addi $t0 $t0 4
        j for



endfor:
    li $v0 10
    syscall
