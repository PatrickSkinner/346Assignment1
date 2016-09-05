//
//  Matrix.swift
//  346Assignment1
//
//  Created by Patrick Skinner on 8/23/16.
//  Copyright © 2016 Patrick Skinner. All rights reserved.
//

import Foundation

public class Matrix <T: MatrixData>: BasicMatrix, MatrixArithmetic, MatrixToVector, CustomStringConvertible {
    public var rows: Int
    public var columns: Int
    private var matrix: [[T]]
    
    convenience init(){
        self.init(rows: 1, columns: 1)
    }
    
    init(rows: Int, columns: Int) {
        
        precondition(rows > 0 , "Rows must be greater than 0")
        precondition(columns > 0 , "Columns must be greater than 0")
        
        self.rows = rows
        self.columns = columns
        self.matrix = [[T]](count: rows, repeatedValue:[T](count: columns, repeatedValue:T()))
    }
    
    init(rows: Int, columns: Int, matrix: [[T]]){
        
        precondition(rows > 0 , "Rows must be greater than 0")
        precondition(columns > 0 , "Columns must be greater than 0")
        
        self.rows = rows
        self.columns = columns
        self.matrix = matrix
    }
    
    
    public subscript(row: Int, column: Int) -> T{
        get {
            precondition(row < self.rows, "Row Value out of bounds")
            precondition(column < self.columns, "Column value out of bounds")
            return matrix[row][column];
        }
        set {
            precondition(row < self.rows, "Row Value out of bounds")
            precondition(column < self.columns, "Column value out of bounds")
            matrix[row][column] = newValue
        }
    }
    
    public func copy() -> Matrix {
        return Matrix(rows: self.rows, columns: self.columns, matrix: matrix);
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
    
    public var vectorview: Vector<T>{
        get{
            return Vector(size: columns, vector: self)
        }
    }
    
    public func row(index: Int) -> Vector<T> {
        return Vector(size: columns, matrix: [matrix[index]], isHorizontal: true);
    }
    
    public func column(index: Int) -> Vector<T> {
        var vector: [[T]]
        vector = [[T]](count: columns, repeatedValue:[T](count: 1, repeatedValue:T()))
        for x in 0...rows-1{
            vector[x][0] = matrix[x][index];
        }
        return Vector(size: columns, matrix: vector, isHorizontal: false);
    }
    
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
}



// Matrix and Matrix operators
public func *<T: MatrixData>(lhs: Matrix<T>, rhs: Matrix<T>) -> Matrix<T>{
    let multipliedMatrix = Matrix<T>(rows: lhs.rows, columns: rhs.columns)
    
    precondition(lhs.columns == rhs.rows, "First Matrix columns must equal second Matrix rows")
    
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
    let addMatrix = Matrix<T>(rows: lhs.rows, columns: lhs.columns)
    
    precondition(lhs.rows == rhs.rows || lhs.columns == rhs.columns, "Matrices must be the same size")
    
    for x in 0...lhs.rows-1{
        for y in 0...lhs.columns-1{
            addMatrix[x, y] = lhs[x, y] + rhs[x, y]
        }
    }
    return addMatrix
}


public func -<T: MatrixData>(lhs: Matrix<T>, rhs: Matrix<T>) -> Matrix<T>{
    let subMatrix = Matrix<T>(rows: lhs.rows, columns: lhs.columns)
    
    precondition(lhs.rows == rhs.rows || lhs.columns == rhs.columns, "Matrices must be the same size")
    
    for x in 0...lhs.rows-1{
        for y in 0...lhs.columns-1{
            subMatrix[x, y] = lhs[x, y] - rhs[x, y]
        }
    }
    return subMatrix
}



// Matrix and scalar operators
public func +<T: MatrixData>(lhs: Matrix<T>, rhs:T) -> Matrix<T>{
    let addMatrix = Matrix<T>(rows: lhs.rows, columns: lhs.columns)
    
    for x in 0...lhs.rows-1{
        for y in 0...lhs.columns-1{
            addMatrix[x, y] = lhs[x, y] + rhs
        }
    }
    return addMatrix
}

public func -<T: MatrixData>(lhs: Matrix<T>, rhs: T) -> Matrix<T>{
    let subMatrix = Matrix<T>(rows: lhs.rows, columns: lhs.columns)
    
    for x in 0...lhs.rows-1{
        for y in 0...lhs.columns-1{
            subMatrix[x, y] = lhs[x, y] - rhs
        }
    }
    return subMatrix
}

public func *<T: MatrixData>(lhs: Matrix<T>, rhs: T) -> Matrix<T>{
    let multMatrix = Matrix<T>(rows: lhs.rows, columns: lhs.columns)
    
    for x in 0...lhs.rows-1{
        for y in 0...lhs.columns-1{
            multMatrix[x, y] = lhs[x, y] * rhs
        }
    }
    return multMatrix
}

public func /<T: MatrixData>(lhs: Matrix<T>, rhs: T) -> Matrix<T>{
    let divMatrix = Matrix<T>(rows: lhs.rows, columns: lhs.columns)
    
    for x in 0...lhs.rows-1{
        for y in 0...lhs.columns-1{
            divMatrix[x, y] = lhs[x, y] / rhs
        }
    }
    return divMatrix
}