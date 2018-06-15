# Homework 3
# 
# Name: Ran Tao
# 
# In this program, you are asked to write a program in assembly which works as a simple
# calculator. The program will get two integer numbers, and based on the requested operation, the
# result should be shown to the user
#
# c. How many registers do you need to implement this program?
# Registers:
# $t0 - first integer
# $t1 - second integer
# $t2 - op; then re-used for result
# $v0 - syscall parameter and return value
# $a0 - syscall parameter
# I need 5 registers to implement this program.
#
# d. What system calls do you need to write this program?
# syscall:
# 1) syscall 1 to print an integer
# 2) syscall 4 to print a string
# 3) syscall 5 to read an integer
# 4) syscall 10 to exit the simulator
#
# a. The program should print a meaningful phrase for each input, and the result.
.data
	###Data specified in memory
	Integ1: .asciiz "Enter the first integer: "
	Integ2: .asciiz "Enter the second integer: "
	Op: .asciiz "Enter the operation type (0(add), 1(sub), 2(mul)): "
	Result: .asciiz "The result is "

# b. The user should enter 0, 1, and 2 to tell the program the types of operation add, sub, and multiply, respectively.
.text
.globl main
main:

	###print Integ1
	li $v0, 4
	la $a0, Integ1
	syscall

	###read the first integer number
	li $v0, 5
	syscall
	add $t0, $zero, $v0

	###print Integ2
	li $v0, 4
	la $a0, Integ2
	syscall

	###read the second integer number
	li $v0, 5
	syscall
	add $t1, $zero, $v0

	###print the Op
	li $v0, 4
	la $a0, Op
	syscall

	###read the operation num
	li $v0, 5
	syscall
	add $t2, $zero, $v0

	###print Result
	li $v0, 4
	la $a0, Result
	syscall

	###if result == 0, jump to add, and if result == 1, jump to sub; otherwise, go to mul
	beq $t2, $zero, ADD
	beq $t2, 1, SUB

	###Multiply operation when op is not 0 and 1
	mul $t2, $t0, $t1
	j RESULT

	###Addition operation when op is 0
	ADD:
	add $t2, $t0, $t1
	j RESULT

	###Addition operation when op is 1
	SUB:
	sub $t2, $t0, $t1

	###Print result
	RESULT:
	li $v0, 1
	add $a0, $zero, $t2
	syscall

	###Exit
	li $v0, 10
	syscall
