//
//  ViewController.swift
//  Tippy
//
//  Created by Christina Chen on 9/3/18.
//  Copyright © 2018 Christie Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DataPassBackDelegate {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var langLabel: UILabel!
    @IBOutlet weak var splitAmount: UILabel!
    @IBOutlet weak var percentControl: UISegmentedControl!
    @IBOutlet weak var addMinusControl: UIStepper!
    @IBOutlet weak var pricePerPersonLabel: UILabel!
    @IBOutlet weak var transformedAmount: UILabel!
    
    
    
    var globalTotal = 0.0
    
    func userDidEnterInformation(info:String) {
        langLabel.text = info
        print("Global Total")
        print(globalTotal)
        if info == "Chinese RMB" {
            transformedAmount.text = String(format : "$%.2f", globalTotal * 6)
        } else if info == "Taiwan New Dollar" {
            transformedAmount.text = String(format : "$%.2f", globalTotal * 30)
        } else if info == "Japanese Yuan" {
            transformedAmount.text = String(format : "$%.2f", globalTotal * 120)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectLang" {
            let selectLang:SettingViewController = segue.destination as! SettingViewController
            selectLang.delegate = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func OnTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    @IBAction func CalculateTip(_ sender: AnyObject) {
        let tipPercent = [0.18, 0.2, 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercent[percentControl.selectedSegmentIndex]
        let total = bill + tip
        globalTotal = total
        tipLabel.text = String(format : "$%.2f", tip)
        totalLabel.text = String(format : "$%.2f", total)
        
    }
    @IBAction func splitTip(_ sender: Any) {
        let pax = addMinusControl.value
        splitAmount.text = String(Int(pax))
        let total = totalLabel.text!
        let index1 = total.index(total.startIndex, offsetBy: 1)
        let price = Double(total.substring(from: index1))
        
        let pricePerPerson = price! / pax
        
        pricePerPersonLabel.text = String(format: "Each person pays $%.2f", pricePerPerson)
    }
    
}

