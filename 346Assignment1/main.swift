//
//  main.swift
//  346Assignment1
//
//  Created by Cassidy Mowat on 8/31/16.
//  Copyright © 2016 Patrick Skinner. All rights reserved.
//

import Foundation

var tester: TestMatrixVector = TestMatrixVector<Int>()
var testMatrix: [[Int]] = [[Int]](count: 3, repeatedValue:[Int](count: 3, repeatedValue:Int()))

testMatrix[0][0] = 1
testMatrix[0][1] = 2
testMatrix[0][2] = 3
testMatrix[1][0] = 4
testMatrix[1][1] = 5
testMatrix[1][2] = 6
testMatrix[2][0] = 7
testMatrix[2][1] = 8
testMatrix[2][2] = 9

print("\(tester.testInitialiser(5, columns: 5))")
print("\(tester.testInitialiser(3, columns: 3, matrix: testMatrix))")


var testMatrixOne = Matrix<Int>(rows: 3, columns: 3, matrix: testMatrix)
var testMatrixTwo = Matrix<Int>(rows: 3, columns: 3, matrix: testMatrix)
var testMatrixResult = Matrix<Int>(rows: 3, columns: 3)

print("\(tester.testSubscriptSet(1, y: 1, value: 15, matrix: testMatrixOne))")
print("\(tester.testSubscriptGet(1, y: 1, value: 5, matrix: testMatrixOne))")

testMatrixResult[0, 0] = 1
testMatrixResult[0, 1] = 4
testMatrixResult[0, 2] = 7
testMatrixResult[1, 0] = 2
testMatrixResult[1, 1] = 5
testMatrixResult[1, 2] = 8
testMatrixResult[2, 0] = 3
testMatrixResult[2, 1] = 6
testMatrixResult[2, 2] = 9

print("\(tester.testTranspose(testMatrixOne, desiredResult: testMatrixResult))")


var testMatrixVectorHor = Matrix<Int>(rows: 1, columns: 3)
var testMatrixVectorVer = Matrix<Int>(rows: 3, columns: 1)

testMatrixVectorHor[0, 0] = 1
testMatrixVectorHor[0, 1] = 2
testMatrixVectorHor[0, 2] = 3

testMatrixVectorVer[0, 0] = 1
testMatrixVectorVer[1, 0] = 2
testMatrixVectorVer[2, 0] = 3

print("\(tester.testVectorView(testMatrixVectorHor))")
print("\(tester.testVectorView(testMatrixVectorVer))")


var testVectorRow = Vector<Int>(size: 3)
var testVectorCol = Vector<Int>(size: 3, isHorizontal: false)

testVectorRow[0] = 1
testVectorRow[1] = 2
testVectorRow[2] = 3

testVectorCol[0] = 1
testVectorCol[1] = 4
testVectorCol[2] = 7

print("\(tester.testRow(testMatrixOne, desiredResult: testVectorRow, index: 0))")
print("\(tester.testColumn(testMatrixOne, desiredResult: testVectorCol, index: 0))")


testMatrixTwo[0, 0] = 2
testMatrixTwo[0, 1] = 2
testMatrixTwo[0, 2] = 2
testMatrixTwo[1, 0] = 2
testMatrixTwo[1, 1] = 2
testMatrixTwo[1, 2] = 2
testMatrixTwo[2, 0] = 2
testMatrixTwo[2, 1] = 2
testMatrixTwo[2, 2] = 2

testMatrixResult[0, 0] = 3
testMatrixResult[0, 1] = 4
testMatrixResult[0, 2] = 5
testMatrixResult[1, 0] = 6
testMatrixResult[1, 1] = 7
testMatrixResult[1, 2] = 8
testMatrixResult[2, 0] = 9
testMatrixResult[2, 1] = 10
testMatrixResult[2, 2] = 11

print("\(tester.testAddition(testMatrixOne, input2: testMatrixTwo, desiredResult: testMatrixResult))")
print("\(tester.testScalarAddition(testMatrixOne, input2: 2, desiredResult: testMatrixResult))")


testMatrixResult[0, 0] = -1
testMatrixResult[0, 1] = 0
testMatrixResult[0, 2] = 1
testMatrixResult[1, 0] = 2
testMatrixResult[1, 1] = 3
testMatrixResult[1, 2] = 4
testMatrixResult[2, 0] = 5
testMatrixResult[2, 1] = 6
testMatrixResult[2, 2] = 7

print("\(tester.testSubtraction(testMatrixOne, input2: testMatrixTwo, desiredResult: testMatrixResult))")
print("\(tester.testScalarSubtraction(testMatrixOne, input2: 2, desiredResult: testMatrixResult))")


testMatrixResult[0, 0] = 12
testMatrixResult[0, 1] = 12
testMatrixResult[0, 2] = 12
testMatrixResult[1, 0] = 30
testMatrixResult[1, 1] = 30
testMatrixResult[1, 2] = 30
testMatrixResult[2, 0] = 48
testMatrixResult[2, 1] = 48
testMatrixResult[2, 2] = 48

print("\(tester.testMultiplication(testMatrixOne, input2: testMatrixTwo, desiredResult: testMatrixResult))")


testMatrixResult[0, 0] = 2
testMatrixResult[0, 1] = 4
testMatrixResult[0, 2] = 6
testMatrixResult[1, 0] = 8
testMatrixResult[1, 1] = 10
testMatrixResult[1, 2] = 12
testMatrixResult[2, 0] = 14
testMatrixResult[2, 1] = 16
testMatrixResult[2, 2] = 18

print("\(tester.testScalarMultiplication(testMatrixOne, input2: 2, desiredResult: testMatrixResult))")


testMatrixResult[0, 0] = 0
testMatrixResult[0, 1] = 1
testMatrixResult[0, 2] = 1
testMatrixResult[1, 0] = 2
testMatrixResult[1, 1] = 2
testMatrixResult[1, 2] = 3
testMatrixResult[2, 0] = 3
testMatrixResult[2, 1] = 4
testMatrixResult[2, 2] = 4

print("\(tester.testScalarDivision(testMatrixOne, input2: 2, desiredResult: testMatrixResult))")

print("\(tester.testAddresses(testMatrixOne, input2: testMatrixOne.copy()))")
print("\(!tester.testAddresses(testMatrixOne, input2: testMatrixOne))")
testMatrixTwo = testMatrixOne
print("\(!tester.testAddresses(testMatrixOne, input2: testMatrixTwo))")






var test2dArray: [[Int]] = [[Int]](count: 1, repeatedValue:[Int](count: 3, repeatedValue:Int()))

print("\(tester.testVectorInitialiser(3, vector: test2dArray, isHorizontal: true)) dat")
