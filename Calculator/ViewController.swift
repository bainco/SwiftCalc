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
        // EVALUTE STUB
        
        calculatorDisplay.text = "this should be the answer!"
    }
}

