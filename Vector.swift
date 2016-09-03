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
        self.size = size
        vector = Matrix.init(rows: 1, columns: size)
    }
    
    init(size: Int, vector: Matrix<T>) {
        self.size = size
        self.vector = vector
    }
    
    
    init(size: Int, matrix: [[T]]){
        self.size = size
        self.vector = Matrix(rows: 1, columns: size, matrix: matrix)
    }
    
    public func dot(v: Vector<T>) -> T{
        var total: T = T()
        for x in 0...size-1{
            total = total + (self.vector[0, x] * v.vector[0, x])
        }
        return total
    }
    
    public subscript(index: Int) -> T{
        get {
            return vector[0,index];
        }
        set {
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
    return lhs.dot(rhs)
}
public func +<T: MatrixData>(lhs: Vector<T>, rhs: Vector<T>) -> Vector<T>{
    return Vector(size: lhs.size, vector: lhs.vector+rhs.vector)
}
public func -<T: MatrixData>(lhs: Vector<T>, rhs: Vector<T>) -> Vector<T>{
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