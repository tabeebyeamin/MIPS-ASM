# while (i < n){
#    if ((n%i)==0){ 
#        print "i, ";
#    } else {
#        i++;
#    }
# }
# print "n.\n"

# t0=i, t1=n
.data
space: .asciiz "\n"

.text
main:
# capture the number
li $v0, 5
syscall
move $t1, $v0

# init i
li $t0, 2


# loop
while: bge $t0, $t1, endwhile
    # compute division
    div $t1, $t0
    mfhi $t2

    # if remainder not equal to zero
    bnez $t2, increment
    # otherwise print i and make new n
    li $v0 1
    move $a0, $t0
    syscall

    # space
    li $v0 4
    la $a0, space
    syscall

    mflo $t1
    j while


    increment:
        addi $t0, $t0, 1
        j while
endwhile:

    # print the last number
    li $v0, 1
    move $a0, $t1
    syscall
    
    li $v0 10
    syscall

