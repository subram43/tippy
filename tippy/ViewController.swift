//
//  ViewController.swift
//  tippy
//
//  Created by Aditya Subramaniam on 1/19/20.
//  Copyright © 2020 subram43. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    var tipPercentages: [Double]! = [0.15, 0.18, 0.2]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let defaults = UserDefaults.standard
        
        if (defaults.bool(forKey: "darkMode")) {
            overrideUserInterfaceStyle = .dark
        } else {
            overrideUserInterfaceStyle = .light
        }
        
        let percentage1 = defaults.string(forKey: "percentage1") ?? "15"
        let percentage2 = defaults.string(forKey: "percentage2") ?? "18"
        let percentage3 = defaults.string(forKey: "percentage3") ?? "20"
        let billValue = defaults.double(forKey: "billValue")
        
        tipPercentages[0] = Double(percentage1)! / 100.0;
        tipPercentages[1] = Double(percentage2)! / 100.0;
        tipPercentages[2] = Double(percentage3)! / 100.0;
        
        tipControl.setTitle("\(percentage1)%", forSegmentAt: 0)
        tipControl.setTitle("\(percentage2)%", forSegmentAt: 1)
        tipControl.setTitle("\(percentage3)%", forSegmentAt: 2)
        
        billField.text = String(format: "%.2f", billValue)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Update changes
        let defaults = UserDefaults.standard
        
        if (defaults.bool(forKey: "darkMode")) {
            overrideUserInterfaceStyle = .dark
        } else {
            overrideUserInterfaceStyle = .light
        }
        
        let percentage1 = defaults.string(forKey: "percentage1") ?? "15"
        let percentage2 = defaults.string(forKey: "percentage2") ?? "18"
        let percentage3 = defaults.string(forKey: "percentage3") ?? "20"
        let billValue = defaults.double(forKey: "billValue")
        
        tipPercentages[0] = Double(percentage1)! / 100.0;
        tipPercentages[1] = Double(percentage2)! / 100.0;
        tipPercentages[2] = Double(percentage3)! / 100.0;
        
        tipControl.setTitle("\(percentage1)%", forSegmentAt: 0)
        tipControl.setTitle("\(percentage2)%", forSegmentAt: 1)
        tipControl.setTitle("\(percentage3)%", forSegmentAt: 2)
        
        billField.text = String(format: "%.2f", billValue)
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        // Get the bill amount
        let bill = Double(billField.text!) ?? 0
        
        defaults.set(bill, forKey: "billValue")
        defaults.synchronize()
        
        // Calculate the tip and the total
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
            
        // Update the tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

