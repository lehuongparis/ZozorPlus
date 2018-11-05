//
//  Zozor_Tests.swift
//  CountOnMeTests
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import XCTest
@testable import CountOnMe

class OperatorTestCase: XCTestCase {
    var operatorTest: Operator!
    
    override func setUp() {
        super.setUp()
        operatorTest = Operator()
    }
  
    private func addOperator() {
        operatorTest.operatorMultiply()
        operatorTest.operatorDivide()
        operatorTest.operatorPlus()
        operatorTest.operatorMinus()
    }
    
    // Test: isExpressionCorrectstrignNumner not nil et empty
    func testGivenstringNumberLastNotNilAndEmpty_WhenGettingEqual_ThenReturnFalse() {
        operatorTest.stringNumbers = ["8", ""]
        
        operatorTest.calculateTotal()
        
        XCTAssertFalse(operatorTest.isExpressionCorrect)
    }
    
    // Test: stringNumber has 1 member, empty
    func testGivenstringNumber1MemberAndEmpty_WhenGettingEqual_ThenReturnFalse() {
        operatorTest.stringNumbers = [""]
        
        operatorTest.calculateTotal()
        
        XCTAssertFalse(operatorTest.isExpressionCorrect)
    }
    
    // Test: canAddOperator
    func testGivenStringNumberNotNilAndEmpty_WhenGettingOperator_ThenReturnFalse() {
        operatorTest.stringNumbers = [""]
        
        addOperator()
        
        XCTAssertFalse(operatorTest.canAddOperator)
    }
    
    // CanDivide
    func testGivenStringNumber2Is0AndOperators2IsDivide_WhenGettingEqual_ThenReturnFalse() {
        operatorTest.stringNumbers = ["8", "0" ]
        operatorTest.operators = ["+", "/"]
        
        operatorTest.calculateTotal()
        
        XCTAssertFalse(operatorTest.canDivide)

    }
    
    // add number
    func testGivenTextView8_WhenGetting5_ThenTextView85() {
        operatorTest.stringNumbers = ["8"]
        operatorTest.addNewNumber(5)
        
        XCTAssertEqual(operatorTest.stringNumbers, ["85"])
        XCTAssertEqual(operatorTest.operators, ["+"])
    }
  
    // add x
    func testGivenTextView8_WhenGettingMultiply_ThenTextView8Multiply() {
        operatorTest.stringNumbers = ["8"]
        operatorTest.operatorMultiply()
        
        XCTAssertEqual(operatorTest.stringNumbers, ["8", ""])
        XCTAssertEqual(operatorTest.operators, ["+", "x"])
    }
    
    // add /
    func testGivenTextView8_WhenGettingDivide_ThenTextView8Devide() {
        operatorTest.stringNumbers = ["8"]
        operatorTest.operatorDivide()
        
        XCTAssertEqual(operatorTest.stringNumbers, ["8", ""])
        XCTAssertEqual(operatorTest.operators, ["+", "/"])
    }
    
    // add +
    func testGivenTextView8_WhenGettingPlus_ThenTextView8Plus() {
        operatorTest.stringNumbers = ["8"]
        operatorTest.operatorPlus()
        
        XCTAssertEqual(operatorTest.stringNumbers, ["8", ""])
        XCTAssertEqual(operatorTest.operators, ["+", "+"])
    }
    
    // add -
    func testGivenTextView8_WhenGettingMinus_ThenTextView8Minus() {
        operatorTest.stringNumbers = ["8"]
        operatorTest.operatorMinus()
        
        XCTAssertEqual(operatorTest.stringNumbers, ["8", ""])
        XCTAssertEqual(operatorTest.operators, ["+", "-"])
    }
    
    // Calculate Total String
    func testGiven10Divide4_WhenGettingEqual_ThenTotalDouble() {
        operatorTest.stringNumbers = ["10", "4"]
        operatorTest.operators = ["+", "/"]
        
        operatorTest.calculateTotal()
        
        XCTAssertEqual(operatorTest.total, 2.50)
    }
    
    // Calculate Total Int
    func testGiven8Divide4_WhenGettingEqual_ThenTotalInt() {
        operatorTest.stringNumbers = ["8", "4"]
        operatorTest.operators = ["+", "/"]
        
        operatorTest.calculateTotal()
        
        XCTAssertEqual(operatorTest.total, 2)
    }
    
    // Calculate Total
    func testGiven5Plus9Multiply3Divide4Minus_WhenGettingTotal_Then13() {
        operatorTest.stringNumbers = ["5", "9", "3", "2", "4"]
        operatorTest.operators = ["+", "x", "/", "+", "-"]
        
        operatorTest.calculateTotal()
        XCTAssertEqual(operatorTest.total, 13)
    }
    
    // Clear
    func testGivenStringNumbers_WhenGettingClear_ThenEmpty() {
        operatorTest.stringNumbers = ["8", "9", "15", "10", "5"]
        operatorTest.operators = ["+", "*", "/", "+", "-" ]
        operatorTest.total = 309
        
        operatorTest.clear()
        
        XCTAssertEqual(operatorTest.stringNumbers, [String()])
        XCTAssertEqual(operatorTest.operators, ["+"])
        XCTAssertEqual(operatorTest.total, 0.00)
    }
    
    
}









