//
//  Fraction.swift
//  prog2.1
//
//  Created by Cassidy Mowat on 7/14/16.
//  Copyright © 2016 Cassidy Mowat. All rights reserved.
//

import Foundation

/**
 Represents a number as a fraction of two integers
 
 */
final class Fraction: MatrixData, MatrixDataEquatable, CustomStringConvertible {
    
    // STORED PROPERTIES
    
    private let num: Int; // Numerator
    private let den: Int; // Denominator
    
    // COMPUTED PROPERTIES
    
    /**
     Converts fraction to a Float value
     
     - returns: Float Decimal value of the fraction
     */
    var decimal: Float {
        get{
            // num and den are of type Int, therefore,
            // they need to be explicitly converted to Floats
            return Float(self.num)/Float(self.den);
        }
    }
    
    /**
     Converts object to a string description
     
     - returns: String String representation of a fraction
     */
    var description: String {
        if((self.den) == 1){
            return "\(self.num)"
        } else if((self.num) == 0){
            return "0"
        } else if(self.num > self.den){
            let a = (self.num / self.den)
            let b = (self.num) % (self.den)
            return "\(a) \(b)/\(self.den)"
        }
        
        return "\(self.num)/\(self.den)"
    }
    
    // INITIALISERS
    
    /**
     Default initialiser
     
     Numerator gets set to 0 and denominator gets set to 1
     */
    convenience required init() {
        self.init(num: 0, den: 1);
    }
    
    /**
     Designated initialiser
     
     Numerator and denominator values are passed in the arguments
     
     - parameter num: Fraction's numerator
     - parameter den: Fraction's denominator
     */
    init(num : Int, den : Int) {
        
        // Check the denominator...
        assert(den != 0, "Denominator cannot be zero")
        
        var num = num
        var den = den
        
        if(den < 0) {
            // If the denominator is negative
            // multiply the numerator and
            // denominator by -1 - this
            // ensures the denominator is
            // always positive, and numerator
            // carries the appropriate sign
            num = -num;
            den = -den;
        }
        
        // Find greatest common denominator
        for gcd in (1...den).reverse() {
            if(num%gcd == 0 && den%gcd==0) {
                // Common denominator found,
                // divide numerator and denominator
                num /= gcd;
                den /= gcd;
                break;
            }
        }
        
        self.num = num
        self.den = den
        
    }
    
    /**
     Convenience initialiser
     
     Numerator is set to some value, denominator
     is set to 1
     
     - parameter num: Fraction's numerator
     */
    convenience init(num : Int) {
        self.init(num: num, den: 1);
    }
    
    // METHODS
    
    /**
     Adds a fraction to self.
     
     - parameter f: Fraction to add to self
     
     - returns: Fraction The result of adding f to self =
     */
    func add(f: Fraction) -> Fraction {
        return Fraction(num: self.num*f.den + self.den*f.num,
                        den: self.den*f.den)
    }
    
    /**
     Subtracts fraction from self.
     
     - parameter f: Fraction to subtract from self
     
     - returns: Fraction The result of subtracting f from self.
     */
    func subtract(f: Fraction) -> Fraction {
        return Fraction(num: self.num*f.den - self.den*f.num,
                        den: self.den*f.den)
    }
    
    /**
     Multiplies self by a fraction.
     
     - parameter f: Fraction to multiply self by
     
     - returns: Fraction The result of multiplying self by f.
     */
    func multiply(f: Fraction) -> Fraction {
        return Fraction(num: self.num*f.num, den: self.den*f.den)
    }
    
    /**
     Divides self by a fraction.
     
     - parameter f: Fraction to divide self by
     
     - returns: Fraction The result of dividing self by f.
     */
    func divide(f: Fraction) -> Fraction {
        return Fraction(num: self.num*f.den, den: self.den*f.num)
    }
    
    /**
     Add a fraction to fraction.
     
     - parameter f1: Fraction to add to
     - parameter f2: Fraction to be added
     
     - returns: The result of f1 + f2.
     */
    private static func add(f1:Fraction, to f2: Fraction) -> Fraction {
        return Fraction(num: f1.num*f2.den + f1.den*f2.num,
                        den: f1.den*f2.den)
    }
    
    /**
     Subtract a fraction from fraction.
     
     - parameter f1: Fraction to subtract
     - parameter f2: Fraction to subtract from
     
     - returns: The result of f2 - f1.
     */
    private static func subtract(f1: Fraction, from f2: Fraction) -> Fraction {
        return f2.subtract(f1);
    }
    
    /**
     Multiply a fraction by fraction.
     
     - parameter f1: Fraction to multiply
     - parameter f2: Fraction to multiply by
     
     - returns: The result of f1*f2.
     */
    private static func multiply(f1: Fraction, by f2: Fraction) -> Fraction {
        return f1.multiply(f2)
    }
    
    /**
     Divide a fraction by fraction.
     
     - parameter f1: Fraction to divide
     - parameter f2: Fraction to divide by
     
     - returns: The result of f1/f2.
     */
    private static func divide(f1: Fraction, by f2: Fraction) -> Fraction {
        return f1.divide(f2)
    }
    
    /**
     Adds an integer to self.
     
     - parameter x: Integer to add to self
     
     - returns: Fraction The result of adding x to self.
     */
    func add(x: Int) -> Fraction {
        return Fraction(num: self.num + self.den*x,
                        den: self.den)
    }
    
    /**
     Subtracts an integer from self.
     
     - parameter x: Integer to subtract from self
     
     - returns: Fraction The result of subtracting x from self.
     */
    func subtract(x: Int) -> Fraction {
        return Fraction(num: self.num - self.den*x,
                        den: self.den)
    }
    
    /**
     Multiplies self by an integer.
     
     - parameter x: Integer to multiply self by
     
     - returns: Fraction The result of multiplying self by x.
     */
    func multiply(x: Int) -> Fraction {
        return Fraction(num: self.num*x, den: self.den)
    }
    
    /**
     Divides self by an integer.
     
     - parameter x: Integer to divide self by
     
     - returns: Fraction The result of dividing self by x.
     */
    func divide(x: Int) -> Fraction {
        return Fraction(num: self.num, den: self.den*x)
    }
    
}

/**
 == between two Fractions
 */
func ==(f1: Fraction, f2: Fraction) -> Bool {
    if((f1.num == f2.num) && (f1.den == f2.den)){
        return true
    } else {
        return false
    }
}

/**
 + operator between two Fractions
 */
func +(f1: Fraction, f2: Fraction) -> Fraction {
    return f1.add(f2)
}

/**
 - operator between two Fractions
 */
func -(f1: Fraction, f2: Fraction) -> Fraction {
    return f1.subtract(f2)
}

/**
 * operator between two Fractions
 */
func *(f1: Fraction, f2: Fraction) -> Fraction {
    return f1.multiply(f2)
}

/**
 / operator between two Fractions
 */

func /(f1: Fraction, f2: Fraction) -> Fraction {
    return f1.divide(f2)
}

/**
 + operator between a Fraction and Int
 */
func +(f1: Fraction, f2: Int) -> Fraction {
    return f1.add(f2)
}

/**
 - operator between a Fraction and Int
 */
func -(f1: Fraction, f2: Int) -> Fraction {
    return f1.subtract(f2)
}

/**
 * operator between a Fraction and Int
 */
func *(f1: Fraction, f2: Int) -> Fraction {
    return f1.multiply(f2)
}

/**
 / operator between a Fraction and Int
 */

func /(f1: Fraction, f2: Int) -> Fraction {
    return f1.divide(f2)
}