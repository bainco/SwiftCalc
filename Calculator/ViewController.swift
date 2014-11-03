//
//  ViewController.swift
//  Calculator
//
//  Created by Trevor W. Hutto on 10/30/14.
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
        var stack: [String] = []
        
        var answer:Int = 0;
        
        var eqn = calculatorDisplay.text!
        var length = countElements(eqn)
        
        var firstArg = true;
        
        var firstOp = ""
        var readChar = ""
        var readString = "";
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
        
        if (stack[stack.count - 1] == "+" ||
            stack[stack.count - 1] == "-" ||
            stack[stack.count - 1] == "*") {
                stack.removeLast()
        }
        
        var i = 0;
        while (stack.count != 1) {
            
            if(stack[1] == "+"){
                stack[0] = String(stack[0].toInt()! + stack[2].toInt()!)
            }
            else if(stack[1] == "-"){
                stack[0] = String(stack[0].toInt()! - stack[2].toInt()!)
            }
            else if(stack[1] == "*"){
                stack[0] = String(stack[0].toInt()! * stack[2].toInt()!)
            }
            stack.removeAtIndex(2);
            stack.removeAtIndex(1);
        }

        answer = stack[0].toInt()!
        calculatorDisplay.text = String(answer);
    }
}
