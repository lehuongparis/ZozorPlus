//
//  Operator.swift
//  CountOnMe
//
//  Created by AMIMOBILE on 15/10/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//


import Foundation

protocol DisplayAlert: class {
    func viewAlert(message: String)
}

protocol DisplayTextView: class {
    func textView(message: String)
}

protocol DislayTotal: class {
    func viewTotal(message: String)
}

class Operator {

    var displayAlertDelegate: DisplayAlert?
    var displayTextViewDelegate: DisplayTextView?
    var displayTotalDelegate: DislayTotal?
    
    var stringNumbers: [String] = [String()]
    var operators: [String] = ["+"]
    
    var isExpressionCorrect: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                if stringNumbers.count == 1 {
                    displayAlertDelegate?.viewAlert(message: "Démarrez un nouveau calcul !")
                } else {
                    displayAlertDelegate?.viewAlert(message: "Entrez une expression correcte !")
                }
                return false
            }
        }
        return true
    }
    
    var canAddOperator: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                displayAlertDelegate?.viewAlert(message: "Expression incorrecte !")
                return false
            }
        }
        return true
    }
    
    func addNewNumber(_ newNumber: Int) {
        if let stringNumber = stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
            stringNumbers[stringNumbers.count-1] = stringNumberMutable
        }
        updateDisplay()
    }
    
    func calculateTotal() {
        if !isExpressionCorrect {
            return
        }
        var total = 0
        for (i, stringNumber) in stringNumbers.enumerated() {
            if let number = Int(stringNumber) {
                if operators[i] == "+" {
                    total += number
                } else if operators[i] == "-" {
                    total -= number
                }
            }
        }
        let totalString = String(total)
        displayTotalDelegate?.viewTotal(message: totalString)
        clear()
    }
    
    func updateDisplay() {
        var text = ""
        for (i, stringNumber) in stringNumbers.enumerated() {
            // Add operator
            if i > 0 {
                text += operators[i]
            }
            // Add number
            text += stringNumber
        }
            displayTextViewDelegate!.textView(message: text)
    }
    
    func clear() {
        stringNumbers = [String()]
        operators = ["+"]
    }
    
    
    func operatorPlus() {
        if canAddOperator {
            operators.append("+")
            stringNumbers.append("")
            updateDisplay()
        }
    }
    
    func operatorMinus() {
        if canAddOperator {
            operators.append("-")
            stringNumbers.append("")
            updateDisplay()
        }
    }
    
    func operatorEgal() {
        calculateTotal()
    }
    
}
