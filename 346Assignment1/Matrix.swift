//
//  Matrix.swift
//  346Assignment1
//
//  Created by Patrick Skinner on 8/23/16.
//  Copyright © 2016 Patrick Skinner. All rights reserved.
//

import Foundation

public class Matrix <T: MatrixData>: BasicMatrix, MatrixArithmetic, CustomStringConvertible {
    public var rows: Int
    public var columns: Int
    var matrix: [[T]]
    
    public var transpose: Matrix<T>{
        get{
            var temp: [[T]] = [[T]](count: columns, repeatedValue:[T](count: rows, repeatedValue:T()))
            for x in 0...rows-1 {
                for y in 0...columns-1 {
                    temp[y][x] = matrix[x][y]
                }
            }
            return Matrix(rows: columns, columns: rows, matrix: temp)
        }
    }
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        self.matrix = [[T]](count: rows, repeatedValue:[T](count: columns, repeatedValue:T()))
    }
    
    init(rows: Int, columns: Int, matrix: [[T]]){
        self.rows = rows
        self.columns = columns
        self.matrix = matrix
    }
    
    
    public subscript(row: Int, column: Int) -> T{
        get {
            return matrix[row][column];
        }
        set {
            matrix[row][column] = newValue
        }
    }
    
    public func copy() -> Matrix {
        return Matrix(rows: 3, columns: 3, matrix: matrix);
    }
    
    public var description: String{
        var result = ""
        for x in 0 ..< matrix.count {
            for y in 0 ..< matrix[x].count {
                result += String(matrix[x][y]) + "," + "\t"
                }
            result += "\n"
        }
        return result
    }
    
}

public func *<T: MatrixData>(lhs: Matrix<T>, rhs: Matrix<T>) -> Matrix<T>{
    var multipliedMatrix = Matrix<T>(rows: lhs.rows, columns: rhs.columns)
    
    if(lhs.columns != rhs.rows){
        print("Matrices cannot be multiplied together")
    }
    
    for x in 0...lhs.rows-1 {
        for y in 0...rhs.columns-1 {
            for z in 0...rhs.rows-1 {
                multipliedMatrix[x, y] = multipliedMatrix[x, y] + lhs[x, z] * rhs[z, y]
            }
        }
    }
    return multipliedMatrix
}


public func +<T: MatrixData>(lhs: Matrix<T>, rhs: Matrix<T>) -> Matrix<T>{
    var addMatrix = Matrix<T>(rows: lhs.rows, columns: lhs.columns)
    
    if(lhs.rows != rhs.rows || lhs.columns != rhs.columns){
        print("Matrices must be the same size")
    }
    
    for x in 0...lhs.rows-1{
        for y in 0...lhs.columns-1{
            addMatrix[x, y] = lhs[x, y] + rhs[x, y]
        }
    }
    return addMatrix
}


public func -<T: MatrixData>(lhs: Matrix<T>, rhs: Matrix<T>) -> Matrix<T>{
    var subMatrix = Matrix<T>(rows: lhs.rows, columns: lhs.columns)
    
    if(lhs.rows != rhs.rows || lhs.columns != rhs.columns){
        print("Matrices must be the same size")
    }
    
    for x in 0...lhs.rows-1{
        for y in 0...lhs.columns-1{
            subMatrix[x, y] = lhs[x, y] - rhs[x, y]
        }
    }
    return subMatrix
}

public func +<T: MatrixData>(lhs: Matrix<T>, rhs:T) -> Matrix<T>{
    var addMatrix = Matrix<T>(rows: lhs.rows, columns: lhs.columns)
    
    for x in 0...lhs.rows-1{
        for y in 0...lhs.columns-1{
            addMatrix[x, y] = lhs[x, y] + rhs
        }
    }
    return addMatrix
}

public func -<T: MatrixData>(lhs: Matrix<T>, rhs: T) -> Matrix<T>{
    var subMatrix = Matrix<T>(rows: lhs.rows, columns: lhs.columns)
    
    for x in 0...lhs.rows-1{
        for y in 0...lhs.columns-1{
            subMatrix[x, y] = lhs[x, y] - rhs
        }
    }
    return subMatrix
}

public func *<T: MatrixData>(lhs: Matrix<T>, rhs: T) -> Matrix<T>{
    var multMatrix = Matrix<T>(rows: lhs.rows, columns: lhs.columns)
    
    for x in 0...lhs.rows-1{
        for y in 0...lhs.columns-1{
            multMatrix[x, y] = lhs[x, y] * rhs
        }
    }
    return multMatrix
}

public func /<T: MatrixData>(lhs: Matrix<T>, rhs: T) -> Matrix<T>{
    var divMatrix = Matrix<T>(rows: lhs.rows, columns: lhs.columns)
    
    for x in 0...lhs.rows-1{
        for y in 0...lhs.columns-1{
            divMatrix[x, y] = lhs[x, y] / rhs
        }
    }
    return divMatrix
}