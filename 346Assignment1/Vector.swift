//
//  Vector.swift
//  346Assignment1
//
//  Created by Patrick Skinner on 8/31/16.
//  Copyright © 2016 Patrick Skinner. All rights reserved.
//

import Foundation

public class Vector<T: MatrixData>: BasicVector, VectorArithmetic, VectorToMatrix{
    public var size: Int
    private var vector: Matrix<T>
    public var isHorizontal: Bool
    
    convenience init(){
        self.init(size: 1)
    }
    
    init(size: Int) {
        precondition(size > 0 , "Size must be greater than 0")
        self.size = size
        vector = Matrix.init(rows: 1, columns: size)
        self.isHorizontal = true
    }
    
    init(size: Int, isHorizontal: Bool) {
        precondition(size > 0 , "Size must be greater than 0")
        self.size = size
        if(isHorizontal){
            vector = Matrix.init(rows: 1, columns: size)
        } else {
            vector = Matrix.init(rows: size, columns: 1)
        }
        self.isHorizontal = isHorizontal
        
    }
    
    init(size: Int, vector: Matrix<T>) {
        precondition(size > 0 , "Size must be greater than 0")
        self.size = size
        self.vector = vector
        if(vector.rows > 1 && vector.columns == 1){
            self.isHorizontal = false
        } else {
            self.isHorizontal = true
        }
        
    }
    
    init(size: Int, matrix: [[T]], isHorizontal: Bool){
        precondition(size > 0 , "Size must be greater than 0")
        self.size = size
        if(isHorizontal){
            vector = Matrix.init(rows: 1, columns: size, matrix: matrix)
        } else {
            vector = Matrix.init(rows: size, columns: 1, matrix: matrix)
        }
        self.isHorizontal = isHorizontal
    }
    
    public func dot(v: Vector<T>) -> T{
        
        precondition(v.size == self.size, "Vectors must be the same size")
        
        var total: T = T()
        for x in 0...size-1{
            total = total + (self.vector[0, x] * v.vector[0, x])
        }
        return total
    }
    
    public subscript(index: Int) -> T{
        get {
            precondition(index < self.size, "Index value out of bounds")
            if(isHorizontal){
                return vector[0,index];
            }
            return vector[index,0];
        }
        set {
            precondition(index < self.size, "Index value out of bounds")
            if(isHorizontal){
                vector[0,index] = newValue;
            } else {
                vector[index,0] = newValue;
            }
        }
    }
    
    public func copy() -> Vector {
        return Vector(size: size, vector: vector.copy())
    }
    
    public var description: String{
        return vector.description
    }
    
    public var matrixview: Matrix<T>{
        get{
            if(isHorizontal){
                return vector
            } else {
                return vector
            }
            
        }
    }
}

// Vector and Vector operatorss
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