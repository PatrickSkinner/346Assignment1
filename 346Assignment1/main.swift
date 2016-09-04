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

var testMatrixClass = Matrix(rows: 3, columns: 3, matrix: testMatrix)

var testMatrixVectorHor = Matrix<Int>(rows: 1, columns: 3)
var testMatrixVectorVer = Matrix<Int>(rows: 3, columns: 1)

testMatrixVectorHor[0, 0] = 1
testMatrixVectorHor[0, 1] = 2
testMatrixVectorHor[0, 2] = 3

testMatrixVectorVer[0, 0] = 1
testMatrixVectorVer[1, 0] = 2
testMatrixVectorVer[2, 0] = 3


print("\(tester.testInitialiser(5, columns: 5))")
print("\(tester.testInitialiser(3, columns: 3, matrix: testMatrix))")

//print("\(tester.testSubscriptSet(1, y: 1, value: 15, matrix: testMatrixClass))")

print("\(tester.testVectorView(testMatrixVectorHor))")
print("\(tester.testVectorView(testMatrixVectorVer))")