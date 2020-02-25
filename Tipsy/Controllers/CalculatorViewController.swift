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
    @IBOutlet weak var zeroPcButton: UIButton!
    @IBOutlet weak var tenPcButton: UIButton!
    @IBOutlet weak var twentyPcButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipsy: TipsyBrian?
    var totalBill = 0.0
    var tips = 0.0
    var tipsString: String?
    var numberOfPpl = 2.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        tipsString = sender.currentTitle
        
        switch sender.currentTitle! {
        case "0%":
            zeroPcButton.isSelected = true
            tenPcButton.isSelected = false
            twentyPcButton.isSelected = false
        case "10%":
            zeroPcButton.isSelected = false
            tenPcButton.isSelected = true
            twentyPcButton.isSelected = false
        default:
            zeroPcButton.isSelected = false
            tenPcButton.isSelected = false
            twentyPcButton.isSelected = true
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPpl = sender.value
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billValue = Double(billTextField.text!)!
        
        if zeroPcButton.isSelected{
            tips = 0.0
        } else if tenPcButton.isSelected {
            tips = 0.1
        } else {
            tips = 0.2
        }
        
        tipsy = TipsyBrian(total: billValue, tip: tips, splitNumber: numberOfPpl)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultVC = segue.destination as! ResultsViewController
        
        resultVC.numberOfPeople = Int(numberOfPpl)
        resultVC.totalBill = (tipsy?.calculateTotal())!
        resultVC.tip = tipsString
    }
    
}

