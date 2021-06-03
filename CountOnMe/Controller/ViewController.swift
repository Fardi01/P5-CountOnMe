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
        // Méthode de l'addition
    }
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        // Méthode de la soustraction
    }
    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
        // Méthode de la miltiplication
    }
    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        // Méthode de la division
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        // Méthode du calcule
    }
    @IBAction func tappedCleanButton(_ sender: UIButton) {
        // Méthode de clear Boutton
    }
    
    
//  let alertVC = UIAlertController(title: "Zéro!",
//  message: "Un operateur est déja mis !", preferredStyle: .alert)
//  alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//  self.present(alertVC, animated: true, completion: nil)

}
