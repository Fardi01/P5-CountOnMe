//
//  Compute.swift
//  CountOnMe
//
//  Created by fardi Clk on 31/05/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation

// MARK: - Protocol Delegate

protocol ComputeDelegate {
    
    func replaceText(_ texte: String)

    func displayAlert(_ message: String)
}

class Compute {
    
    // MARK: - Propriétés
    
    var result: Double = 0.00
    
    var delegate: ComputeDelegate?
    
    var text = String()
    
    var elements: [String] {
        return text.split(separator: " ").map { "\($0)" }
    }
    // Error check computed variables
    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "÷"
    }
    
    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }
    
    var canAddOperator: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "÷"
    }
    
    var expressionHaveResult: Bool {
        return text.firstIndex(of: "=") != nil
    }
    
    var haveOperandFirst: Bool {
        return elements.count >= 1
    }
    
    // MARK: - Protocol Delegate Methods

    private func replaceTextData(texte: String){
        delegate?.replaceText(texte)
    }
    
    func displayErrorMessage(message: String){
        delegate?.displayAlert(message)
    }
    
    // MARK: - Compute Methods (Gestion des calcules)
    
    func manageNumbers(number: String){
        if expressionHaveResult {
            text = ""
        }
        text += number
        replaceTextData(texte: number)
    }
    
    func manageAddition() {
        addOperator("+")
    }
    
    func manageSubtraction() {
        addOperator("-")
    }
    
    func manageMultiplication() {
        addOperator("x")
    }
    
    func manageDivision() {
        addOperator("÷")
    }
    
    private func addOperator(_ Operator: String) {
        let setOperator = " " + Operator + " "
        if expressionHaveResult {
            text = ""
        }
        if canAddOperator {
            if haveOperandFirst {
                text += setOperator
            } else {
                displayErrorMessage(message: "Please set a number first")
            }
        } else {
            displayErrorMessage(message: "An operator has already been set !")
        }
        return replaceTextData(texte: Operator)
    }
    
    func calculatorResults() {
        guard expressionIsCorrect else {
            return displayErrorMessage(message: "Please set a correct expression !")
        }
        guard expressionHaveEnoughElement else {
            return displayErrorMessage(message: "Please start a new calcul !")
        }
        
        // Create local copy of operations
        var operationsToReduce = elements
        
        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {
            var priority = 0
            
            if let index = operationsToReduce.firstIndex(where: {$0 == "x" || $0 == "÷"}) {
                priority = index - 1
            }
            
            guard let left = Double(operationsToReduce[priority])else { return }
            let operand = operationsToReduce[priority + 1]
            guard let right = Double(operationsToReduce[priority + 2]) else { return }
            
            switch operand {
            case "+": result = left + right
            case "-": result = left - right
            case "x": result = left * right
            case "÷": result = division(left: left, right: right)
            default: displayErrorMessage(message: "Unknown operator !")
                return
            }
            for _ in 1...3 {
                operationsToReduce.remove(at: priority)
            }
            operationsToReduce.insert("\(result)", at: priority)
        }
        if text != "Error" {
            text.append(" = \(operationsToReduce.first!)")
            replaceTextData(texte: text)
        }
        replaceTextData(texte: text)
    }
    
    //Division method to avoid getting an infinite result and getting results rounded to four figures after point
    func division(left: Double, right: Double) -> Double {
        if right == 0 {
            result = 0.00
            text = "Error"
            displayErrorMessage(message: "Try another calcule")
        } else {
            result = left / right
            result = round(result * 10000) / 10000
        }
        return result
    }
    
    // Button reset
    func clearAll() {
        if text != "" {
            text = ""
        } else {
            displayErrorMessage(message: "Already remove")
        }
        return replaceTextData(texte: text)
    }
    
}
