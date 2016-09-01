//
//  main.swift
//  346Assignment1
//
//  Created by Cassidy Mowat on 8/31/16.
//  Copyright © 2016 Patrick Skinner. All rights reserved.
//

import Foundation

var testMatrix: Matrix<Int> = Matrix(rows: 3, columns: 3)
testMatrix[0, 0] = 1
testMatrix[1, 1] = 2
testMatrix[2, 2] = 3

print("\(testMatrix)")
print("\(testMatrix.transpose)")

var testVector: Vector<Int> = Vector(size: 5)
testVector[0] = 1
testVector[2] = 2
testVector[4] = 3

print("\(testVector)")

/**
withUnsafePointer(&testMatrix) {
    print("address: \($0)")
}
 */