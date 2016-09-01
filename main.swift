//
//  main.swift
//  346Assignment1
//
//  Created by Cassidy Mowat on 8/31/16.
//  Copyright © 2016 Patrick Skinner. All rights reserved.
//

import Foundation

var testMatrix: Matrix<Int> = Matrix(rows: 3, columns: 3)
var testMatrix2 = testMatrix
var testMatrix3 = testMatrix.copy()

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
print("\(testMatrix.transpose)")

var testVector: Vector<Int> = Vector(size: 5)
testVector[0] = 1
testVector[2] = 2
testVector[4] = 3

print("\(testVector)")

var longMatrix: Matrix<Int> = Matrix(rows: 1, columns: 5)

print("\(longMatrix)")

print("\(longMatrix.transpose)")

withUnsafePointer(&testMatrix) {
    print("Original address: \($0)")
}
withUnsafePointer(&testMatrix2) {
    print("Copy address: \($0)")
}
withUnsafePointer(&testMatrix3) {
    print("Hard Copy address: \($0)")
}