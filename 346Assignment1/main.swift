//
//  main.swift
//  346Assignment1
//
//  Created by Cassidy Mowat on 8/31/16.
//  Copyright © 2016 Patrick Skinner. All rights reserved.
//

import Foundation

/*
var testMatrix: Matrix<Int> = Matrix(rows: 3, columns: -3)
var testMatrix2: Matrix<Int> = Matrix(rows: 4, columns: 3)

 testMatrix+testMatrix

 
 print("\(testMatrix)")
 print("\(testMatrix.transpose)")
*/

/*
var testVector: Vector<Int> = Vector(size: 5)
var testVector2: Vector<Int> = Vector(size: 3)

testVector*testVector2
*/

/*
var leftMatrix: Matrix<Int> = Matrix(rows: 2, columns: 2)
var rightMatrix: Matrix<Int> = Matrix(rows: 2, columns: 2)

leftMatrix[0, 0] = 1
leftMatrix[0, 1] = 2
leftMatrix[1, 0] = 4
leftMatrix[1, 1] = 5

rightMatrix[0, 0] = 7
rightMatrix[0, 1] = 8
rightMatrix[1, 0] = 10
rightMatrix[1, 1] = 11

print("\(leftMatrix)")
print()
print("\(rightMatrix)")
print()

var result: Matrix<Int> = leftMatrix+rightMatrix

print("\(result)")
*/


var fractionOne: Fraction = Fraction(num: 2, den: 3)
var fractionTwo: Fraction = Fraction(num: 2, den: 4)

print("\(fractionOne == fractionTwo)")

var complexOne: Complex = Complex(real: 2, imag: 3)
var complexTwo: Complex = Complex(real: 1, imag: 3)

print("\(complexOne == complexTwo)")

/*
var leftMatrix: Matrix<Int> = Matrix(rows: 2, columns: 3)

leftMatrix[0, 0] = 1
leftMatrix[0, 1] = 2
leftMatrix[0, 2] = 3
leftMatrix[1, 0] = 4
leftMatrix[1, 1] = 5
leftMatrix[1, 2] = 6


print("\(leftMatrix)")
print()

var result: Matrix<Int> = leftMatrix*7

print("\(result)")
 */

/*
var testVector: Vector<Int> = Vector(size: 5)
testVector[0] = 1
testVector[2] = 2
testVector[4] = 3

print("\(testVector)")
print("\(testVector*2)")
print("\(testVector+2)")
print("\(testVector-2)")
print("\(testVector/2)")
print("\(testVector+testVector)")
print("\(testVector-testVector)")
print("\(testVector*testVector)")
print("\(testVector.dot(testVector))")
*/

/*
var testMatrix: Matrix<Int> = Matrix(rows: 3, columns: 3)

testMatrix[0, 0] = 1
testMatrix[0, 1] = 2
testMatrix[0, 2] = 3
testMatrix[1, 0] = 4
testMatrix[1, 1] = 5
testMatrix[1, 2] = 6
testMatrix[2, 0] = 7
testMatrix[2, 1] = 8
testMatrix[2, 2] = 9

print("\(testMatrix)")
print("\(testMatrix.row(1))")
print("\(testMatrix.column(1))")
testMatrix.column(1)[1] = 9

print("\(testMatrix)")
print("\(testMatrix.row(1))")
print("\(testMatrix.column(1))")
 */

/*
var testMatrix: Matrix<Fraction> = Matrix(rows: 3, columns: 3)
testMatrix[1, 1] = Fraction(num: 5,den: 2)
print("\(testMatrix)")
 
 */