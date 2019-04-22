# int n = 10;
# int f1 = 1, f2 = 1;
# while (n != 0){
#   f1 = f1 + f2
#   f2 = f1 - f2
#   n = n-1;
# result is f1



.text
main:
# n=t0, f1=t1, f2=t2
li $t0 10
li $t1 1
li $t2 1

while: beq $t0 $zero, endwhile
    add $t1 $t1 $t2
    sub $t2 $t1 $t2
    addi $t0 $t0 -1
    j while

endwhile:

    li $v0 10
    syscall