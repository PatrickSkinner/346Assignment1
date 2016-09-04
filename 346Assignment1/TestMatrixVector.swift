//
//  TestMatrixVector.swift
//  346Assignment1
//
//  Created by Patrick Skinner on 9/4/16.
//  Copyright © 2016 Patrick Skinner. All rights reserved.
//

import Foundation

public class TestMatrixVector<T: MatrixDataEquatable>{
    
    /** testIntialiser
        Create a new matrix of set size, return true if row and column fields are of expected size.
    */
    func testInitialiser(rows: Int, columns: Int) -> Bool{
        let newMatrix: Matrix<Int> = Matrix(rows: rows, columns: columns);
        if(newMatrix.rows == rows && newMatrix.columns == columns){
            return true
        }
        return false
    }
    
    /** testIntialiser
        Create a new matrix of set size, assign the passed in 2D array as the internal matrix,
        return true if all values in the Matrix class are as expected.
     */
    func testInitialiser(rows: Int, columns: Int, matrix: [[Int]]) -> Bool{
        let newMatrix: Matrix<Int> = Matrix(rows: rows, columns: columns, matrix: matrix);
        if(newMatrix.rows == rows && newMatrix.columns == columns){
            for x in 0...rows-1 {
                for y in 0...columns-1 {
                    if(newMatrix[x,y] != matrix[x][y]){
                        return false
                    }
                }
            }
            return true
        }
        return false
    }
    
    /** testSubscriptSet
        Create a copy of the given matrix, assign a index within the matrix a given value,
        return true if the value is correctly stored in the matrix.
     */
    func testSubscriptSet(x: Int, y: Int, value: T, matrix: Matrix<T>) -> Bool{
        let testedMatrix = matrix.copy()
        testedMatrix[x, y] = value
        if(testedMatrix[x, y] == value){
            return true
        }
        return false
    }
    
    /** testSubscriptGet
        Retrieve the value at a given position of the matrix, return true if the accessed value matches the given value.
     */
    func testSubscriptGet(x: Int, y: Int, value: T, matrix: Matrix<T>) -> Bool{
        if(matrix[x, y] == value){
            return true
        }
        return false
    }
    
    /** testVectorView
        Convert the given matrix to a vector, then check the contents of the vector against the original matrix, return true if they match.
     */
    func testVectorView(matrix: Matrix<T>) -> Bool{
        let vector: Vector = matrix.vectorview
        if(vector.isHorizontal){
            for x in 0...vector.size-1 {
                if(matrix[0, x] != vector[x]){
                    return false
                }
            }
        } else {
            for x in 0...vector.size-1 {
                if(matrix[x, 0] != vector[x]){
                    return false
                }
            }

        }
        return true
    }
    
    /** testTranspose
        Pass in a matrix and the desired result of the transpose operation. Return true if the tranpose matches the desired output.
     */
    func testTranspose(input: Matrix<T>, desiredResult: Matrix<T>) -> Bool{
        let transposed: Matrix<T> = input.transpose
        for x in 0...desiredResult.rows-1 {
            for y in 0...desiredResult.columns-1 {
                if(transposed[x,y] != desiredResult[x,y]){
                    return false
                }
            }
        }
        return true
    }
    
    /** testRow
        Retrieve a row from the given matrix, check the row against the desired result vector.
     */
    func testRow(matrix: Matrix<T>, desiredResult: Vector<T>, index: Int) -> Bool{
        let row: Vector = matrix.row(index)
        for x in 0...desiredResult.size-1 {
            if(row[x] != desiredResult[x]){
                return false
            }
        }
        return true
    }
    
    /** testColumn
        Retrieve a column from the given matrix, check the row against the desired result vector.
     */
    func testColumn(matrix: Matrix<T>, desiredResult: Vector<T>, index: Int) -> Bool{
        let row: Vector = matrix.column(index)
        for x in 0...desiredResult.size-1 {
            if(row[x] != desiredResult[x]){
                return false
            }
        }
        return true
    }
    
