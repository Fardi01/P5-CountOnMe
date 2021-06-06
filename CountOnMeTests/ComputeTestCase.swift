//
//  ComputeTestCase.swift
//  CountOnMeTests
//
//  Created by fardi Clk on 01/06/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class ComputeTestCase: XCTestCase {
    var compute: Compute!
    
    override func setUp() {
        super.setUp()
        compute = Compute()
    }
    
// MARK: - Tests Compute Class
    
    // Check compute class
    func testGivenInstanceOfCompute_WhenAccessingIt_ThenItExist() {
        let compute = Compute()
        XCTAssertNotNil(compute)
    }
    
    // tests the result of addition between two numbers
    func testGivenResultIsNil_WhenOperatorIsPlus_ThenGetCorrectResult(){
        compute.numbersTapped(number: "1")
        compute.additionTapped()
        compute.numbersTapped(number: "2")
        compute.equalTapped()
        
        XCTAssert(compute.result == 3)
    }
    
    // tests the result of substraction between two numbers
    func testGivenResultIsNil_WhenOperatorIsMinus_ThenGetCorrectResult(){
        compute.numbersTapped(number: "10")
        compute.substractionTapped()
        compute.numbersTapped(number: "5")
        compute.equalTapped()
        
        XCTAssert(compute.result == 5)
    }
    
    // tests the result of multiplication between two numbers
    
    
    // tests the result of division between two numbers
    
    
    // tests that CA button reset calcule to Zero
}
