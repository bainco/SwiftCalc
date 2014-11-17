//
//  ViewController.swift
//  Calculator
//
//  Created by Trevor W. Hutto, Connor Bain and Andrew Freix on 10/30/14.
//  Copyright (c) 2014 trevorhutto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculatorDisplay: UILabel!
    
    @IBOutlet weak var buttonView: UIView!
    
    private var operatorPressed:Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorDisplay.textAlignment = .Right
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        self.operatorPressed = false
        var number = sender.currentTitle
        
        calculatorDisplay.text =
            calculatorDisplay.text! + number!!
    }
    
    @IBAction func operatorPressed(sender: AnyObject) {
        // Check to make sure we don't have two operators.
        if(self.operatorPressed == false) {
            self.operatorPressed = true
            var operatorPressed = sender.currentTitle
            calculatorDisplay.text =
                calculatorDisplay.text! + " " + operatorPressed!! + " "
        }
    }
    @IBAction func clearPressed(sender: AnyObject) {
        self.operatorPressed = false
        calculatorDisplay.text = ""
    }
    
    @IBAction func calcPressed(sender: AnyObject) {
        self.operatorPressed = false
        
        // Intialize local variables.
        var firstArg = true;
        
        var stack: [String] = []
        
        var answer:Int = 0;
        
        var eqn = calculatorDisplay.text!
        var length = countElements(eqn)
        
        var firstOp:String = ""
        var readChar:String = ""
        var readString:String = ""
        
        for var i = 0; i < length; i++ {
            
            readChar = String(Array(eqn)[i]);
            
            if (readChar == "+" || readChar == "-" || readChar == "*") {
                
                stack.append(readString)
                stack.append(readChar)
                readString = ""
            }
                
            else if(i == (length - 1)) {
                readString += readChar;
                stack.append(readString);
            }
            else {
                readString += readChar;
            }
            readString = readString.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet());
        }
        
        // We don't want to end with an operator.
        if (stack[stack.count - 1] == "+" ||
            stack[stack.count - 1] == "-" ||
            stack[stack.count - 1] == "*") {
                stack.removeLast()
        }
        
        // Start the evaluation
        
        // Multiplication first.
        var i = 0;
        while (i < stack.count){
            if(stack[i] == "*"){
                
                // Replace the multiplication with the answer.
                stack[i - 1] = String(stack[i - 1].toInt()! * stack[i + 1].toInt()!)
                i--
                
                // Already evaluated.
                stack.removeAtIndex(i+2)
                stack.removeAtIndex(i+1)
            }
            i++
        }
        
        // Finish it with addition and subtraction.
        i = 0;
        while (stack.count != 1) {
            
            if(stack[1] == "+"){
                stack[0] = String(stack[0].toInt()! + stack[2].toInt()!)
            }
            else if(stack[1] == "-"){
                stack[0] = String(stack[0].toInt()! - stack[2].toInt()!)
            }
            
            // Already evaluated.
            stack.removeAtIndex(2);
            stack.removeAtIndex(1);
        }

        // The answer is now the first element.
        answer = stack[0].toInt()!
        
        // Output it to the display.
        calculatorDisplay.text = String(answer);
    }
}
