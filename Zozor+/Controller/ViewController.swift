//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let operators = Operator()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        operators.displayAlertDelegate = self
        operators.displayTextViewDelegate = self
        operators.displayTotalDelegate = self
    }
    
    // MARK: - Outlets
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
   
    // MARK: - Action
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        for (i, numberButton) in numberButtons.enumerated() {
            if sender == numberButton {
               operators.addNewNumber(i)
            }
        }
    }
    
    @IBAction func plus() {
        operators.operatorPlus()
    }

    @IBAction func minus() {
        operators.operatorMinus()
    }

    @IBAction func equal() {
        operators.calculateTotal()
    }
   
}


extension ViewController: DisplayAlert {
    func viewAlert(message: String) {
        let alertController = UIAlertController(title:"Zéro", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

extension ViewController: DisplayTextView {
    func textView(message: String) {
        textView.text = message
    }
   
}

extension ViewController: DislayTotal {
    func viewTotal(message: String) {
        textView.text = textView.text + "=\(message)"
    }
}
