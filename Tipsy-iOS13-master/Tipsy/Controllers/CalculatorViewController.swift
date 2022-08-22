//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    var tipPct: Float = 0.1
    var splitNum: Int = 2
    var splitTotal: Float = 0.00

    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        switch sender.titleLabel!.text {
        case "0%":
            zeroPctButton.isSelected = true
            tipPct = 0.0
        case "10%":
            tenPctButton.isSelected = true
            tipPct = 0.1
        default:
            twentyPctButton.isSelected = true
            tipPct = 0.2
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNum = Int(sender.value)
        splitNumberLabel.text = String(splitNum)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billTotal = Float(billTextField.text!) ?? 0
        let total = billTotal * (1+tipPct)
        splitTotal = total / Float(splitNum)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToResult") {
            if let destVC = segue.destination as? ResultsViewController {
                destVC.splitNum = splitNum
                destVC.tipPct = tipPct
                destVC.splitTotal = splitTotal
            }
        }
    }
}

