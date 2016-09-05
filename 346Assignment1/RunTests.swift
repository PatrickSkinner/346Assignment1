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
        
        // Setup Matricies for testing
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
     Double testing for the Matrix class
     */
    func testMatrixDouble(){
        let tester: TestMatrixVector = TestMatrixVector<Double>()
        
        if(tester.testInitialiser(5, columns: 5)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Matrix init(rows: Int, columns: Int) test Failed")
        }
        
        var testMatrix: [[Double]] = [[Double]](count: 3, repeatedValue:[Double](count: 3, repeatedValue:Double()))
        
        testMatrix[0][0] = 1.0
        testMatrix[0][1] = 2.0
        testMatrix[0][2] = 3.0
        testMatrix[1][0] = 4.0
        testMatrix[1][1] = 5.0
        testMatrix[1][2] = 6.0
        testMatrix[2][0] = 7.0
        testMatrix[2][1] = 8.0
        testMatrix[2][2] = 9.0
        
        if(tester.testInitialiser(3, columns: 3, matrix: testMatrix)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Matrix init(rows: Int, columns: Int, matrix: [[T]]) test Failed")
        }
        
        // Setup Matricies for testing
        let testMatrixOne = Matrix<Double>(rows: 3, columns: 3, matrix: testMatrix)
        let testMatrixTwo = Matrix<Double>(rows: 3, columns: 3, matrix: testMatrix)
        let testMatrixResult = Matrix<Double>(rows: 3, columns: 3)
        
        
        if(tester.testSubscriptSet(1, y: 1, value: 15.0, matrix: testMatrixOne)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Double Matrix Subscript set failed")
        }
        
        if(tester.testSubscriptGet(1, y: 1, value: 5.0, matrix: testMatrixOne)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Double Matrix Subscript get failed")
        }
        
        
        testMatrixResult[0, 0] = 1.0
        testMatrixResult[0, 1] = 4.0
        testMatrixResult[0, 2] = 7.0
        testMatrixResult[1, 0] = 2.0
        testMatrixResult[1, 1] = 5.0
        testMatrixResult[1, 2] = 8.0
        testMatrixResult[2, 0] = 3.0
        testMatrixResult[2, 1] = 6.0
        testMatrixResult[2, 2] = 9.0
        
        if(tester.testTranspose(testMatrixOne, desiredResult: testMatrixResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Double Matrix Transpose test failed")
        }
        
        
        let testMatrixVectorHor = Matrix<Double>(rows: 1, columns: 3)
        let testMatrixVectorVer = Matrix<Double>(rows: 3, columns: 1)
        
        testMatrixVectorHor[0, 0] = 1.0
        testMatrixVectorHor[0, 1] = 2.0
        testMatrixVectorHor[0, 2] = 3.0
        
        testMatrixVectorVer[0, 0] = 1.0
        testMatrixVectorVer[1, 0] = 2.0
        testMatrixVectorVer[2, 0] = 3.0
        
        if(tester.testVectorView(testMatrixVectorHor)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Double Matrix Vector view horizontal failed")
        }
        
        if(tester.testVectorView(testMatrixVectorVer)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Double Matrix VectorView vertical failed")
        }
        
        
        let testVectorRow = Vector<Double>(size: 3)
        let testVectorCol = Vector<Double>(size: 3, isHorizontal: false)
        
        testVectorRow[0] = 1.0
        testVectorRow[1] = 2.0
        testVectorRow[2] = 3.0
        
        testVectorCol[0] = 1.0
        testVectorCol[1] = 4.0
        testVectorCol[2] = 7.0
        
        if(tester.testRow(testMatrixOne, desiredResult: testVectorRow, index: 0)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Double Matrix Row vector failed")
        }
        
        if(tester.testColumn(testMatrixOne, desiredResult: testVectorCol, index: 0)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Double Matrix Column vector failed")
        }
        
        testMatrixTwo[0, 0] = 2.0
        testMatrixTwo[0, 1] = 2.0
        testMatrixTwo[0, 2] = 2.0
        testMatrixTwo[1, 0] = 2.0
        testMatrixTwo[1, 1] = 2.0
        testMatrixTwo[1, 2] = 2.0
        testMatrixTwo[2, 0] = 2.0
        testMatrixTwo[2, 1] = 2.0
        testMatrixTwo[2, 2] = 2.0
        
        testMatrixResult[0, 0] = 3.0
        testMatrixResult[0, 1] = 4.0
        testMatrixResult[0, 2] = 5.0
        testMatrixResult[1, 0] = 6.0
        testMatrixResult[1, 1] = 7.0
        testMatrixResult[1, 2] = 8.0
        testMatrixResult[2, 0] = 9.0
        testMatrixResult[2, 1] = 10.0
        testMatrixResult[2, 2] = 11.0
        
        if(tester.testAddition(testMatrixOne, input2: testMatrixTwo, desiredResult: testMatrixResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Double Matrix addition failed")
        }
        
        if(tester.testScalarAddition(testMatrixOne, input2: 2.0, desiredResult: testMatrixResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Double Matrix scalar addition failed")
        }
        
        
        testMatrixResult[0, 0] = -1.0
        testMatrixResult[0, 1] = 0.0
        testMatrixResult[0, 2] = 1.0
        testMatrixResult[1, 0] = 2.0
        testMatrixResult[1, 1] = 3.0
        testMatrixResult[1, 2] = 4.0
        testMatrixResult[2, 0] = 5.0
        testMatrixResult[2, 1] = 6.0
        testMatrixResult[2, 2] = 7.0
        
        if(tester.testSubtraction(testMatrixOne, input2: testMatrixTwo, desiredResult: testMatrixResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Double Matrix subtraction failed")
        }
        
        if(tester.testScalarSubtraction(testMatrixOne, input2: 2.0, desiredResult: testMatrixResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Double Matrix scalar subtraction failed")
        }
        
        
        testMatrixResult[0, 0] = 12.0
        testMatrixResult[0, 1] = 12.0
        testMatrixResult[0, 2] = 12.0
        testMatrixResult[1, 0] = 30.0
        testMatrixResult[1, 1] = 30.0
        testMatrixResult[1, 2] = 30.0
        testMatrixResult[2, 0] = 48.0
        testMatrixResult[2, 1] = 48.0
        testMatrixResult[2, 2] = 48.0
        
        if(tester.testMultiplication(testMatrixOne, input2: testMatrixTwo, desiredResult: testMatrixResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Double Matrix multiplication failed")
        }
        
        
        testMatrixResult[0, 0] = 2.0
        testMatrixResult[0, 1] = 4.0
        testMatrixResult[0, 2] = 6.0
        testMatrixResult[1, 0] = 8.0
        testMatrixResult[1, 1] = 10.0
        testMatrixResult[1, 2] = 12.0
        testMatrixResult[2, 0] = 14.0
        testMatrixResult[2, 1] = 16.0
        testMatrixResult[2, 2] = 18.0
        
        if(tester.testScalarMultiplication(testMatrixOne, input2: 2, desiredResult: testMatrixResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Double Matrix scalar multiplication failed")
        }
        
        
        testMatrixResult[0, 0] = 0.5
        testMatrixResult[0, 1] = 1
        testMatrixResult[0, 2] = 1.5
        testMatrixResult[1, 0] = 2
        testMatrixResult[1, 1] = 2.5
        testMatrixResult[1, 2] = 3
        testMatrixResult[2, 0] = 3.5
        testMatrixResult[2, 1] = 4
        testMatrixResult[2, 2] = 4.5
        
        if(tester.testScalarDivision(testMatrixOne, input2: 2.0, desiredResult: testMatrixResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Double Matrix scalar division failed")
        }
        
        if(tester.testAddresses(testMatrixOne, input2: testMatrixOne.copy())){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Double Matrix deep copyfailed")
        }
        
    }
    
    /**
     Float testing for the Matrix class
     */
    func testMatrixFloat(){
        let tester: TestMatrixVector = TestMatrixVector<Float>()
        
        if(tester.testInitialiser(5, columns: 5)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Matrix init(rows: Int, columns: Int) test Failed")
        }
        
        var testMatrix: [[Float]] = [[Float]](count: 3, repeatedValue:[Float](count: 3, repeatedValue:Float()))
        
        testMatrix[0][0] = 1.0
        testMatrix[0][1] = 2.0
        testMatrix[0][2] = 3.0
        testMatrix[1][0] = 4.0
        testMatrix[1][1] = 5.0
        testMatrix[1][2] = 6.0
        testMatrix[2][0] = 7.0
        testMatrix[2][1] = 8.0
        testMatrix[2][2] = 9.0
        
        if(tester.testInitialiser(3, columns: 3, matrix: testMatrix)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Matrix init(rows: Int, columns: Int, matrix: [[T]]) test Failed")
        }
        
        // Setup Matricies for testing
        let testMatrixOne = Matrix<Float>(rows: 3, columns: 3, matrix: testMatrix)
        let testMatrixTwo = Matrix<Float>(rows: 3, columns: 3, matrix: testMatrix)
        let testMatrixResult = Matrix<Float>(rows: 3, columns: 3)
        
        
        if(tester.testSubscriptSet(1, y: 1, value: 15.0, matrix: testMatrixOne)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Float Matrix Subscript set failed")
        }
        
        if(tester.testSubscriptGet(1, y: 1, value: 5.0, matrix: testMatrixOne)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Float Matrix Subscript get failed")
        }
        
        
        testMatrixResult[0, 0] = 1.0
        testMatrixResult[0, 1] = 4.0
        testMatrixResult[0, 2] = 7.0
        testMatrixResult[1, 0] = 2.0
        testMatrixResult[1, 1] = 5.0
        testMatrixResult[1, 2] = 8.0
        testMatrixResult[2, 0] = 3.0
        testMatrixResult[2, 1] = 6.0
        testMatrixResult[2, 2] = 9.0
        
        if(tester.testTranspose(testMatrixOne, desiredResult: testMatrixResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Float Matrix Transpose test failed")
        }
        
        
        let testMatrixVectorHor = Matrix<Float>(rows: 1, columns: 3)
        let testMatrixVectorVer = Matrix<Float>(rows: 3, columns: 1)
        
        testMatrixVectorHor[0, 0] = 1.0
        testMatrixVectorHor[0, 1] = 2.0
        testMatrixVectorHor[0, 2] = 3.0
        
        testMatrixVectorVer[0, 0] = 1.0
        testMatrixVectorVer[1, 0] = 2.0
        testMatrixVectorVer[2, 0] = 3.0
        
        if(tester.testVectorView(testMatrixVectorHor)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Float Matrix Vector view horizontal failed")
        }
        
        if(tester.testVectorView(testMatrixVectorVer)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Float Matrix VectorView vertical failed")
        }
        
        
        let testVectorRow = Vector<Float>(size: 3)
        let testVectorCol = Vector<Float>(size: 3, isHorizontal: false)
        
        testVectorRow[0] = 1.0
        testVectorRow[1] = 2.0
        testVectorRow[2] = 3.0
        
        testVectorCol[0] = 1.0
        testVectorCol[1] = 4.0
        testVectorCol[2] = 7.0
        
        if(tester.testRow(testMatrixOne, desiredResult: testVectorRow, index: 0)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Float Matrix Row vector failed")
        }
        
        if(tester.testColumn(testMatrixOne, desiredResult: testVectorCol, index: 0)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Float Matrix Column vector failed")
        }
        
        testMatrixTwo[0, 0] = 2.0
        testMatrixTwo[0, 1] = 2.0
        testMatrixTwo[0, 2] = 2.0
        testMatrixTwo[1, 0] = 2.0
        testMatrixTwo[1, 1] = 2.0
        testMatrixTwo[1, 2] = 2.0
        testMatrixTwo[2, 0] = 2.0
        testMatrixTwo[2, 1] = 2.0
        testMatrixTwo[2, 2] = 2.0
        
        testMatrixResult[0, 0] = 3.0
        testMatrixResult[0, 1] = 4.0
        testMatrixResult[0, 2] = 5.0
        testMatrixResult[1, 0] = 6.0
        testMatrixResult[1, 1] = 7.0
        testMatrixResult[1, 2] = 8.0
        testMatrixResult[2, 0] = 9.0
        testMatrixResult[2, 1] = 10.0
        testMatrixResult[2, 2] = 11.0
        
        if(tester.testAddition(testMatrixOne, input2: testMatrixTwo, desiredResult: testMatrixResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Float Matrix addition failed")
        }
        
        if(tester.testScalarAddition(testMatrixOne, input2: 2.0, desiredResult: testMatrixResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Float Matrix scalar addition failed")
        }
        
        
        testMatrixResult[0, 0] = -1.0
        testMatrixResult[0, 1] = 0.0
        testMatrixResult[0, 2] = 1.0
        testMatrixResult[1, 0] = 2.0
        testMatrixResult[1, 1] = 3.0
        testMatrixResult[1, 2] = 4.0
        testMatrixResult[2, 0] = 5.0
        testMatrixResult[2, 1] = 6.0
        testMatrixResult[2, 2] = 7.0
        
        if(tester.testSubtraction(testMatrixOne, input2: testMatrixTwo, desiredResult: testMatrixResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Float Matrix subtraction failed")
        }
        
        if(tester.testScalarSubtraction(testMatrixOne, input2: 2.0, desiredResult: testMatrixResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Float Matrix scalar subtraction failed")
        }
        
        
        testMatrixResult[0, 0] = 12.0
        testMatrixResult[0, 1] = 12.0
        testMatrixResult[0, 2] = 12.0
        testMatrixResult[1, 0] = 30.0
        testMatrixResult[1, 1] = 30.0
        testMatrixResult[1, 2] = 30.0
        testMatrixResult[2, 0] = 48.0
        testMatrixResult[2, 1] = 48.0
        testMatrixResult[2, 2] = 48.0
        
        if(tester.testMultiplication(testMatrixOne, input2: testMatrixTwo, desiredResult: testMatrixResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Float Matrix multiplication failed")
        }
        
        
        testMatrixResult[0, 0] = 2.0
        testMatrixResult[0, 1] = 4.0
        testMatrixResult[0, 2] = 6.0
        testMatrixResult[1, 0] = 8.0
        testMatrixResult[1, 1] = 10.0
        testMatrixResult[1, 2] = 12.0
        testMatrixResult[2, 0] = 14.0
        testMatrixResult[2, 1] = 16.0
        testMatrixResult[2, 2] = 18.0
        
        if(tester.testScalarMultiplication(testMatrixOne, input2: 2, desiredResult: testMatrixResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Float Matrix scalar multiplication failed")
        }
        
        
        testMatrixResult[0, 0] = 0.5
        testMatrixResult[0, 1] = 1
        testMatrixResult[0, 2] = 1.5
        testMatrixResult[1, 0] = 2
        testMatrixResult[1, 1] = 2.5
        testMatrixResult[1, 2] = 3
        testMatrixResult[2, 0] = 3.5
        testMatrixResult[2, 1] = 4
        testMatrixResult[2, 2] = 4.5
        
        if(tester.testScalarDivision(testMatrixOne, input2: 2.0, desiredResult: testMatrixResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Float Matrix scalar division failed")
        }
        
        if(tester.testAddresses(testMatrixOne, input2: testMatrixOne.copy())){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Float Matrix deep copyfailed")
        }
        
    }
    
    /**
     Fraction testing for the Matrix class
     */
    func testMatrixFraction(){
        let tester: TestMatrixVector = TestMatrixVector<Fraction>()
        
        if(tester.testInitialiser(5, columns: 5)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Matrix init(rows: Int, columns: Int) test Failed")
        }
        
        var testMatrix: [[Fraction]] = [[Fraction]](count: 3, repeatedValue:[Fraction](count: 3, repeatedValue:Fraction()))
        
        testMatrix[0][0] = Fraction(num: 1, den: 1)
        testMatrix[0][1] = Fraction(num: 4, den: 2)
        testMatrix[0][2] = Fraction(num: 9, den: 3)
        testMatrix[1][0] = Fraction(num: 16, den: 4)
        testMatrix[1][1] = Fraction(num: 25, den: 5)
        testMatrix[1][2] = Fraction(num: 36, den: 6)
        testMatrix[2][0] = Fraction(num: 49, den: 7)
        testMatrix[2][1] = Fraction(num: 64, den: 8)
        testMatrix[2][2] = Fraction(num: 81, den: 9)
        
        if(tester.testInitialiser(3, columns: 3, matrix: testMatrix)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Matrix init(rows: Int, columns: Int, matrix: [[T]]) test Failed")
        }
        
        // Setup Matricies for testing
        let testMatrixOne = Matrix<Fraction>(rows: 3, columns: 3, matrix: testMatrix)
        let testMatrixTwo = Matrix<Fraction>(rows: 3, columns: 3, matrix: testMatrix)
        let testMatrixResult = Matrix<Fraction>(rows: 3, columns: 3)
        
        
        if(tester.testSubscriptSet(1, y: 1, value: Fraction(num: 10, den: 5), matrix: testMatrixOne)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Fraction Matrix Subscript set failed")
        }
        
        if(tester.testSubscriptGet(1, y: 1, value: Fraction(num: 25, den: 5), matrix: testMatrixOne)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Fraction Matrix Subscript get failed")
        }
        
        
        testMatrixResult[0, 0] = Fraction(num: 1, den: 1)
        testMatrixResult[0, 1] = Fraction(num: 16, den: 4)
        testMatrixResult[0, 2] = Fraction(num: 49, den: 7)
        testMatrixResult[1, 0] = Fraction(num: 4, den: 2)
        testMatrixResult[1, 1] = Fraction(num: 25, den: 5)
        testMatrixResult[1, 2] = Fraction(num: 64, den: 8)
        testMatrixResult[2, 0] = Fraction(num: 9, den: 3)
        testMatrixResult[2, 1] = Fraction(num: 36, den: 6)
        testMatrixResult[2, 2] = Fraction(num: 81, den: 9)
        
        if(tester.testTranspose(testMatrixOne, desiredResult: testMatrixResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Fraction Matrix Transpose test failed")
        }
        
        
        let testMatrixVectorHor = Matrix<Fraction>(rows: 1, columns: 3)
        let testMatrixVectorVer = Matrix<Fraction>(rows: 3, columns: 1)
        
        testMatrixVectorHor[0, 0] = Fraction(num: 1, den: 1)
        testMatrixVectorHor[0, 1] = Fraction(num: 4, den: 2)
        testMatrixVectorHor[0, 2] = Fraction(num: 9, den: 3)
        
        testMatrixVectorVer[0, 0] = Fraction(num: 1, den: 1)
        testMatrixVectorVer[1, 0] = Fraction(num: 4, den: 2)
        testMatrixVectorVer[2, 0] = Fraction(num: 9, den: 3)
        
        if(tester.testVectorView(testMatrixVectorHor)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Fraction Matrix Vector view horizontal failed")
        }
        
        if(tester.testVectorView(testMatrixVectorVer)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Fraction Matrix VectorView vertical failed")
        }
        
        
        let testVectorRow = Vector<Fraction>(size: 3)
        let testVectorCol = Vector<Fraction>(size: 3, isHorizontal: false)
        
        testVectorRow[0] = Fraction(num: 1, den: 1)
        testVectorRow[1] = Fraction(num: 4, den: 2)
        testVectorRow[2] = Fraction(num: 9, den: 3)
        
        testVectorCol[0] = Fraction(num: 1, den: 1)
        testVectorCol[1] = Fraction(num: 16, den: 4)
        testVectorCol[2] = Fraction(num: 49, den: 7)
        
        if(tester.testRow(testMatrixOne, desiredResult: testVectorRow, index: 0)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Fraction Matrix Row vector failed")
        }
        
        if(tester.testColumn(testMatrixOne, desiredResult: testVectorCol, index: 0)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Fraction Matrix Column vector failed")
        }
        
        testMatrixTwo[0, 0] = Fraction(num: 4, den: 2)
        testMatrixTwo[0, 1] = Fraction(num: 4, den: 2)
        testMatrixTwo[0, 2] = Fraction(num: 4, den: 2)
        testMatrixTwo[1, 0] = Fraction(num: 4, den: 2)
        testMatrixTwo[1, 1] = Fraction(num: 4, den: 2)
        testMatrixTwo[1, 2] = Fraction(num: 4, den: 2)
        testMatrixTwo[2, 0] = Fraction(num: 4, den: 2)
        testMatrixTwo[2, 1] = Fraction(num: 4, den: 2)
        testMatrixTwo[2, 2] = Fraction(num: 4, den: 2)
        
        testMatrixResult[0, 0] = Fraction(num: 9, den: 3)
        testMatrixResult[0, 1] = Fraction(num: 16, den: 4)
        testMatrixResult[0, 2] = Fraction(num: 25, den: 5)
        testMatrixResult[1, 0] = Fraction(num: 36, den: 6)
        testMatrixResult[1, 1] = Fraction(num: 49, den: 7)
        testMatrixResult[1, 2] = Fraction(num: 64, den: 8)
        testMatrixResult[2, 0] = Fraction(num: 81, den: 9)
        testMatrixResult[2, 1] = Fraction(num: 100, den: 10)
        testMatrixResult[2, 2] = Fraction(num: 121, den: 11)
        
        if(tester.testAddition(testMatrixOne, input2: testMatrixTwo, desiredResult: testMatrixResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Fraction Matrix addition failed")
        }
        
        if(tester.testScalarAddition(testMatrixOne, input2: Fraction(num: 4, den: 2), desiredResult: testMatrixResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Fraction Matrix scalar addition failed")
        }
        
        testMatrixTwo[0, 0] = Fraction(num: 1, den: 1)
        
        testMatrixResult[0, 0] = Fraction(num: 0, den: 1)
        testMatrixResult[0, 1] = Fraction(num: 0, den: 1)
        testMatrixResult[0, 2] = Fraction(num: 1, den: 1)
        testMatrixResult[1, 0] = Fraction(num: 4, den: 2)
        testMatrixResult[1, 1] = Fraction(num: 9, den: 3)
        testMatrixResult[1, 2] = Fraction(num: 16, den: 4)
        testMatrixResult[2, 0] = Fraction(num: 25, den: 5)
        testMatrixResult[2, 1] = Fraction(num: 36, den: 6)
        testMatrixResult[2, 2] = Fraction(num: 49, den: 7)
        
        if(tester.testSubtraction(testMatrixOne, input2: testMatrixTwo, desiredResult: testMatrixResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Fraction Matrix subtraction failed")
        }
        
        testMatrixOne[0, 0] = Fraction(num: 4, den: 2)
        
        if(tester.testScalarSubtraction(testMatrixOne, input2: Fraction(num: 4, den: 2), desiredResult: testMatrixResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Fraction Matrix scalar subtraction failed")
        }
        
        testMatrixOne[0, 0] = Fraction(num: 1, den: 1)
        testMatrixTwo[0, 0] = Fraction(num: 4, den: 2)
        
        
        testMatrixResult[0, 0] = Fraction(num: 12, den: 1)
        testMatrixResult[0, 1] = Fraction(num: 12, den: 1)
        testMatrixResult[0, 2] = Fraction(num: 12, den: 1)
        testMatrixResult[1, 0] = Fraction(num: 30, den: 1)
        testMatrixResult[1, 1] = Fraction(num: 30, den: 1)
        testMatrixResult[1, 2] = Fraction(num: 30, den: 1)
        testMatrixResult[2, 0] = Fraction(num: 48, den: 1)
        testMatrixResult[2, 1] = Fraction(num: 48, den: 1)
        testMatrixResult[2, 2] = Fraction(num: 48, den: 1)
        
        
        
        if(tester.testMultiplication(testMatrixOne, input2: testMatrixTwo, desiredResult: testMatrixResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Fraction Matrix multiplication failed")
        }
        
        
        testMatrixResult[0, 0] = Fraction(num: 4, den: 2)
        testMatrixResult[0, 1] = Fraction(num: 16, den: 4)
        testMatrixResult[0, 2] = Fraction(num: 36, den: 6)
        testMatrixResult[1, 0] = Fraction(num: 64, den: 8)
        testMatrixResult[1, 1] = Fraction(num: 100, den: 10)
        testMatrixResult[1, 2] = Fraction(num: 144, den: 12)
        testMatrixResult[2, 0] = Fraction(num: 196, den: 14)
        testMatrixResult[2, 1] = Fraction(num: 256, den: 16)
        testMatrixResult[2, 2] = Fraction(num: 324, den: 18)
        
        if(tester.testScalarMultiplication(testMatrixOne, input2: Fraction(num: 4, den: 2), desiredResult: testMatrixResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Fraction Matrix scalar multiplication failed")
        }
        
        
        testMatrixResult[0, 0] = Fraction(num: 1, den: 2)
        testMatrixResult[0, 1] = Fraction(num: 1, den: 1)
        testMatrixResult[0, 2] = Fraction(num: 3, den: 2)
        testMatrixResult[1, 0] = Fraction(num: 4, den: 2)
        testMatrixResult[1, 1] = Fraction(num: 5, den: 2)
        testMatrixResult[1, 2] = Fraction(num: 9, den: 3)
        testMatrixResult[2, 0] = Fraction(num: 7, den: 2)
        testMatrixResult[2, 1] = Fraction(num: 16, den: 4)
        testMatrixResult[2, 2] = Fraction(num: 9, den: 2)
        
        if(tester.testScalarDivision(testMatrixOne, input2: Fraction(num: 4, den: 2), desiredResult: testMatrixResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Fraction Matrix scalar division failed")
        }
        
        if(tester.testAddresses(testMatrixOne, input2: testMatrixOne.copy())){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Fraction Matrix deep copyfailed")
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
        
        testVectorOne[0] = 1
        testVectorOne[1] = 2
        testVectorOne[2] = 3
        
        testVectorTwo[0] = 4
        testVectorTwo[1] = 5
        testVectorTwo[2] = 6
        
        
        if(tester.testVectorSubscriptSet(testVectorOne, index: 1, value: 5)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Int Vector Subscript Set test Failed")
        }
        
        if(tester.testVectorSubscriptGet(testVectorOne, index: 1, value: 2)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Int Vector Subscript Get test Failed")
        }
        
        
        if(tester.testMatrixView(testVectorOne)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Int Vector Matrix View test Failed")
        }
        
        
        if(tester.testVectorDot(testVectorOne, input2: testVectorTwo, desiredOutput: 32)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Int Vector Dot product test Failed")
        }
        
        if(tester.testVectorMultiplication(testVectorOne, input2: testVectorTwo, desiredOutput: 32)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Int Vector multiplication test Failed")
        }
        
        
        testVectorResult[0] = 5
        testVectorResult[1] = 7
        testVectorResult[2] = 9
        
        if(tester.testVectorAddition(testVectorOne, input2: testVectorTwo, desiredOutput: testVectorResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Int Vector addition test Failed")
        }
        
        
        testVectorResult[0] = -3
        testVectorResult[1] = -3
        testVectorResult[2] = -3
        
        if(tester.testVectorSubtraction(testVectorOne, input2: testVectorTwo, desiredOutput: testVectorResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Int Vector subtraction test Failed")
        }
        
        
        testVectorResult[0] = 3
        testVectorResult[1] = 4
        testVectorResult[2] = 5
        
        if(tester.testVectorScalarAddition(testVectorOne, input2: 2, desiredOutput: testVectorResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Int Vector scalar addition test Failed")
        }
        
        testVectorResult[0] = -1
        testVectorResult[1] = 0
        testVectorResult[2] = 1
        
        if(tester.testVectorScalarSubtraction(testVectorOne, input2: 2, desiredOutput: testVectorResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Int Vector scalar subtraction test Failed")
        }
        
        testVectorResult[0] = 2
        testVectorResult[1] = 4
        testVectorResult[2] = 6
        
        if(tester.testVectorScalarMultiplication(testVectorOne, input2: 2, desiredOutput: testVectorResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Int Vector scalar multiplication test Failed")
        }
        
        testVectorResult[0] = 0
        testVectorResult[1] = 1
        testVectorResult[2] = 1
        
        if(tester.testVectorScalarDivision(testVectorOne, input2: 2, desiredOutput: testVectorResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Int Vector scalar division test Failed")
        }
        
    }
    
    /**
     Double testing for the Vector class
     */
    func testVectorDouble(){
        let tester: TestMatrixVector = TestMatrixVector<Double>()
        
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
        
        let testMatrixOne = Matrix<Double>(rows: 1, columns: 3)
        
        if(tester.testVectorInitialiser(3, vector: testMatrixOne)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Vector init(size: Int, vector: Matrix<T>) test Failed")
        }
        
        
        let test2dArray: [[Double]] = [[Double]](count: 1, repeatedValue:[Double](count: 3, repeatedValue:Double()))
        
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
        let testVectorOne = Vector<Double>(size: 3)
        let testVectorTwo = Vector<Double>(size: 3)
        let testVectorResult = Vector<Double>(size: 3)
        
        testVectorOne[0] = 1.0
        testVectorOne[1] = 2.0
        testVectorOne[2] = 3.0
        
        testVectorTwo[0] = 4.0
        testVectorTwo[1] = 5.0
        testVectorTwo[2] = 6.0
        
        
        if(tester.testVectorSubscriptSet(testVectorOne, index: 1, value: 5.0)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Double Vector Subscript Set test Failed")
        }
        
        if(tester.testVectorSubscriptGet(testVectorOne, index: 1, value: 2.0)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Double Vector Subscript Get test Failed")
        }
        
        
        if(tester.testMatrixView(testVectorOne)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Double Vector Matrix View test Failed")
        }
        
        
        if(tester.testVectorDot(testVectorOne, input2: testVectorTwo, desiredOutput: 32.0)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Double Vector Dot product test Failed")
        }
        
        if(tester.testVectorMultiplication(testVectorOne, input2: testVectorTwo, desiredOutput: 32.0)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Double Vector multiplication test Failed")
        }
        
        
        testVectorResult[0] = 5.0
        testVectorResult[1] = 7.0
        testVectorResult[2] = 9.0
        
        if(tester.testVectorAddition(testVectorOne, input2: testVectorTwo, desiredOutput: testVectorResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Double Vector addition test Failed")
        }
        
        
        testVectorResult[0] = -3.0
        testVectorResult[1] = -3.0
        testVectorResult[2] = -3.0
        
        if(tester.testVectorSubtraction(testVectorOne, input2: testVectorTwo, desiredOutput: testVectorResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Double Vector subtraction test Failed")
        }
        
        
        testVectorResult[0] = 3.0
        testVectorResult[1] = 4.0
        testVectorResult[2] = 5.0
        
        if(tester.testVectorScalarAddition(testVectorOne, input2: 2.0, desiredOutput: testVectorResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Double Vector scalar addition test Failed")
        }
        
        testVectorResult[0] = -1.0
        testVectorResult[1] = 0.0
        testVectorResult[2] = 1.0
        
        if(tester.testVectorScalarSubtraction(testVectorOne, input2: 2.0, desiredOutput: testVectorResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Double Vector scalar subtraction test Failed")
        }
        
        testVectorResult[0] = 2.0
        testVectorResult[1] = 4.0
        testVectorResult[2] = 6.0
        
        if(tester.testVectorScalarMultiplication(testVectorOne, input2: 2.0, desiredOutput: testVectorResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Double Vector scalar multiplication test Failed")
        }
        
        testVectorResult[0] = 0.5
        testVectorResult[1] = 1
        testVectorResult[2] = 1.5
        
        if(tester.testVectorScalarDivision(testVectorOne, input2: 2.0, desiredOutput: testVectorResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Double Vector scalar division test Failed")
        }
        
    }
    
    /**
     Float testing for the Vector class
     */
    func testVectorFloat(){
        let tester: TestMatrixVector = TestMatrixVector<Float>()
        
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
        
        let testMatrixOne = Matrix<Float>(rows: 1, columns: 3)
        
        if(tester.testVectorInitialiser(3, vector: testMatrixOne)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Vector init(size: Int, vector: Matrix<T>) test Failed")
        }
        
        
        let test2dArray: [[Float]] = [[Float]](count: 1, repeatedValue:[Float](count: 3, repeatedValue:Float()))
        
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
        let testVectorOne = Vector<Float>(size: 3)
        let testVectorTwo = Vector<Float>(size: 3)
        let testVectorResult = Vector<Float>(size: 3)
        
        testVectorOne[0] = 1.0
        testVectorOne[1] = 2.0
        testVectorOne[2] = 3.0
        
        testVectorTwo[0] = 4.0
        testVectorTwo[1] = 5.0
        testVectorTwo[2] = 6.0
        
        
        if(tester.testVectorSubscriptSet(testVectorOne, index: 1, value: 5.0)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Float Vector Subscript Set test Failed")
        }
        
        if(tester.testVectorSubscriptGet(testVectorOne, index: 1, value: 2.0)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Float Vector Subscript Get test Failed")
        }
        
        
        if(tester.testMatrixView(testVectorOne)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Float Vector Matrix View test Failed")
        }
        
        
        if(tester.testVectorDot(testVectorOne, input2: testVectorTwo, desiredOutput: 32.0)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Float Vector Dot product test Failed")
        }
        
        if(tester.testVectorMultiplication(testVectorOne, input2: testVectorTwo, desiredOutput: 32.0)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Float Vector multiplication test Failed")
        }
        
        
        testVectorResult[0] = 5.0
        testVectorResult[1] = 7.0
        testVectorResult[2] = 9.0
        
        if(tester.testVectorAddition(testVectorOne, input2: testVectorTwo, desiredOutput: testVectorResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Float Vector addition test Failed")
        }
        
        
        testVectorResult[0] = -3.0
        testVectorResult[1] = -3.0
        testVectorResult[2] = -3.0
        
        if(tester.testVectorSubtraction(testVectorOne, input2: testVectorTwo, desiredOutput: testVectorResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Float Vector subtraction test Failed")
        }
        
        
        testVectorResult[0] = 3.0
        testVectorResult[1] = 4.0
        testVectorResult[2] = 5.0
        
        if(tester.testVectorScalarAddition(testVectorOne, input2: 2.0, desiredOutput: testVectorResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Float Vector scalar addition test Failed")
        }
        
        testVectorResult[0] = -1.0
        testVectorResult[1] = 0.0
        testVectorResult[2] = 1.0
        
        if(tester.testVectorScalarSubtraction(testVectorOne, input2: 2.0, desiredOutput: testVectorResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Float Vector scalar subtraction test Failed")
        }
        
        testVectorResult[0] = 2.0
        testVectorResult[1] = 4.0
        testVectorResult[2] = 6.0
        
        if(tester.testVectorScalarMultiplication(testVectorOne, input2: 2.0, desiredOutput: testVectorResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Float Vector scalar multiplication test Failed")
        }
        
        testVectorResult[0] = 0.5
        testVectorResult[1] = 1
        testVectorResult[2] = 1.5
        
        if(tester.testVectorScalarDivision(testVectorOne, input2: 2.0, desiredOutput: testVectorResult)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Float Vector scalar division test Failed")
        }
        
    }
    
    func testEdgeCases(){
        let tester: TestMatrixVector = TestMatrixVector<Int>()
        
        if(tester.testInitialiser(10000, columns: 10000)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Failed to create large matrix")
        }
        
        if(tester.testSubscriptGet(9999, y: 9999, value: 0, matrix: Matrix(rows: 10000, columns: 10000))){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Large Matrix Subscript get failed")
        }
        
        if(tester.testVectorView(Matrix(rows: 10000, columns: 10000))){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Large Matrix vector view  failed")
        }
        
        if(tester.testInitialiser(10000, columns: 1)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Failed to create 10000x1 matrix")
        }
        
        if(tester.testInitialiser(1, columns: 10000)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Failed to create 1x10000 matrix")
        }
        
        if(tester.testRow(Matrix(rows: 10000, columns: 10000), desiredResult: Vector(size: 10000), index: 0)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Large Matrix vector row failed")
        }
        
        if(tester.testColumn(Matrix(rows: 10000, columns: 10000), desiredResult: Vector(size: 10000), index: 0)){
            self.testsRun += 1
            self.testsPassed += 1
        } else {
            self.testsRun += 1
            self.testsFailed += 1
            self.errorMessages.append("Large Matrix vector column failed")
        }
    }
    
    
    
    
    func getResults(){
        print("Testing Matrix with Integers")
        testMatrixInt()
        print("Testing Vector with Integers")
        testVectorInt()
        print("Testing Matrix with Doubles")
        testMatrixDouble()
        print("Testing Vector with Doubles")
        testVectorDouble()
        print("Testing Matrix with Float")
        testMatrixFloat()
        print("Testing Vector with Float")
        testVectorFloat()
        print("Testing Matrix with Fraction")
        testMatrixFraction()
        
        print("Testing Edge Cases")
        testEdgeCases()
        
        print()
        print("Tests Run: \(self.testsRun)")
        print("Tests Passed: \(self.testsPassed) / \(self.testsRun)")
        print("Tests failed: \(self.testsFailed) / \(self.testsRun)")
        print()
        for message in self.errorMessages{
            print(message)
        }
    }

}