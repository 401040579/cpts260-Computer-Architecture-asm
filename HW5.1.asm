# Solution: Homework 3: Problem 2
#
# Calculator
#
#### array is saved to address space from 10010000 to 10010024
###### syscall that has been used in this program #######
########### 1) syscall 4 to print a string
########### 2) syscall 1 to print an integer
########### 3) syscall 10 to exit the simulator
.data
###########################Data specified in memory #######################
array_a: .word 11, 12, -10, 13, 9, 12, 14, 15, -20
funct1: .asciiz "The maximum is: "
funct2: .asciiz "\nThe summation is: "
###########################################################################
.text
.globl main
main:
# syscall to print the the string to show the output of maximum
##############################################################
li $v0, 4
la $a0, funct1
syscall
###############################################################
jal maxf
move $a0, $v0
# syscall to read the first integer number from the console
##############################################################
li $v0, 1
syscall
###############################################################
# syscall to print the the string to show the output of maximum
##############################################################
li $v0, 4
la $a0, funct2
syscall
###############################################################
jal sumf
move $a0, $v0
# syscall to read the first integer number from the console
##############################################################
li $v0, 1
syscall
###############################################################
######################Exit simulator#############################
li $v0, 10
syscall
#################################################################

maxf:
li $t5, 1
li $t3, -10000
li $t1, 10
la $t0, array_a
loop1:
lw $s0, 0($t0)
ble $s0, $t3, cont
addi $t3, $s0, 0
cont:
addi $t0, $t0, 4
sub $t1, $t1, $t5
bne $t1, $t5, loop1
move $v0, $t3
jr $ra
sumf:
li $t5, 1
li $t3, 0
li $t1, 10
la $t0, array_a
loop2:
lw $s0, 0($t0)
add $t3, $t3, $s0
addi $t0, $t0, 4
sub $t1, $t1, $t5
bne $t1, $t5, loop2
move $v0, $t3
jr $ra