    /** testAddition
        Add two matrices together, return true if the result of this operation matches desiredResult.
     */
    func testAddition(input1: Matrix<T>, input2: Matrix<T>, desiredResult: Matrix<T>) -> Bool{
        let result: Matrix<T> = input1+input2
        for x in 0...desiredResult.rows-1 {
            for y in 0...desiredResult.columns-1 {
                if(result[x,y] != desiredResult[x,y]){
                    return false
                }
            }
        }
        return true
    }
    
    /** testSubtraction
        Subtract two matrices, return true if the result of this operation matches desiredResult.
     */
    func testSubtraction(input1: Matrix<T>, input2: Matrix<T>, desiredResult: Matrix<T>) -> Bool{
        let result: Matrix<T> = input1-input2
        for x in 0...desiredResult.rows-1 {
            for y in 0...desiredResult.columns-1 {
                if(result[x,y] != desiredResult[x,y]){
                    return false
                }
            }
        }
        return true
    }
    
    /** testMultiplication
        Multiply two matrices together, return true if the result of this operation matches desiredResult.
     */
    func testMultiplication(input1: Matrix<T>, input2: Matrix<T>, desiredResult: Matrix<T>) -> Bool{
        let result: Matrix<T> = input1*input2
        for x in 0...desiredResult.rows-1 {
            for y in 0...desiredResult.columns-1 {
                if(result[x,y] != desiredResult[x,y]){
                    return false
                }
            }
        }
        return true
    }
    
    /** testScalarAddition
        Add T to each value in the matrix, return true if the result of this operation matches desiredResult.
     */
    func testScalarAddition(input1: Matrix<T>, input2: T, desiredResult: Matrix<T>) -> Bool{
        let result: Matrix<T> = input1+input2
        for x in 0...desiredResult.rows-1 {
            for y in 0...desiredResult.columns-1 {
                if(result[x,y] != desiredResult[x,y]){
                    return false
                }
            }
        }
        return true
    }
    
    /** testScalarSubtraction
        Subtract T from each value in the matrix, return true if the result of this operation matches desiredResult.
     */
    func testScalarSubtraction(input1: Matrix<T>, input2: T, desiredResult: Matrix<T>) -> Bool{
        let result: Matrix<T> = input1-input2
        for x in 0...desiredResult.rows-1 {
            for y in 0...desiredResult.columns-1 {
                if(result[x,y] != desiredResult[x,y]){
                    return false
                }
            }
        }
        return true
    }
    
    /** testScalarMultiplication
        Multiply each value in the matrix by T, return true if the result of this operation matches desiredResult.
     */
    func testScalarMultiplication(input1: Matrix<T>, input2: T, desiredResult: Matrix<T>) -> Bool{
        let result: Matrix<T> = input1*input2
        for x in 0...desiredResult.rows-1 {
            for y in 0...desiredResult.columns-1 {
                if(result[x,y] != desiredResult[x,y]){
                    return false
                }
            }
        }
        return true
    }
    
    /** testScalarDivision
        Divide each value in the matrix by T, return true if the result of this operation matches desiredResult.
     */
    func testScalarDivision(input1: Matrix<T>, input2: T, desiredResult: Matrix<T>) -> Bool{
        let result: Matrix<T> = input1/input2
        for x in 0...desiredResult.rows-1 {
            for y in 0...desiredResult.columns-1 {
                if(result[x,y] != desiredResult[x,y]){
                    return false
                }
            }
        }
        return true
    }
    
    /** testAddress
        Return true if the two input matrices have different addresses
     */
    func testAddresses(input1: Matrix<T>, input2: Matrix<T>) -> Bool{
        if(input1 === input2){
            return false
        }
        return true
    }
    
    func testVectorInitialiser(size: Int) -> Bool{
        let testVector = Vector<Int>(size: size)
        if(testVector.size == size){
            return true
        }
        return false
    }
    
    func testVectorInitialiser(size: Int, isHorizontal: Bool) -> Bool{
        let testVector = Vector<Int>(size: size, isHorizontal: isHorizontal)
        if( (testVector.size == size) && (isHorizontal == isHorizontal) ){
            return true
        }
        return false
    }
    
