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
    
    private var operatorPressed:String!
    private var argument1:Int!
    private var argument2:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.calculatorDisplay.textAlignment = .Right
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        var number = sender.currentTitle
        
        self.calculatorDisplay.text =
            self.calculatorDisplay.text! + number!!
    }
    
    @IBAction func operatorPressed(sender: AnyObject) {
        self.operatorPressed = sender.currentTitle
        self.argument1 = calculatorDisplay.text!.toInt()
        self.calculatorDisplay.text = ""
    }
    
    @IBAction func clearPressed(sender: AnyObject) {
        self.calculatorDisplay.text = ""
        self.operatorPressed = ""
        self.argument1 = 0
        self.argument2 = 0
    }
    
    @IBAction func calcPressed(sender: AnyObject) {
        self.argument2 = calculatorDisplay.text!.toInt()
        
        switch self.operatorPressed {
            case "+":
                self.calculatorDisplay.text = "\(self.argument1 + self.argument2)"
            case "-":
                self.calculatorDisplay.text = "\(self.argument1 - self.argument2)"
            case "*":
                self.calculatorDisplay.text = "\(self.argument1 * self.argument2)"
        default:
            self.calculatorDisplay.text = "Error"
        }
    }
}
