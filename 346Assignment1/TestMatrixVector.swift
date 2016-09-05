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
     
        -Parameters:
        rows: Int, the number of the rows in the desired matrix
        columns: Int, the number of columns in the desired matrix
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
     
        -Parameters:
        rows: Int, the number of the rows in the desired matrix
        columns: Int, the number of columns in the desired matrix
        matrix: [[Int]], the internal 2D matrix to be used
     */
    func testInitialiser(rows: Int, columns: Int, matrix: [[T]]) -> Bool{
        let newMatrix: Matrix<T> = Matrix(rows: rows, columns: columns, matrix: matrix);
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
     
        -Parameters:
        x: Int, the row of the element to be accessed
        y: Int, the column of the index to be accessed
        matrix: Matrix<T>, the matix for the subscript operation to be tested on
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
     
        -Parameters:
        x: Int, the row of the element to be accessed
        y: Int, the column of the index to be accessed
        value: T, the expected value at the chosen position
        matrix: Matrix<T>, the matix for the subscript operation to be tested on
     */
    func testSubscriptGet(x: Int, y: Int, value: T, matrix: Matrix<T>) -> Bool{
        if(matrix[x, y] == value){
            return true
        }
        return false
    }
    
    /** testVectorView
        Convert the given matrix to a vector, then check the contents of the vector against the original matrix, return true if they match.
        
        -Parameters:
        matrix: Matrix<T>, the Matrix to be converted to a vector and tested against
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
     
        -Parameters:
        matrix: Matrix<T>, the Matrix to be transposed
        desiredResult: Matrix<T>, the desired result of the transpose operation on the given matrix
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
     
        -Parameters:
        matrix: Matrix<T>, the Matrix to be tested
        desiredResult: Matrix<T>, the desired result of the row operation at the given index
        index: Int, the index of the desired row
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
     
        -Parameters:
        matrix: Matrix<T>, the Matrix to be tested
        desiredResult: Matrix<T>, the desired result of the column operation at the given index
        index: Int, the index of the desired column
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
     
        -Parameters:
        input1: Matrix<T>, the matrix to be used on the LHS of the operator
        input2: Matrix<T>, the matrix to be used on the RHS of the operator
        desiredResult: Matrix<T>, the desired result of the addition operation on both inputs
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
     
        -Parameters:
        input1: Matrix<T>, the matrix to be used on the LHS of the operator
        input2: Matrix<T>, the matrix to be used on the RHS of the operator
        desiredResult: Matrix<T>, the desired result of the subtraction operation on both inputs
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
     
        -Parameters:
        input1: Matrix<T>, the matrix to be used on the LHS of the operator
        input2: Matrix<T>, the matrix to be used on the RHS of the operator
        desiredResult: Matrix<T>, the desired result of the multiplication operation on both inputs
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
        Add input2 to each value in the matrix, return true if the result of this operation matches desiredResult.
     
        -Parameters:
        input1: Matrix<T>, the matrix to be used on the LHS of the operator
        input2: T, the scalar to be used on the RHS of the operator
        desiredResult: Matrix<T>, the desired result of the addition operation on both inputs
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
        Subtract input2 from each value in the matrix, return true if the result of this operation matches desiredResult.
     
        -Parameters:
        input1: Matrix<T>, the matrix to be used on the LHS of the operator
        input2: T, the scalar to be used on the RHS of the operator
        desiredResult: Matrix<T>, the desired result of the addition operation on both inputs
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
        Multiply each value in the matrix by input2, return true if the result of this operation matches desiredResult.
     
        -Parameters:
        input1: Matrix<T>, the matrix to be used on the LHS of the operator
        input2: T, the scalar to be used on the RHS of the operator
        desiredResult: Matrix<T>, the desired result of the multiplication operation on both inputs
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
        Divide each value in the matrix by input2, return true if the result of this operation matches desiredResult.
     
        -Parameters:
        input1: Matrix<T>, the matrix to be used on the LHS of the operator
        input2: T, the scalar to be used on the RHS of the operator
        desiredResult: Matrix<T>, the desired result of the division operation on both inputs
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
     
        -Parameters:
        input1: Matrix<T>, the first matrix to be compared
        input2: Matrix<T>, the second matrix to be compared against
     */
    func testAddresses(input1: Matrix<T>, input2: Matrix<T>) -> Bool{
        if(input1 === input2){
            return false
        }
        return true
    }
    
    /** testVectorInitialiser
        Return true if the intitialised vector has the correct size
     
        -Parameters
        size: Int, the size of the desired vector
     */
    func testVectorInitialiser(size: Int) -> Bool{
        let testVector = Vector<Int>(size: size)
        if(testVector.size == size){
            return true
        }
        return false
    }
    
    /** testVectorInitialiser
        Return true if the intitialised vector has the correct size and isHorizontal
     
        -Parameters
        size: Int, the size of the desired vector
        isHorizontal: Bool, the orientation of the desired vector
     */
    func testVectorInitialiser(size: Int, isHorizontal: Bool) -> Bool{
        let testVector = Vector<Int>(size: size, isHorizontal: isHorizontal)
        if( (testVector.size == size) && (isHorizontal == isHorizontal) ){
            return true
        }
        return false
    }
    
    /** testVectorInitialiser
        Return true if the intitialised vector has the correct size and all elements in the internal matrix are as expected.
     
        -Parameters
        size: Int, the size of the desired vector
        vector: Matrix<T>, the desired internal matrix of the vector
     */
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
    
    /** testVectorInitialiser
        Return true if the intitialised vector has the correct size and orientation and all elements in the internal matrix are as expected.
     
        -Parameters
        size: Int, the size of the desired vector
        vector: Matrix<T>, the desired internal matrix of the vector
        isHorizontal: Bool, the orientation of the desired vector
     */
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
    
    /** testVectorDot
        Return true if the dot product of the two input vectors matches the desired output
     
        -Parameters:
        input1: Vector<T>, the vector to be used on the LHS of the operation
        input2: Vector<T>, the vector to be used on the RHS of the operation
        desiredResult: T, the desired dot product of both inputs
     */
    func testVectorDot(input1: Vector<T>, input2: Vector<T>, desiredOutput: T) -> Bool{
        if(input1.dot(input2) == desiredOutput){
            return true
        }
        return false
    }
    
    /** testVectorSubscriptSet
        Replace a value in the given vector and return true if the value was successfully replaced
     
        -Parameters:
        input: Vector<T>, the vector to be accessed with the subscript function
        index: Int, the the index of the element to be set in the input vector
        value: T, the value to be inserted into the input vector
     */
    func testVectorSubscriptSet(input: Vector<T>, index: Int, value: T) -> Bool{
        let testedVector = input.copy()
        testedVector[index] = value
        if(testedVector[index] == value){
            return true
        }
        return false
    }
    
    /** testVectorSubscriptSet
        Retrieve the value at the given index in the given vector, return true if the retrieved value matches the given value.
     
        -Parameters:
        input: Vector<T>, the vector to be accessed with the subscript function
        index: Int, the the index of the element to be retrieved in the input vector
        value: T, the expected value to be found at the desired element in the vector
     */
    func testVectorSubscriptGet(input: Vector<T>, index: Int, value: T) -> Bool{
        if(input[index] == value){
            return true
        }
        return false
    }
    
    /** testMatrixView
        Convert the given vector to a matrix, return true if all elements in the matrix match the respective elements in the original vector.
     
        -Parameters:
        input: Vector<T>, the vector to be converted to a matrix
     */
    func testMatrixView(input: Vector<T>) -> Bool{
        let testMatrix: Matrix<T> = input.matrixview
        if(input.isHorizontal){
            for x in 0...input.size-1 {
                if(input[x] != testMatrix[0,x]){
                    print("\(input[x])")
                    print("\(testMatrix[0,x])")
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
        return true
    }
    
    /** testVectorMultiplication
        Multiply two vectors together, return true if the result of this operation matches desiredOutput.
     
        -Parameters:
        input1: Vector<T>, the vector to be used on the LHS of the operation
        input2: Vector<T>, the vector to be used on the RHS of the operation
        desiredResult: T, the desired output of the multiplication operation on both inputs
     */
    func testVectorMultiplication(input1: Vector<T>, input2: Vector<T>, desiredOutput: T) -> Bool{
        if(input1*input2 == desiredOutput){
            return true
        }
        return false
    }
    
    /** testVectorAddition
        Add two vectors together, return true if the result of this operation matches desiredOutput.
     
        -Parameters:
        input1: Vector<T>, the vector to be used on the LHS of the operation
        input2: Vector<T>, the vector to be used on the RHS of the operation
        desiredResult: T, the desired output of the addition operation on both inputs
     */
    func testVectorAddition(input1: Vector<T>, input2: Vector<T>, desiredOutput: Vector<T>) -> Bool{
        let result: Vector<T> = input1+input2
        for x in 0...result.size-1 {
            if(result[x] != desiredOutput[x]){
                return false
            }
        }
        return true
    }
    
    /** testVectorSubtraction
        Subtract input2 from input1, return true if the result of this operation matches desiredOutput.
     
        -Parameters:
        input1: Vector<T>, the vector to be used on the LHS of the operation
        input2: Vector<T>, the vector to be used on the RHS of the operation
        desiredResult: T, the desired output of the subtraction operation on both inputs
     */
    func testVectorSubtraction(input1: Vector<T>, input2: Vector<T>, desiredOutput: Vector<T>) -> Bool{
        let result: Vector<T> = input1-input2
        for x in 0...result.size-1 {
            if(result[x] != desiredOutput[x]){
                return false
            }
        }
        return true
    }
    
    /** testVectorScalarAddition
        Add input2 to each value in the vector, return true if the result of this operation matches desiredOutput.
     
        -Parameters:
        input1: Vector<T>, the vector to be used on the LHS of the operation
        input2: T, the scalar to be used on the RHS of the operation
        desiredResult: T, the desired output of the addition operation on both inputs
     */
    func testVectorScalarAddition(input1: Vector<T>, input2: T, desiredOutput: Vector<T>) -> Bool{
        let result: Vector<T> = input1+input2
        for x in 0...result.size-1 {
            if(result[x] != desiredOutput[x]){
                return false
            }
        }
        return true
    }
    
    /** testVectorScalarSubtract
        Subtract input2 from each value in the vector, return true if the result of this operation matches desiredOutput.
     
        -Parameters:
        input1: Vector<T>, the vector to be used on the LHS of the operation
        input2: T, the scalar to be used on the RHS of the operation
        desiredResult: T, the desired output of the subtraction operation on both inputs
     */
    func testVectorScalarSubtraction(input1: Vector<T>, input2: T, desiredOutput: Vector<T>) -> Bool{
        let result: Vector<T> = input1-input2
        for x in 0...result.size-1 {
            if(result[x] != desiredOutput[x]){
                return false
            }
        }
        return true
    }
    
    /** testVectorScalarMultiplication
        Multiply each value in the vector by input2, return true if the result of this operation matches desiredOutput.
     
        -Parameters:
        input1: Vector<T>, the vector to be used on the LHS of the operation
        input2: T, the scalar to be used on the RHS of the operation
        desiredResult: T, the desired output of the multiplication operation on both inputs
     */
    func testVectorScalarMultiplication(input1: Vector<T>, input2: T, desiredOutput: Vector<T>) -> Bool{
        let result: Vector<T> = input1*input2
        for x in 0...result.size-1 {
            if(result[x] != desiredOutput[x]){
                return false
            }
        }
        return true
    }
    
    /** testVectorScalarDivision
        Divide each value in the vector by input2, return true if the result of this operation matches desiredOutput.
     
        -Parameters:
        input1: Vector<T>, the vector to be used on the LHS of the operation
        input2: T, the scalar to be used on the RHS of the operation
        desiredResult: T, the desired output of the division operation on both inputs
     */
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
