//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Outlets
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    // MARK: - Propriétés
    var compute = Compute()
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - actions
    
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {return}
        compute.numbersTapped(number: numberText)
        
    }
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        compute.additionTapped()
        alertPopUp()
        // Méthode de l'addition
        // Mettre la fonction pour les alertes
    }
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        compute.substractionTapped()
        alertPopUp()
        // Méthode de la soustraction
        // Mettre la fonction pour les alertes
    }
    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
        // Méthode de la miltiplication
        // Mettre la fonction pour les alertes
    }
    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        // Méthode de la division
        // Mettre la fonction pour les alertes
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        compute.equalTapped()
        alertPopUp()
        // Méthode du calcule
        // Mettre la fonction pour les alertes
    }
    @IBAction func tappedCleanButton(_ sender: UIButton) {
        // Méthode de clear Boutton
        // Mettre la fonction pour les alertes
    }
    
    func alertPopUp(){
        let alert = UIAlertController(title: "Zero", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

// J'utilise une extension de viewController qui hérite du protocole ComputeDelegate
// Ca va me permettre d'avoir les propriété pour afficher mes messages d'alertes et remplacer le message de textView
extension ViewController : ComputeDelegate {
    func replaceTextView(_ texte: String) {
        // Je remplace le texteView de compute par le textView du controller
        textView.text = compute.textView
    }
    
    func displayAlert(_ message: String) {
        //
    }
    
    
}
