//
//  Vector.swift
//  346Assignment1
//
//  Created by Patrick Skinner on 8/31/16.
//  Copyright © 2016 Patrick Skinner. All rights reserved.
//

import Foundation

class Vector<T: MatrixData>: BasicVector{
    var size: Int
    var vector: Matrix<T>
    
    init(size: Int) {
        self.size = size
        vector = Matrix.init(rows: 1, columns: size)
    }
    
    func dot(v: Vector<T>) -> T{
        return T()
    }
    
    subscript(index: Int) -> T{
        get {
            return vector[0, index];
        }
        set {
            
        }
    }
    
    func copy() -> Vector {
        return self;
    }
    
    var description: String{
        return "ToString"
    }
}