//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Marwan Khalawi on 2/21/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalBill: Double?
    var numberOfPeople : Int?
    var tip: String?
    
    
    override func viewDidLoad() {        
        totalLabel.text = "$" + String(format: "%.2f", totalBill!)
        settingsLabel.text = "Split between \(numberOfPeople!) people, with \(tip!) tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
