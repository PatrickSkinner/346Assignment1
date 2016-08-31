//
//  Matrix.swift
//  346Assignment1
//
//  Created by Patrick Skinner on 8/23/16.
//  Copyright © 2016 Patrick Skinner. All rights reserved.
//

import Foundation

class Matrix <T: MatrixData>: BasicMatrix, CustomStringConvertible {
    var rows: Int
    var columns: Int
    var transpose: Matrix
    var matrix: [[T]]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        self.transpose = Matrix.init(rows: columns, columns: rows)
        self.matrix = [[T]](count: rows, repeatedValue:[T](count: columns, repeatedValue:T()))
    }
    
    subscript(row: Int, column: Int) -> T{
        get {
            return matrix[row][column];
        }
        set {
            
        }
    }
    
    func copy() -> Matrix {
        return self;
    }
    
    var description: String{
        return "MatrixToString"
    }
}