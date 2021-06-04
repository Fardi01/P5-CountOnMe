//
//  Compute.swift
//  CountOnMe
//
//  Created by fardi Clk on 31/05/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//
// ⚠️ Comment utiliser UIAlert ?
// ⚠️ Comment attribuer textView ? (utiliser les protocole : https://openclassrooms.com/fr/courses/4504866-ajoutez-des-listes-dans-vos-applications-ios/5337364-decouvrez-les-protocoles)


import Foundation

// MARK: - Crée un protocole pour connumiquer avec ViewController
protocol ComputeDelegate {
    // Les méthode à adopter dans la viewController pour utiliser UIAlert et textView
    // 1️⃣ La méthode permet de remplacer le textView de la class Compute dans la class ViewController
    func replaceTextView(_ texte: String)
    // 2️⃣ La méthode permet d'afficher les message dans UIAlert au ViewController
    func displayAlert(_ message: String)
}

class Compute {
    
    // MARK: - Propriétés
    
    var delegate: ComputeDelegate?
    var textView = String()
    var elements: [String] {
        return textView.split(separator: " ").map { "\($0)" }
    }
    // Error check computed variables
    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-"
    }
    //
    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }
    //
    var canAddOperator: Bool {
        return elements.last != "+" && elements.last != "-"
    }
    //
    var expressionHaveResult: Bool {
        return textView.firstIndex(of: "=") != nil
    }
    
    // MARK: - Delegate Methods (pour remplacer les donnée dans la viewController)

    private func replaceTextViewInController(texte: String){
        delegate?.replaceTextView(texte)
    }
    
    private func displayAlertInViewController(message: String){
        delegate?.displayAlert(message)
    }
    
    // MARK: - Compute Methods (Gestion des calcules)
    
    // Gestion des boutons 0 à 9
    func numbersTapped(number: String){
        if expressionHaveResult {
            textView = ""
        }
        textView += number
        replaceTextViewInController(texte: number)
    }
    
    func additionTapped() {
        if canAddOperator {
            textView.append(" + ")
        }
        displayAlertInViewController(message: "Un operateur est déja mis !")
    }
    func substractionTapped() {
        if canAddOperator {
            textView.append(" - ")
        }
        displayAlertInViewController(message: "Un operateur est déja mis !")
    }
    
    
    func equalTapped() {
        guard expressionIsCorrect else {
            return displayAlertInViewController(message: "Entrez une expression correcte !")
        }
        guard expressionHaveEnoughElement else {
            return displayAlertInViewController(message: "Démarrez un nouveau calcul !")
        }
        
        // Create local copy of operations
        var operationsToReduce = elements
        
        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {
            let left = Int(operationsToReduce[0])!
            let operand = operationsToReduce[1]
            let right = Int(operationsToReduce[2])!
            let result: Int
            switch operand {
            case "+": result = left + right
            case "-": result = left - right
            default: fatalError("Unknown operator !")
            }
            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            operationsToReduce.insert("\(result)", at: 0)
        }
        textView.append(" = \(operationsToReduce.first!)")
    }
    
}
