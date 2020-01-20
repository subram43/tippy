//
//  SettingsViewController.swift
//  tippy
//
//  Created by Aditya Subramaniam on 1/19/20.
//  Copyright © 2020 subram43. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var percentage1Field: UITextField!
    @IBOutlet weak var percentage2Field: UITextField!
    @IBOutlet weak var percentage3Field: UITextField!
    @IBOutlet weak var darkmodeSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        percentage1Field.text = defaults.string(forKey: "percentage1") ?? "15"
        percentage2Field.text = defaults.string(forKey: "percentage2") ?? "18"
        percentage3Field.text = defaults.string(forKey: "percentage3") ?? "20"
        
        if defaults.bool(forKey: "darkMode") {
            overrideUserInterfaceStyle = .dark
            darkmodeSwitch.isOn = true
        } else {
            overrideUserInterfaceStyle = .light
            darkmodeSwitch.isOn = false
        }
    }
    
    
    @IBAction func changeDefaultPercentages(_ sender: Any) {
        let defaults = UserDefaults.standard;
        defaults.set(percentage1Field.text, forKey: "percentage1")
        defaults.set(percentage2Field.text, forKey: "percentage2")
        defaults.set(percentage3Field.text, forKey: "percentage3")
        defaults.synchronize()
    }
    
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    @IBAction func darkmodeChanged(_ sender: Any) {
        let defaults = UserDefaults.standard;
        
        if (overrideUserInterfaceStyle == .dark) {
            overrideUserInterfaceStyle = .light
            defaults.set(false, forKey: "darkMode")
        } else {
            overrideUserInterfaceStyle = .dark
            defaults.set(true, forKey: "darkMode")
        }
        
        defaults.synchronize()
    }
}
