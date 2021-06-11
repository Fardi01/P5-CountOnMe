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
        
        // la déclaration permet de donner la gestion du protocol au controller.
        compute.delegate = self
    }
    // MARK: - actions
    
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {return}
        compute.manageNumbers(number: numberText)
    }
    
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        compute.manageAddition()
    }
    
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        compute.manageSubtraction()
    }
    
    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
        compute.manageMultiplication()
    }
    
    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        compute.manageDivision()
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        compute.calculatorResults()
    }
    
    @IBAction func tappedCleanButton(_ sender: UIButton) {
        compute.clearAll()
    }
}

// J'utilise une extension de viewController qui hérite du protocole ComputeDelegate
// Ca va me permettre de faire le pont et échanger les propriété du model avec ceux de la viewController
extension ViewController : ComputeDelegate {
    func replaceText(_ texte: String) {
        textView.text = compute.text
    }
    
    func displayAlert(_ message: String) {
        let alert = UIAlertController(title: "Zero", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
