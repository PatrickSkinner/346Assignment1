//
//  Complex.swift
//  prog2.1
//
//  Created by Cassidy Mowat on 7/14/16.
//  Copyright © 2016 Cassidy Mowat. All rights reserved.
//

/**
 Represents a complex number
 
 */
final class Complex : MatrixData, MatrixDataEquatable, CustomStringConvertible {
    
    // STORED PROPERTIES
    
    private var real: Float;   // Real part of the number
    private var imag: Float;   // Imaginary part of the number
    
    // COMPUTED PROPERTIES
    
    /**
     - returns: Float Magnitude of the complex number
     */
    var magnitude: Float {
        return (self.real * self.real) + (self.imag * self.imag);
    }
    
    /**
     - returns: String String representation of a complex number
     */
    var description: String {
        if(imag < 0){
            return "\(real)\(imag)i";
        }else {
            return"\(real)+\(imag)i";
        }
    }
    
    // INITIALISERS
    
    
    /**
     Designated initialiser
     
     Real and imaginary parts are passed in the arguments of the initialiser.
     
     - parameter real Real part of the numerator
     - parameter imag Imaginary part of the number
     */
    init(real : Float, imag : Float) {
        self.real = real
        self.imag = imag
    }
    
    /**
     Default initialiser
     
     Sets complex number to 0
     */
    convenience init() {
        self.init(real: 0.0, imag: 0.0)
    }
    
    // METHODS
    
    
    func copy() -> Complex{
        return Complex(real: self.real, imag: self.imag)
    }
    
    /**
     Adds two complex numbers.
     
     - parameter c1: Complex number to add to
     - parameter c2: Complex number to be added
     
     - returns: The result of c1 + c2.
     */
    private static func add(c1: Complex, to c2: Complex) -> Complex {
        return Complex(real: (c1.real + c2.real), imag: (c1.imag + c2.imag))
    }
    
    /**
     Subtract a complex number from a complex number.
     
     - parameter c1: Complex number to subtract
     - parameter c2: Complex number to subtract from
     
     - returns: The result of c2 - c1.
     */
    private static func subtract(c1: Complex, from c2: Complex) -> Complex {
        return Complex(real: (c1.real - c2.real), imag: (c1.imag - c2.imag))
    }
    
    /**
     Multiply a complex number by a complex number.
     
     - parameter c1: Complex number to multiply
     - parameter c2: Complex number to multiply by
     
     - returns: The result of c1*c2.
     */
    private static func multiply(c1: Complex, by c2: Complex) -> Complex {
        return Complex(real: ((c1.real * c2.real) - (c1.imag * c2.imag)),
                       imag: ((c1.real * c2.real) + (c1.imag * c2.imag)))
    }
    
    /**
     Divide a complex number by a complex number.
     
     - parameter c1: Complex number to divide
     - parameter c2: Complex number to divide by
     
     - returns: The result of c1/c2.
     */
    private static func divide(c1: Complex, by c2: Complex) -> Complex {
        return Complex(real: (((c1.real * c2.real) + (c1.imag * c2.imag)) / c2.magnitude),
                       imag: (((c1.real * c2.real) - (c1.imag * c2.imag)) / c2.magnitude))
    }
}

/**
 == operator between two Complex numbers
 */
func ==(c1: Complex, c2: Complex) -> Bool {
    if((c1.real == c2.real) && (c1.imag == c2.imag)){
        return true
    } else {
        return false
    }
}

/**
 + operator between two Complex numbers
 */
func +(c1: Complex, c2: Complex) -> Complex {
    return Complex.add(c1, to: c2)
}

/**
 - operator between two Complex numbers
 */
func -(c1: Complex, c2: Complex) -> Complex {
    return Complex.subtract(c2, from: c1)
}

/**
 * operator between two Complex numbers
 */
func *(c1: Complex, c2: Complex) -> Complex {
    return Complex.multiply(c1, by: c2)
}

/**
 / operator between two Complex numbers
 */
func /(c1: Complex, c2: Complex) -> Complex {
    return Complex.divide(c1, by: c2)
}

/**
 + operator between a Complex number and a Float
 */
func +(c: Complex, x: Float) -> Complex {
    return Complex (real: c.real + x,
                    imag: c.imag)
}

/**
 - operator between a Complex number and a Float
 */
func -(c: Complex, x: Float) -> Complex {
    return Complex (real: c.real - x,
                    imag: c.imag)
}

/**
 * operator between a Complex number and a Float
 */
func *(c: Complex, x: Float) -> Complex {
    return Complex (real: c.real * x,
                    imag: c.imag * x)
}

/**
 / operator between a Complex number and a Float
 */
func /(c: Complex, x: Float) -> Complex {
    return Complex (real:  c.real / x,
                    imag:  c.imag / x)
}