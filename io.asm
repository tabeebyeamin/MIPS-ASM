.data

prompt: asciiz "Please Enter a Number: "



.text

main:
    # input syscall
    li $v0 5
    syscall
    