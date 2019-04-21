# print a hello or st
	.data
hello: .asciiz "Hello"

	
	.text
main: 
	li $v0 4
	la $a0 hello
	syscall	