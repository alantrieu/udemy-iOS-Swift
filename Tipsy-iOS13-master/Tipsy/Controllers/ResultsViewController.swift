//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Alan Trieu on 22/8/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    var tipPct: Float = 0.1
    var splitNum: Int = 2
    var splitTotal: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        totalLabel.text = String(format: "%.2f", splitTotal)
        settingLabel.text = "Split between \(splitNum) people, with \(Int(tipPct * 100))% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
