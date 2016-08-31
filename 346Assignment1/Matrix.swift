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
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        self.transpose = Matrix.init(rows: columns, columns: rows)
        
    }
    
    subscript(row: Int, column: Int) -> T{
        get {
            return T();
        }
        set {
            
        }
    }
    
    func copy() -> Matrix {
        return self;
    }
    
    var description: String{
        return "ToString"
    }
}