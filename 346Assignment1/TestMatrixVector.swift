//
//  TestMatrixVector.swift
//  346Assignment1
//
//  Created by Patrick Skinner on 9/4/16.
//  Copyright © 2016 Patrick Skinner. All rights reserved.
//

import Foundation

public class TestMatrixVector<T: MatrixDataEquatable>{
    
    func testInitialiser(rows: Int, columns: Int) -> Bool{
        let newMatrix: Matrix<Int> = Matrix(rows: rows, columns: columns);
        if(newMatrix.rows == rows && newMatrix.columns == columns){
            return true
        }
        return false
    }
    
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
    
    func testSubscriptSet(x: Int, y: Int, value: T, matrix: Matrix<T>) -> Bool{
        let testedMatrix = matrix.copy()
        testedMatrix[x, y] = value
        if(testedMatrix[x, y] == value){
            return true
        }
        return false
    }
    
    func testSubscriptGet(x: Int, y: Int, value: T, matrix: Matrix<T>) -> Bool{
        if(matrix[x, y] == value){
            return true
        }
        return false
    }
    
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
    
    func testRow(matrix: Matrix<T>, vector: Vector<T>, index: Int) -> Bool{
        let row: Vector = matrix.row(index)
        for x in 0...vector.size-1 {
            if(row[x] != vector[x]){
                return false
            }
        }
        return true
    }
    
    func testColumn(matrix: Matrix<T>, vector: Vector<T>, index: Int) -> Bool{
        let row: Vector = matrix.column(index)
        for x in 0...vector.size-1 {
            if(row[x] != vector[x]){
                return false
            }
        }
        return true
    }
    
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

    
    
}
