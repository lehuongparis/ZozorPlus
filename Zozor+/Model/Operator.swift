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
    var total: Double = 0.00
    
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

    var canDivide: Bool {
        for (i, stringNumber) in stringNumbers.enumerated() {
            if stringNumber == "0" && operators[i] == "/" {
                displayAlertDelegate?.viewAlert(message: "Erreur: Divisé par zéro")
                return false
            }
        }
        return true
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
        displayTextViewDelegate?.textView(message: text)
    }
    
    func addNewNumber(_ newNumber: Int) {
        if let stringNumber = stringNumbers.last {
                var stringNumberMutable = stringNumber
                stringNumberMutable += "\(newNumber)"
                stringNumbers[stringNumbers.count-1] = stringNumberMutable
        }
        updateDisplay()
    }
    
    private func multiplyDivideFirst() {
        let multiplyDivide = ["x", "/"]
        var result: Double = 0
        var i = 0
        
        while i < stringNumbers.count - 1 {
            if var numberOne = Double(stringNumbers[i]) {
                while multiplyDivide.contains(operators[i+1]) {
                    if let numberTwo = Double(stringNumbers[i+1]) {
                        if operators[i+1] == "x" {
                            result = numberOne * numberTwo
                        } else if operators[i+1] == "/" {
                            result = numberOne / numberTwo
                        }
                        stringNumbers[i] = String(result)
                        numberOne = result
                        stringNumbers.remove(at: i+1)
                        operators.remove(at: i+1)
                        if i == stringNumbers.count - 1 { return }
                    }
                }
                i += 1
            }
        }
    }

    func calculateTotal() {
        if !isExpressionCorrect || !canDivide {
            return
        }
        multiplyDivideFirst()
        for (i, stringNumber) in stringNumbers.enumerated() {
            if let number = Double(stringNumber) {
                if operators[i] == "+" {
                    total += number
                } else if operators[i] == "-" {
                    total -= number
                }
            }
        }
        if total.truncatingRemainder(dividingBy: 1) == 0 {
            let totalIntergerString = String(Int(total))
            displayTotalDelegate?.viewTotal(message: totalIntergerString)
        } else {
            let totalDoubleString = String(total)
            displayTotalDelegate?.viewTotal(message: totalDoubleString)
        }
    }
    
    func clear() {
        stringNumbers = [String()]
        operators = ["+"]
        total = 0
    }
    
    func operatorMultiply() {
        if canAddOperator {
            operators.append("x")
            stringNumbers.append("")
            updateDisplay()
        }
    }
    
    func operatorDivide() {
        if canAddOperator {
            operators.append("/")
            stringNumbers.append("")
            updateDisplay()
        }
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
}
