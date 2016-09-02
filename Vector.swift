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
    
    public func dot(v: Vector<T>) -> T{
        return T()
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
    var total: T = T()
    for x in 0...lhs.size-1{
        total = total + (lhs.vector[0, x] * rhs.vector[0, x])
    }
    return total
}
public func +<T: MatrixData>(lhs: Vector<T>, rhs: Vector<T>) -> Vector<T>{
    return Vector(size: 1)
}
public func -<T: MatrixData>(lhs: Vector<T>, rhs: Vector<T>) -> Vector<T>{
    return Vector(size: 1)
}

// Vector and scalar operators
public func +<T: MatrixData>(lhs: Vector<T>, rhs:T) -> Vector<T>{
    var v = lhs.vector
    for x in 0...lhs.size-1{
        v[0, x] = v[0, x]+rhs
    }
    return Vector(size: 1, vector: v)
}
public func -<T: MatrixData>(lhs: Vector<T>, rhs: T) -> Vector<T>{
    var v = lhs.vector
    for x in 0...lhs.size-1{
        v[0, x] = v[0, x]-rhs
    }
    return Vector(size: 1, vector: v)

}
public func *<T: MatrixData>(lhs: Vector<T>, rhs: T) -> Vector<T>{
    var v = lhs.vector
    for x in 0...lhs.size-1{
        v[0, x] = v[0, x]*rhs
    }
    return Vector(size: 1, vector: v)
}
public func /<T: MatrixData>(lhs: Vector<T>, rhs: T) -> Vector<T>{
    var v = lhs.vector
    for x in 0...lhs.size-1{
        v[0, x] = v[0, x]/rhs
    }
    return Vector(size: 1, vector: v)
}