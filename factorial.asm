# for (i = 1, x = 1; i<=n; i++){
#   x = x * i
# }

# init x to 1, init i = 1
# i = t0, x = t1

.data
prompt: .asciiz "Please enter a number: "
message: .asciiz " factorial is: "

.text
main:
# ask for an integer store it in t2

li $v0 4
la $a0, prompt
syscall


li $v0 5
syscall
move $t2, $v0


# loop initialization

addi $t0, $zero, 1 #i
addi $t1, $zero, 1 #factorial x

# loops out when i > n
for: bgt $t0, $t2, endfor
    # x = x*i
    mul $t1, $t1, $t0

increment:
    addi $t0, $t0, 1
    j for

endfor:
    li $v0 1
    move $a0, $t2
    syscall

    li $v0 4
    la $a0, message
    syscall 


    li $v0 1
    move $a0, $t1
    syscall

    li $v0 10
    syscall

    