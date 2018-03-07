//
//  ViewController.swift
//  ScientificCalculator
//
//  Created by Grant Gaurav on 2/5/18.
//  Copyright © 2018 Grant Gaurav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var sinButton: UIButton!
    @IBOutlet weak var cosButton: UIButton!
    @IBOutlet weak var tanButton: UIButton!
    
    
    var isTypingNumber = false
    var firstNumber:Double = 0
    var secondNumber: Double = 0
    var operation = ""
    var array = ["sin", "sinh", "cos", "cosh", "tan", "tanh", "inf", "nan"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func pressedNumber(_ sender: AnyObject) {
        let number = sender.currentTitle
        if isTypingNumber {
            label.text = label.text! + number!!
        }
        else {
            label.text = number!
            isTypingNumber = true
        }
    }
    
    @IBAction func pressedOperation(_ sender: AnyObject) {
        isTypingNumber = false
        if label.text != "" {
            if(!array.contains(label.text!)) {
                firstNumber = Double(label.text!)!
                operation = sender.currentTitle!!
            }
            else {
                label.text = ""
                operation = ""
            }
        }
        
    }
    
    @IBAction func pressedEqual(_ sender: AnyObject) {
        isTypingNumber = false
        var result: Double = 0
        if(!array.contains(label.text!)) && label.text != ""{
        secondNumber = Double(label.text!)!
        if operation != "" {
        switch operation {
        case "+": result = Double(firstNumber + secondNumber)
        case "-": result = Double(firstNumber - secondNumber)
        case "*": result = Double(firstNumber * secondNumber)
        case "/": result = Double(firstNumber / secondNumber)
        case "sin": result = sin(secondNumber)
        case "sinh": result = asin(secondNumber)
        case "cos": result = cos(secondNumber)
        case "cosh": result = acos(secondNumber)
        case "tan": result = tan(secondNumber)
        case "tanh": result = atan(secondNumber)
        default:
            break
        }
        label.text = String(result)
        }
        else {
            label.text = label.text
        }
        operation = ""
    }
    }
    
    @IBAction func pressedClear (_ sender: AnyObject) {
         isTypingNumber = false
         firstNumber = 0
         secondNumber = 0
         operation = ""
        label.text = ""
    }
   
    @IBAction func pressedSign (_ sender: AnyObject) {
        if label.text != "" {
            if(!array.contains(label.text!)) {
            label.text = String(Double(label.text!)! * -1)
            isTypingNumber = false
            }
            else {
                label.text = ""
                operation = ""
            }
        }
    }
    
    @IBAction func pressedPercentage (_ sender: AnyObject) {
        if label.text != "" {
            if(!array.contains(label.text!)) {
            label.text = String(Double(label.text!)! / 100)
            isTypingNumber = false
            }
            else {
                label.text = ""
                operation = ""
            }
        }
    }
    
    @IBAction func pressedDot (_ sender: AnyObject) {
        if(!array.contains(label.text!)) {
            if label.text?.characters.count == 0 {
            label.text = "0."
            isTypingNumber = true
        }
        else{
            if label.text!.range(of: ".") == nil  {
                label.text = label.text! + "."
            }
          }
        }
    }
    
    @IBAction func  pressedInverse (_ sender: AnyObject) {
        if label.text != "" {
            if(!array.contains(label.text!)) {
            label.text = String(1 / Double(label.text!)!)
            isTypingNumber = false
            }
            else {
                label.text = ""
                operation = ""
            }
        }
    }
    
    @IBAction func pressedTrigonometricOperation (_ sender: AnyObject) {
        operation = sender.currentTitle!!
        label.text = sender.currentTitle
        isTypingNumber = false
    }
    
    @IBAction func inverseTrigonometricOperation (_ sender: AnyObject) {
        if sinButton.currentTitle == "sin" {
            sinButton.setTitle("sinh", for: .normal)
        }
        else {
            sinButton.setTitle("sin", for: .normal)
        }
        if cosButton.currentTitle == "cos" {
            cosButton.setTitle("cosh", for: .normal)
        }
        else {
            cosButton.setTitle("cos", for: .normal)
        }
        if tanButton.currentTitle == "tan" {
            tanButton.setTitle("tanh", for: .normal)
        }
        else {
            tanButton.setTitle("tan", for: .normal)
        }
    }
    
    @IBAction func factorial(_ sender: AnyObject) {
        if label.text != "" {
            var fact = Double(label.text!)!
            var temp: Double = 1
            if(!array.contains(label.text!)) {
            if fact > 171 || fact < -171{
                label.text = "inf"
            }
            else if fact < 0 {
                fact = fact * -1
                temp=ScientificCalculator.factorial(fact)
                }
                label.text = String(temp * -1)
            }
            else {
                temp=ScientificCalculator.factorial(fact)
                  label.text = String(temp)
            }
       }
            isTypingNumber = false
      }
    
}
