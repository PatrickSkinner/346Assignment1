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
    public var transpose: Matrix<T>{
        get{
            return self
        }
    }
    var matrix: [[T]]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        self.matrix = [[T]](count: rows, repeatedValue:[T](count: columns, repeatedValue:T()))
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
        return Matrix(rows: 3, columns: 3);
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