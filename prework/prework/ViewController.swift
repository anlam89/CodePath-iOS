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
    
    @IBOutlet weak var tipSlider: UISlider!
    
    @IBOutlet weak var totalLabel: UILabel!
    

    @IBOutlet weak var tipRateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billAmountTextField.keyboardType = .numberPad
        billAmountTextField.text = "0.00"
        
       // billAmountTextField.reloadInputViews()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateTip(_ sender: Any) {
        tipOrBillValueChange()
    }
  
    @IBAction func abc(_ sender: Any) {
        tipOrBillValueChange()
    }
    
    @IBAction func tipSlideValueChange(_ sender: Any) {
        tipOrBillValueChange()
    }
    @IBAction func bilAmountTextFieldTouchDown(_ sender: Any) {
        if(billAmountTextField.text == "0.00"){
            billAmountTextField.text = nil
        }
        
    }
    
    @IBAction func billAmountTextFieldTouchUp(_ sender: Any) {
        if(billAmountTextField == nil){
            billAmountTextField.text = "0.00"
        }
    }

    func tipOrBillValueChange(){
        //Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //create values for tipPercentages
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let tipValue = tipPercentages[tipControl.selectedSegmentIndex]
        
        //get total tip = bill * tipPercentages
        let tip = bill * tipValue
        
        //Calculate total = bill + tip
        let total = bill + tip
        
        //Update tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        //Update total Label
        totalLabel.text = String(format: "$%.2f", total)
        
        //Update tipSlider
        tipSlider.value = Float(tipValue)
        
        //Upadate tip rate
        tipRateLabel.text = String(format: "%d%%" + "%", Int(tipValue * 100))
    }
}

