//
//  RunTests.swift
//  346Assignment1
//
//  Created by Cassidy Mowat on 9/5/16.
//  Copyright © 2016 Patrick Skinner. All rights reserved.
//

import Foundation

public class RunTests {

    private var testsRun: Int
    private var testsPassed: Int
    private var testsFailed: Int
    private var errorMessages: [String]
    
    init(){
        self.testsRun = 0
        self.testsPassed = 0
        self.testsFailed = 0
        self.errorMessages = []
    }
    
    
    /**
     Integer testing for the Matrix class
     */
    func testMatrixInt(){
        let tester: TestMatrixVector = TestMatrixVector<Int>()
        
        if(tester.testInitialiser(5, columns: 5)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Matrix init(rows: Int, columns: Int) test Failed")
        }
        
        var testMatrix: [[Int]] = [[Int]](count: 3, repeatedValue:[Int](count: 3, repeatedValue:Int()))
        
        testMatrix[0][0] = 1
        testMatrix[0][1] = 2
        testMatrix[0][2] = 3
        testMatrix[1][0] = 4
        testMatrix[1][1] = 5
        testMatrix[1][2] = 6
        testMatrix[2][0] = 7
        testMatrix[2][1] = 8
        testMatrix[2][2] = 9
        
        if(tester.testInitialiser(3, columns: 3, matrix: testMatrix)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Matrix init(rows: Int, columns: Int, matrix: [[T]]) test Failed")
        }
        
        /**
            Setup Matricies for testing
          */
        let testMatrixOne = Matrix<Int>(rows: 3, columns: 3, matrix: testMatrix)
        let testMatrixTwo = Matrix<Int>(rows: 3, columns: 3, matrix: testMatrix)
        let testMatrixResult = Matrix<Int>(rows: 3, columns: 3)
        
        
        if(tester.testSubscriptSet(1, y: 1, value: 15, matrix: testMatrixOne)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Int Matrix Subscript set failed")
        }
        
        if(tester.testSubscriptGet(1, y: 1, value: 5, matrix: testMatrixOne)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Int Matrix Subscript get failed")
        }
        
        
        testMatrixResult[0, 0] = 1
        testMatrixResult[0, 1] = 4
        testMatrixResult[0, 2] = 7
        testMatrixResult[1, 0] = 2
        testMatrixResult[1, 1] = 5
        testMatrixResult[1, 2] = 8
        testMatrixResult[2, 0] = 3
        testMatrixResult[2, 1] = 6
        testMatrixResult[2, 2] = 9
        
        if(tester.testTranspose(testMatrixOne, desiredResult: testMatrixResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Int Matrix Transpose test failed")
        }
        
        
        let testMatrixVectorHor = Matrix<Int>(rows: 1, columns: 3)
        let testMatrixVectorVer = Matrix<Int>(rows: 3, columns: 1)
        
        testMatrixVectorHor[0, 0] = 1
        testMatrixVectorHor[0, 1] = 2
        testMatrixVectorHor[0, 2] = 3
        
        testMatrixVectorVer[0, 0] = 1
        testMatrixVectorVer[1, 0] = 2
        testMatrixVectorVer[2, 0] = 3
        
        if(tester.testVectorView(testMatrixVectorHor)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Int Matrix Vector view horizontal failed")
        }
        
        if(tester.testVectorView(testMatrixVectorVer)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Int Matrix VectorView vertical failed")
        }
        
        
        let testVectorRow = Vector<Int>(size: 3)
        let testVectorCol = Vector<Int>(size: 3, isHorizontal: false)
        
        testVectorRow[0] = 1
        testVectorRow[1] = 2
        testVectorRow[2] = 3
        
        testVectorCol[0] = 1
        testVectorCol[1] = 4
        testVectorCol[2] = 7
        
        if(tester.testRow(testMatrixOne, desiredResult: testVectorRow, index: 0)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Int Matrix Row vector failed")
        }
        
        if(tester.testColumn(testMatrixOne, desiredResult: testVectorCol, index: 0)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Int Matrix Column vector failed")
        }
        
        testMatrixTwo[0, 0] = 2
        testMatrixTwo[0, 1] = 2
        testMatrixTwo[0, 2] = 2
        testMatrixTwo[1, 0] = 2
        testMatrixTwo[1, 1] = 2
        testMatrixTwo[1, 2] = 2
        testMatrixTwo[2, 0] = 2
        testMatrixTwo[2, 1] = 2
        testMatrixTwo[2, 2] = 2
        
        testMatrixResult[0, 0] = 3
        testMatrixResult[0, 1] = 4
        testMatrixResult[0, 2] = 5
        testMatrixResult[1, 0] = 6
        testMatrixResult[1, 1] = 7
        testMatrixResult[1, 2] = 8
        testMatrixResult[2, 0] = 9
        testMatrixResult[2, 1] = 10
        testMatrixResult[2, 2] = 11
        
        if(tester.testAddition(testMatrixOne, input2: testMatrixTwo, desiredResult: testMatrixResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Int Matrix addition failed")
        }
        
        if(tester.testScalarAddition(testMatrixOne, input2: 2, desiredResult: testMatrixResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Int Matrix scalar addition failed")
        }
        
        
        testMatrixResult[0, 0] = -1
        testMatrixResult[0, 1] = 0
        testMatrixResult[0, 2] = 1
        testMatrixResult[1, 0] = 2
        testMatrixResult[1, 1] = 3
        testMatrixResult[1, 2] = 4
        testMatrixResult[2, 0] = 5
        testMatrixResult[2, 1] = 6
        testMatrixResult[2, 2] = 7
        
        if(tester.testSubtraction(testMatrixOne, input2: testMatrixTwo, desiredResult: testMatrixResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Int Matrix subtraction failed")
        }
        
        if(tester.testScalarSubtraction(testMatrixOne, input2: 2, desiredResult: testMatrixResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Int Matrix scalar subtraction failed")
        }
        
        
        testMatrixResult[0, 0] = 12
        testMatrixResult[0, 1] = 12
        testMatrixResult[0, 2] = 12
        testMatrixResult[1, 0] = 30
        testMatrixResult[1, 1] = 30
        testMatrixResult[1, 2] = 30
        testMatrixResult[2, 0] = 48
        testMatrixResult[2, 1] = 48
        testMatrixResult[2, 2] = 48
        
        if(tester.testMultiplication(testMatrixOne, input2: testMatrixTwo, desiredResult: testMatrixResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Int Matrix multiplication failed")
        }
        
        
        testMatrixResult[0, 0] = 2
        testMatrixResult[0, 1] = 4
        testMatrixResult[0, 2] = 6
        testMatrixResult[1, 0] = 8
        testMatrixResult[1, 1] = 10
        testMatrixResult[1, 2] = 12
        testMatrixResult[2, 0] = 14
        testMatrixResult[2, 1] = 16
        testMatrixResult[2, 2] = 18
        
        if(tester.testScalarMultiplication(testMatrixOne, input2: 2, desiredResult: testMatrixResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Int Matrix scalar multiplication failed")
        }
        
        
        testMatrixResult[0, 0] = 0
        testMatrixResult[0, 1] = 1
        testMatrixResult[0, 2] = 1
        testMatrixResult[1, 0] = 2
        testMatrixResult[1, 1] = 2
        testMatrixResult[1, 2] = 3
        testMatrixResult[2, 0] = 3
        testMatrixResult[2, 1] = 4
        testMatrixResult[2, 2] = 4
        
        if(tester.testScalarDivision(testMatrixOne, input2: 2, desiredResult: testMatrixResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Int Matrix scalar division failed")
        }
        
        if(tester.testAddresses(testMatrixOne, input2: testMatrixOne.copy())){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Int Matrix deep copyfailed")
        }

    }
    
    /**
        Integer testing for the Vector class
     */
    func testVectorInt(){
        let tester: TestMatrixVector = TestMatrixVector<Int>()
        
        if(tester.testVectorInitialiser(5)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Vector init(size: Int) test Failed")
        }
        
        if(tester.testVectorInitialiser(5, isHorizontal: true)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Vector init(size: Int, isHorizontal: Bool) test Failed")
        }
        
        let testMatrixOne = Matrix<Int>(rows: 1, columns: 3)
        
        if(tester.testVectorInitialiser(3, vector: testMatrixOne)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Vector init(size: Int, vector: Matrix<T>) test Failed")
        }
        
        
        let test2dArray: [[Int]] = [[Int]](count: 1, repeatedValue:[Int](count: 3, repeatedValue:Int()))
        
        if(tester.testVectorInitialiser(3, vector: test2dArray, isHorizontal: true)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Vector init(size: Int, vector: Matrix<T>) test Failed")
        }
        
        /**
         Setup Vectors for testing
         */
        let testVectorOne = Vector<Int>(size: 3)
        let testVectorTwo = Vector<Int>(size: 3)
        let testVectorResult = Vector<Int>(size: 3)
        
        
    }

}