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
    
    func testSubscript(x: Int, y: Int, value: T, matrix: Matrix<T>) -> Bool{
        matrix[x, y] = value
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
    
    func testTranspose(input: Matrix<T>, output: Matrix<T>) -> Bool{
        let transposed: Matrix<T> = input.transpose
        for x in 0...output.rows-1 {
            for y in 0...output.columns-1 {
                if(transposed[x,y] != output[x,y]){
                    return false
                }
            }
        }
        return true
    }
}
