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
    
// MARK: - Tests Simple Calcul
    
    // Tests the diplay of numbers
    func testGivenNumbers_WhenAddNumbers_ThenViewDisplayNumbers(){
        compute.manageNumbers(number: "0")
        compute.manageNumbers(number: "1")
        compute.manageNumbers(number: "2")
        compute.manageNumbers(number: "3")
        compute.manageNumbers(number: "4")
        compute.manageNumbers(number: "5")
        compute.manageNumbers(number: "6")
        compute.manageNumbers(number: "7")
        compute.manageNumbers(number: "8")
        compute.manageNumbers(number: "9")
        
        XCTAssertTrue(compute.text == "0123456789")
    }
    
    // tests the result of addition between two numbers
    func testGivenAddition_WhenWeCalculateOnePlusTwo_ThenResultIsEqualToThree() {
        compute.manageNumbers(number: "1")
        compute.manageAddition()
        compute.manageNumbers(number: "2")
        compute.calculatorResults()
        
        XCTAssertTrue(compute.result == 3)
    }
    
    // tests the result of substraction between two numbers
    func testGivenSubtraction_WhenWeCalculateTenMinusFive_ThenResultIsEqualToFive() {
        compute.manageNumbers(number: "10")
        compute.manageSubtraction()
        compute.manageNumbers(number: "5")
        compute.calculatorResults()
        
        XCTAssertTrue(compute.result == 5)
    }
    
    // tests the result of substraction between two numbers result negatif
    func testGivenSubtraction_WhenWeCalculateFiveMinusTen_ThenResultIsEqualToMinusFive() {
        compute.manageNumbers(number: "5")
        compute.manageSubtraction()
        compute.manageNumbers(number: "10")
        compute.calculatorResults()
        
        XCTAssertTrue(compute.result == -5)
    }
    
    // tests the result of multiplication between two numbers
    func testGivenMultiplication_WhenWeCalculateFourMultiplyByTwo_ThenResultIsEqualToEight() {
        compute.manageNumbers(number: "4")
        compute.manageMultiplication()
        compute.manageNumbers(number: "2")
        compute.calculatorResults()
        
        XCTAssertTrue(compute.result == 8)
    }
    
    // tests the result of division between two numbers
    func testGivenDivision_WhenWeCalculateSixDividedByTwo_ThenResultIsEqualToThree() {
        compute.manageNumbers(number: "6")
        compute.manageDivision()
        compute.manageNumbers(number: "2")
        compute.calculatorResults()
        
        XCTAssertTrue(compute.result == 3)
    }
    
    // MARK: - Test Calcule with Two Operators
    
    // Adition + Addition
    func testGivenAddition_WhenCalculateOnePlusTwoPlusThree_ThenResultatIsEqualToSix() {
        compute.manageNumbers(number: "1")
        compute.manageAddition()
        compute.manageNumbers(number: "2")
        compute.manageAddition()
        compute.manageNumbers(number: "3")
        compute.calculatorResults()
        
        XCTAssertTrue(compute.result == 6)
        
    }
    
    // Substraction + Substraction
    func testGivenSubtraction_WhenCalculateTenMinusTwoMinusThree_ThenResultIsEqualToFive() {
        compute.manageNumbers(number: "10")
        compute.manageSubtraction()
        compute.manageNumbers(number: "2")
        compute.manageSubtraction()
        compute.manageNumbers(number: "3")
        compute.calculatorResults()
        
        XCTAssertTrue(compute.result == 5)
    }
    
    // Substraction + Substraction Result Negatif
    func testGivenSubtraction_WhenCalculateNineMinusSixMinusFive_ThenResultIsEqualToMinusTwo() {
        compute.manageNumbers(number: "9")
        compute.manageSubtraction()
        compute.manageNumbers(number: "6")
        compute.manageSubtraction()
        compute.manageNumbers(number: "5")
        compute.calculatorResults()
        
        XCTAssertTrue(compute.result == -2)
    }
    
    // Multiplication + Multiplication
    func testGivenMultiplication_WhenCalculateTwoMultiplyBySevenMultiplyByTwo_ThenResultIsEqualToTwentyEight() {
        compute.manageNumbers(number: "2")
        compute.manageMultiplication()
        compute.manageNumbers(number: "7")
        compute.manageMultiplication()
        compute.manageNumbers(number: "2")
        compute.calculatorResults()
        
        XCTAssertTrue(compute.result == 28)
    }
    
    // Division + Division
    func testGivenDivision_WhenCalculateSixtyDividedByThreeDividedByTwo_ThenResultIsEqualToTen(){
        compute.manageNumbers(number: "60")
        compute.manageDivision()
        compute.manageNumbers(number: "3")
        compute.manageDivision()
        compute.manageNumbers(number: "2")
        compute.calculatorResults()
        
        XCTAssertTrue(compute.result == 10)
    }
    
    // MARK: - Tests Priority Calcul (Multiplication and Division)
    
    // Priority between Addition and multiplication
    func testGivenAdition_WhenCalculateThreePlusFiveMultiplyByTwo_ThenResultIsEqualToThirteen() {
        compute.manageNumbers(number: "3")
        compute.manageAddition()
        compute.manageNumbers(number: "5")
        compute.manageMultiplication()
        compute.manageNumbers(number: "2")
        compute.calculatorResults()
        
        XCTAssertTrue(compute.result == 13)
    }
    
    // Priority between Addition and Division
    func testGivenAddition_WhenCalculateThreePlusFiveDividedByTwo_ThenResultIsEqualToFivePointFive() {
        compute.manageNumbers(number: "3")
        compute.manageAddition()
        compute.manageNumbers(number: "5")
        compute.manageDivision()
        compute.manageNumbers(number: "2")
        compute.calculatorResults()
        
        XCTAssertTrue(compute.result == 5.5)
    }
    
    // Priority between Subtraction and Multiplication
    func testGivenSubtraction_WhenCalculateSeventyMinusTweentyMultiplyByTwo_ThenResultIsEqualToThirty() {
        compute.manageNumbers(number: "70")
        compute.manageSubtraction()
        compute.manageNumbers(number: "20")
        compute.manageMultiplication()
        compute.manageNumbers(number: "2")
        compute.calculatorResults()
        
        XCTAssertTrue(compute.result == 30)
    }
 
    
    // Priority Between Subtraction and Multiplication Result Negatif
    func testGivenSubtraction_WhenCalculateFiveMinusNineMultiplyByTwo_ThenResultIsEqualToMinusThirteen() {
        compute.manageNumbers(number: "5")
        compute.manageSubtraction()
        compute.manageNumbers(number: "9")
        compute.manageMultiplication()
        compute.manageNumbers(number: "2")
        compute.calculatorResults()
        
        XCTAssertTrue(compute.result == -13)
    }
    
    // Priority between Subtraction and Division
    func testGivenSubtraction_WhenCalculateTwentyFiveMinusTwelveDividedBySix_thenResultIsEqualToTwentyThree() {
        compute.manageNumbers(number: "25")
        compute.manageSubtraction()
        compute.manageNumbers(number: "12")
        compute.manageDivision()
        compute.manageNumbers(number: "6")
        compute.calculatorResults()
        
        XCTAssertTrue(compute.result == 23)
    }
    
    // Priority between Subtraction and Division Result negative
    func testGivenSubtraction_WhenCalculateFiveMinusEightDividedByOne_ThenResultIsEqualToMinusThree() {
        compute.manageNumbers(number: "5")
        compute.manageSubtraction()
        compute.manageNumbers(number: "8")
        compute.manageDivision()
        compute.manageNumbers(number: "1")
        compute.calculatorResults()
        
        XCTAssertTrue(compute.result == -3)
    }
    
    // Priority between Division and Multiplication
    func testGivenDivision_WhenCalculateThirtyFiveDividedByFiveMultiplyByFour_ThenResultIsEqualToTwentyEight() {
        compute.manageNumbers(number: "35")
        compute.manageDivision()
        compute.manageNumbers(number: "5")
        compute.manageMultiplication()
        compute.manageNumbers(number: "4")
        compute.calculatorResults()
        
        XCTAssertTrue(compute.result == 28)
    }
    
    // Priority between all Combinaisons
    func testGivenOperand_WhenCombinateAllOperands_ThenPriorityIsMultiplication(){
        compute.manageNumbers(number: "10")
        compute.manageAddition()
        compute.manageNumbers(number: "3")
        compute.manageSubtraction()
        compute.manageNumbers(number: "2")
        compute.manageMultiplication()
        compute.manageNumbers(number: "4")
        compute.manageDivision()
        compute.manageNumbers(number: "2")
        compute.calculatorResults()
        
        XCTAssertTrue(compute.result == 9)
    }
    
    // MARK: - Tests Other Functions
    
    // tests that CA button reset calcule to Zero
    func testGivenClearAll_WhenWeResetCalcule_ThenClearTextViewAndStartNewCalcule() {
        compute.clearAll()
        
        XCTAssertEqual(compute.result == 0.0, compute.text == "")
    }
    
    // Test that clearAll bouton deletes all
    func testGivenClearAll_WhenWeDeletesTextView_ThenTextViewIsEmpty() {
        compute.manageNumbers(number: "250")
        compute.clearAll()
        
        XCTAssertTrue(compute.text == "")
    }
    
    // teste Divion methode (Result is a double)
    func testGivenDivision_WhenDividingTwoPointFiveByTwo_ThenResultIsEqualToOnePointTwentyFive() {
        compute.result = compute.division(left: 2.5, right: 2)
        XCTAssertTrue(compute.result == 1.25)
    }
    
    // Test rounding at 4 Figures
    func testGivenDivision_WhenDividingTwoByThree_ThenResultIsRoundingAtZeroAndFourFiguresAfterDot() {
        compute.manageNumbers(number: "2")
        compute.manageDivision()
        compute.manageNumbers(number: "3")
        compute.calculatorResults()
        
        XCTAssert(compute.result == 0.6667)
    }
    
    
    // MARK: - Tests Alerts Messages
    
    // Test if two operators are added successively
    func testGivenNewAlert_WhenAddingTwoOperatorsSuccessively_ThenDisplayAlertErrorMessage() {
        compute.manageNumbers(number: "2")
        compute.manageAddition()
        compute.manageMultiplication()
        
        XCTAssertEqual(compute.result == 0.00, compute.displayErrorMessage(message: "An operator has already been set !") == compute.displayErrorMessage(message: "An operator has already been set !"))
    }
    
    // Test if an operator are added before numbers
    func testGivenNewAlert_WhenOperatorAddedBeforeNumber_ThenDisplayAlertErrorMessage() {
        compute.manageAddition()
        compute.manageNumbers(number: "21")
        
        XCTAssertEqual(compute.result == 0.00, compute.displayErrorMessage(message: "Please set a number first") == compute.displayErrorMessage(message: "Please set a number first"))
    }
    
    // Test if an operator is present before the result is calculated
    func testGivenNewAlert_WhenAnOperatorIsBeforeCalculateResult_ThenDisplayAlertErrorMessage() {
        compute.manageNumbers(number: "2")
        compute.manageAddition()
        compute.manageNumbers(number: "2")
        compute.manageSubtraction()
        compute.calculatorResults()
        
        XCTAssertEqual(compute.result == 0.00, compute.displayErrorMessage(message: "Please set a correct expression !") == compute.displayErrorMessage(message: "Please set a correct expression !"))
    }
    
    // Test if calculator result is triggered before calculation between two numbers
    func testGivenNewAlert_WhenEqualIsTappedBeforeCalculation_ThenDisplayAlertErrorMessage() {
        compute.calculatorResults()
        
        XCTAssertEqual(compute.result == 0.00, compute.displayErrorMessage(message: "Please start a new calcul !") == compute.displayErrorMessage(message: "Please start a new calcul !"))
    }
    
    // Test if the ClearAll Button is pressed twice
    func testGivenNewAlert_WhenClearAllIsTappedTwiceSuccessively_ThenDisplayAlertErrorMessage() {
        compute.clearAll()
        compute.clearAll()
        
        XCTAssertEqual(compute.result == 0.00, compute.displayErrorMessage(message: "Already remove") == compute.displayErrorMessage(message: "Already remove"))
    }
    
    // Test if dividing by Zero print error in text view
    func testeGivenNewAlert_WhenDividingAnyNumberByZero_ThenPrintErrorInTextView() {
        compute.manageNumbers(number: "60")
        compute.manageDivision()
        compute.manageNumbers(number: "0")
        compute.calculatorResults()
        
        XCTAssertEqual(compute.result == 0.00, compute.text == "Error")
    }
    
    // Test if dividing any number by Zero Display alert
    func testeGivenNewAlert_WhenDividingAnyNumberByZero_ThenDisplayAlertErrorMessage() {
        compute.manageNumbers(number: "10")
        compute.manageDivision()
        compute.manageNumbers(number: "0")
        compute.calculatorResults()
        
        XCTAssertEqual(compute.result == 0.00, compute.displayErrorMessage(message: "Try another calcule") == compute.displayErrorMessage(message: "Try another calcule"))
    }
    
}
