//
//  Vector.swift
//  346Assignment1
//
//  Created by Patrick Skinner on 8/31/16.
//  Copyright © 2016 Patrick Skinner. All rights reserved.
//

import Foundation

public class Vector<T: MatrixData>: BasicVector, VectorArithmetic{
    public var size: Int
    var vector: Matrix<T>
    
    init(size: Int) {
        precondition(size > 0 , "Size must be greater than 0")
        self.size = size
        vector = Matrix.init(rows: 1, columns: size)
    }
    
    init(size: Int, vector: Matrix<T>) {
        precondition(size > 0 , "Size must be greater than 0")
        self.size = size
        self.vector = vector
    }
    
    
    init(size: Int, matrix: [[T]]){
        precondition(size > 0 , "Size must be greater than 0")
        self.size = size
        self.vector = Matrix(rows: 1, columns: size, matrix: matrix)
    }
    
    public func dot(v: Vector<T>) -> T{
        
        precondition(v.size != self.size, "Vectors must be the same size")
        
        var total: T = T()
        for x in 0...size-1{
            total = total + (self.vector[0, x] * v.vector[0, x])
        }
        return total
    }
    
    public subscript(index: Int) -> T{
        get {
            precondition(index < self.size, "Index value out of bounds")
            return vector[0,index];
        }
        set {
            precondition(index < self.size, "Index value out of bounds")
            vector[0,index] = newValue
        }
    }
    
    public func copy() -> Vector {
        return Vector(size: size, vector: vector)
    }
    
    public var description: String{
        return vector.description
    }
    
}

// Vector and Vector operators
public func *<T: MatrixData>(lhs: Vector<T>, rhs: Vector<T>) -> T{
    
    precondition(lhs.size == rhs.size , "Vectors must be the same size")
    
    return lhs.dot(rhs)
}
public func +<T: MatrixData>(lhs: Vector<T>, rhs: Vector<T>) -> Vector<T>{
    
    precondition(lhs.size == rhs.size , "Vectors must be the same size")
    
    return Vector(size: lhs.size, vector: lhs.vector+rhs.vector)
}
public func -<T: MatrixData>(lhs: Vector<T>, rhs: Vector<T>) -> Vector<T>{
    
    precondition(lhs.size == rhs.size , "Vectors must be the same size")
    
    return Vector(size: lhs.size, vector: lhs.vector-rhs.vector)
}

// Vector and scalar operators
public func +<T: MatrixData>(lhs: Vector<T>, rhs:T) -> Vector<T>{
    return Vector(size: lhs.size, vector: lhs.vector+rhs)
}
public func -<T: MatrixData>(lhs: Vector<T>, rhs: T) -> Vector<T>{
    return Vector(size: lhs.size, vector: lhs.vector-rhs)
}
public func *<T: MatrixData>(lhs: Vector<T>, rhs: T) -> Vector<T>{
    return Vector(size: lhs.size, vector: lhs.vector*rhs)
}
public func /<T: MatrixData>(lhs: Vector<T>, rhs: T) -> Vector<T>{
    return Vector(size: lhs.size, vector: lhs.vector/rhs)
}