# HW 7
#
# Name: Ran Tao
#
# b. Yes. But you may not replace all float registers to
# integr registers, since you have to convert the height
# into a double number. my code is try to ues integer
# registers maximally.
#
# a.
.data
hundred: .double 100.0
Feet: .asciiz "Enter height in feet: "
Inch: .asciiz "Enter height in inches: "
Result: .asciiz "Height is "
Meter: .asciiz " meters\n"
Centimeter: .asciiz " centimeters\n"

.text
.globl main
main:
# print "Enter height in feet: "
li $v0, 4
la $a0, Feet
syscall

# get feet
li $v0, 5
syscall
move $t0, $v0

# print "Enter height in inches: "
li $v0, 4
la $a0, Inch
syscall

# get inches
li $v0, 5
syscall
move $t1, $v0

# print "Height is"
li $v0, 4
la $a0, Result
syscall

# t2 = (feet*12+inches)*254
mul $t0, $t0, 12
add $t0, $t0, $t1
mul $t2, $t0, 254

# convert integer to float
mtc1.d $t2, $f12
cvt.d.w $f12, $f12

# f0 = 100.0
l.d $f0, hundred

# f12 = f12 / 10000.0 for meters
div.d $f12, $f12, $f0
div.d $f12, $f12, $f0

# print double
li $v0, 3
syscall

# print " meters\n"
li $v0, 4
la $a0, Meter
syscall

# c. Modify your program to convert the 
# height into centimeters as well.
la $a0, Result
syscall

# f12 = f12 * 100.0 for centimeters
mul.d $f12, $f12, $f0
li $v0, 3
syscall

# print " entumeters\n"
li $v0, 4
la $a0, Centimeter
syscall

# end
li $v0, 10
syscall