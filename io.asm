.data

prompt: .asciiz "Please Enter a Number: "

message: .asciiz "Your number was: "
period: .asciiz ".\n"

.text


# syscall for printing number
main:
    # syscall from printing prompt
    li $v0 4
    la $a0 prompt
    syscall

    # syscall for getting number
    li $v0 5
    syscall
    # copy the number from v0 to somewhere else
    move $t0 $v0
    

    # pring the number
    li $v0 4
    la $a0 message
    syscall

    li $v0 1
    move $a0 $t0
    syscall

    li $v0 4
    la $a0 period
    syscall

end: 
    li $v0 10
    syscall

    