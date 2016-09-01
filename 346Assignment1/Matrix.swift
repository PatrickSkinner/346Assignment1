//
//  Matrix.swift
//  346Assignment1
//
//  Created by Patrick Skinner on 8/23/16.
//  Copyright © 2016 Patrick Skinner. All rights reserved.
//

import Foundation

public class Matrix <T: MatrixData>: BasicMatrix, CustomStringConvertible {
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