    func testVectorInitialiser(size: Int, vector: Matrix<T>) -> Bool{
        let testVector = Vector<T>(size: size, vector: vector)
        if(testVector.size == size){
            if(testVector.isHorizontal){
                for x in 0...size-1 {
                    if(testVector[x] != vector[0, x]){
                        return false
                    }
                }
            } else {
                for x in 0...size-1 {
                    if(testVector[x] != vector[x, 0]){
                        return false
                    }
                }
            }
            return true
        }
        return false
    }
    
    func testVectorInitialiser(size: Int, vector: [[T]], isHorizontal: Bool) -> Bool{
        let testVector = Vector<T>(size: size, matrix: vector, isHorizontal: isHorizontal)
        if(testVector.size == size){
            if(testVector.isHorizontal){
                for x in 0...size-1 {
                    if(testVector[x] != vector[0][x]){
                        return false
                    }
                }
            } else {
                for x in 0...size-1 {
                    if(testVector[x] != vector[x][0]){
                        return false
                    }
                }
            }
            return true
        }
        return false
    }
    
    func testVectorDot(input1: Vector<T>, input2: Vector<T>, desiredOutput: T) -> Bool{
        if(input2.dot(input2) == desiredOutput){
            return true
        }
        return false
    }
    
    func testVectorSubscriptSet(input: Vector<T>, index: Int, value: T) -> Bool{
        let testedVector = input.copy()
        testedVector[index] = value
        if(testedVector[index] == value){
            return true
        }
        return false
    }
    
    func testVectorSubscriptGet(input: Vector<T>, index: Int, value: T) -> Bool{
        if(input[index] == value){
            return true
        }
        return false
    }
    
    func testMatrixView(input: Vector<T>) -> Bool{
        let testMatrix: Matrix<T> = input.matrixview
        if(input.isHorizontal){
            for x in 0...input.size-1 {
                if(input[x] != testMatrix[0,x]){
                    return false
                }
            }
        } else {
            for x in 0...input.size-1 {
                if(input[x] != testMatrix[x,0]){
                    return false
                }
            }
        }
        return false
    }
    
    func testVectorMultiplication(input1: Vector<T>, input2: Vector<T>, desiredOutput: T) -> Bool{
        if(input1*input2 == desiredOutput){
            return true
        }
        return false
    }
    
    func testVectorAddition(input1: Vector<T>, input2: Vector<T>, desiredOutput: Vector<T>) -> Bool{
        let result: Vector<T> = input1+input2
        for x in 0...result.size-1 {
            if(result[x] != desiredOutput[x]){
                return false
            }
        }
        return true
    }
    
    func testVectorSubtraction(input1: Vector<T>, input2: Vector<T>, desiredOutput: Vector<T>) -> Bool{
        let result: Vector<T> = input1-input2
        for x in 0...result.size-1 {
            if(result[x] != desiredOutput[x]){
                return false
            }
        }
        return true
    }
    
    func testVectorScalarAddition(input1: Vector<T>, input2: T, desiredOutput: Vector<T>) -> Bool{
        let result: Vector<T> = input1+input2
        for x in 0...result.size-1 {
            if(result[x] != desiredOutput[x]){
                return false
            }
        }
        return true
    }
    
    func testVectorScalarSubtraction(input1: Vector<T>, input2: T, desiredOutput: Vector<T>) -> Bool{
        let result: Vector<T> = input1-input2
        for x in 0...result.size-1 {
            if(result[x] != desiredOutput[x]){
                return false
            }
        }
        return true
    }
    
    func testVectorScalarMultiplication(input1: Vector<T>, input2: T, desiredOutput: Vector<T>) -> Bool{
        let result: Vector<T> = input1*input2
        for x in 0...result.size-1 {
            if(result[x] != desiredOutput[x]){
                return false
            }
        }
        return true
    }
    
    func testVectorScalarDivision(input1: Vector<T>, input2: T, desiredOutput: Vector<T>) -> Bool{
        let result: Vector<T> = input1/input2
        for x in 0...result.size-1 {
            if(result[x] != desiredOutput[x]){
                return false
            }
        }
        return true
    }
}
