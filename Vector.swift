//
//  Vector.swift
//  346Assignment1
//
//  Created by Patrick Skinner on 8/31/16.
//  Copyright © 2016 Patrick Skinner. All rights reserved.
//

import Foundation

public class Vector<T: MatrixData>: BasicVector{
    public var size: Int
    var vector: Matrix<T>
    
    init(size: Int) {
        self.size = size
        vector = Matrix.init(rows: 1, columns: size)
    }
    
    public func dot(v: Vector<T>) -> T{
        return T()
    }
    
    public subscript(index: Int) -> T{
        get {
            return vector[0, index];
        }
        set {
            
        }
    }
    
    public func copy() -> Vector {
        return self;
    }
    
    public var description: String{
        return vector.description
    }
}