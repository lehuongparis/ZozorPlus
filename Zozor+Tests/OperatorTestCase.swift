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
 
    // Test 1: add number
    func testGivenTextView8_WhenGetting5_ThenTextView85() {
        operatorTest.stringNumbers = ["8"]
        operatorTest.addNewNumber(5)
        
        XCTAssertEqual(operatorTest.stringNumbers, ["85"])
    }
  
    // Test 2: add +
    func testGivenTextView8_WhenGettingPlus_ThenTextView8Plus() {
        operatorTest.stringNumbers = ["8"]
        operatorTest.operatorPlus()
        
        XCTAssertEqual(operatorTest.stringNumbers, ["8", ""])
        XCTAssertEqual(operatorTest.operators, ["+", "+"])
    }
    
    // Test 3: add -
    func testGivenTextView8_WhenGettingMinus_ThenTextView8Minus() {
        operatorTest.stringNumbers = ["8"]
        operatorTest.operatorMinus()
        
        XCTAssertEqual(operatorTest.stringNumbers, ["8", ""])
        XCTAssertEqual(operatorTest.operators, ["+", "-"])
    }
    
    // Test 4: Calculate Total
    func testGivenPlus8Moins5_WhenGettingTotal_Then3() {
        operatorTest.stringNumbers = ["8", "5"]
        operatorTest.operators = ["+", "-"]
        
        operatorTest.calculateTotal()
        XCTAssertEqual(operatorTest.total, 3)
    }
}









