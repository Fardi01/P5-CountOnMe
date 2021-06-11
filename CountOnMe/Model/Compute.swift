//
//  Compute.swift
//  CountOnMe
//
//  Created by fardi Clk on 31/05/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation

// MARK: - Crée un protocole pour connumiquer avec ViewController
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
        return elements.last != "+" && elements.last != "-"
    }
    
    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }
    
    var canAddOperator: Bool {
        return elements.last != "+" && elements.last != "-"
    }
    
    var expressionHaveResult: Bool {
        return text.firstIndex(of: "=") != nil
    }
    
    // MARK: - Protocol Delegate Methods

    private func replaceTextData(texte: String){
        delegate?.replaceText(texte)
    }
    
    private func displayErrorMessage(message: String){
        delegate?.displayAlert(message)
    }
    
    // MARK: - Compute Methods (Gestion des calcules)
    
    // Gestion des boutons 0 à 9
    func manageNumbers(number: String){
        if expressionHaveResult {
            text = ""
        }
        text += number
        replaceTextData(texte: number)
    }
    
    func manageAddition() {
        if expressionHaveResult {
            text = ""
        }
        if canAddOperator {
            text.append(" + ")
        } else {
            displayErrorMessage(message: "Un operateur est déja mis !")
        }
        return replaceTextData(texte: "+")
    }
    
    func manageSubtraction() {
        if expressionHaveResult {
            text = ""
        }
        if canAddOperator {
            text.append(" - ")
        } else {
            displayErrorMessage(message: "Un operateur est déja mis !")
        }
        return replaceTextData(texte: "-")
    }
    
    func manageMultiplication() {
        if expressionHaveResult {
            text = ""
        }
        if canAddOperator {
            text.append(" x ")
        } else {
            displayErrorMessage(message: "Un operateur est déja mis !")
        }
        return replaceTextData(texte: "x")
    }
    
    func manageDivision() {
        if expressionHaveResult {
            text = ""
        }
        if canAddOperator {
            text.append(" ÷ ")
        } else {
            displayErrorMessage(message: "Un operateur est déja mis !")
        }
        return replaceTextData(texte: "÷")
    }
    
    
    func calculatorResults() {
        guard expressionIsCorrect else {
            return displayErrorMessage(message: "Entrez une expression correcte !")
        }
        guard expressionHaveEnoughElement else {
            return displayErrorMessage(message: "Démarrez un nouveau calcul !")
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
    
    //Division method
    func division(left: Double, right: Double) -> Double {
        if right == 0 {
            result = 0.00
            text = "Error"
            displayErrorMessage(message: "Try another calcule")
        } else {
            result = left / right
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
