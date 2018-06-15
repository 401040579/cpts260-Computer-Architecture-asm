# Homework 5
####################################################
# d. the address has been used by the simulator for 
# this array is from 10010000 to 10010024
####################################################
# syscall 1,4,10 has been used.
####################################################

.data
  theArray: .space 36
  MAX: .asciiz "The maximum is "
  SUM: .asciiz "\nThe summmation is "
.text
.globl main
main:
  ###insert numbers to theArray
  li $t7, 0
  li $t0, 11
  sw $t0, theArray($t7)
  
  li $t7, 4
  li $t0, 12
  sw $t0, theArray($t7)
  
  li $t7, 8
  li $t0, -10
  sw $t0, theArray($t7)
  
  li $t7, 12
  li $t0, 13
  sw $t0, theArray($t7)
  
  li $t7, 16
  li $t0, 9
  sw $t0, theArray($t7)
  
  li $t7, 20
  li $t0, 12
  sw $t0, theArray($t7)
    
  li $t7, 24
  li $t0, 14
  sw $t0, theArray($t7)
    
  li $t7, 28
  li $t0, 15
  sw $t0, theArray($t7)
    
  li $t7, 32
  li $t0, -20
  sw $t0, theArray($t7)

  jal maximum
  jal summation

  li $v0, 10
  syscall
####################################
#####the function to find maximum
maximum:
  ###print out "The maximum is "
  li $v0, 4
  la $a0, MAX
  syscall

  ###let t1 = first item of theArray
  li $t0, 0
  lw $t1, theArray($t0)

loop:
  ###i++;
  addi $t0, $t0, 4  

  ###t2=arr[i]; 
  lw $t2, theArray($t0) 

  ###if(t1<t2) t3=1;  
  slt $t3, $t1, $t2 

  ###if(t3==0) j t2et1  
  bne $t3, $zero, t2et1 

loop2:
  ###go thought theArray
  blt $t0,32,loop     

  ###print out answer
  li $v0, 1
  add $a0, $zero, $t1
  syscall         
  jr $ra

t2et1:
  #t2=t1
  move $t1, $t2       
  j loop2
####################################

####################################
#####the function to find summation
summation:  
  ###print out "The summmation is "
  li $v0, 4
  la $a0, SUM
  syscall   

  #t0=0;
  li $t0, 0   
  #t2=arr[0];     
  lw $t2, theArray($t0)
loop3:
  #i++;
  addi $t0, $t0, 4

  #t1=arr[i];   
  lw $t1, theArray($t0)

  #t2+=t1;
  add $t2, $t2, $t1

  #go thought theArray  
  blt $t0,32,loop3

  ###print out answer
  li $v0, 1         
  add $a0, $zero, $t2
  syscall
  jr $ra
####################################