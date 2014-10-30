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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorDisplay.textAlignment = .Right
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func numberPressed(sender: AnyObject) {
        var number = sender.currentTitle
        calculatorDisplay.text = calculatorDisplay.text! + number!!
    }
}

