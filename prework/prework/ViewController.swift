//
//  ViewController.swift
//  prework
//
//  Created by Lam, An Q on 8/25/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateTip(_ sender: Any) {
        
        //Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //create values for tipPercentages
        let tipPercentages = [0.15, 0.18, 0.2]
        
        //get total tip = bill * tipPercentages
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]//index of tip Control from input
        
        //Calculate total = bill + tip
        let total = bill + tip
        
        //Update tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        //Update total Label
        totalLabel.text = String(format: "$%.2f", total)
    }
    
}

