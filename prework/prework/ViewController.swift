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
        tipRateLabel.text = "15%"
       // billAmountTextField.reloadInputViews()
        // Do any additional setup after loading the view.
    }
    @IBAction func billAmountTextFieldTouchDown(_ sender: Any) {
        if(billAmountTextField.text == "0.00"){
            billAmountTextField.text = nil
        }
    }
    
    @IBAction func billAmountTextFieldEditingChange(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        
        let tipCustom = Double(tipSlider.value)
        let tipPercentages = [0.15, 0.18, 0.2, tipCustom]
        let tipRate = tipPercentages[tipControl.selectedSegmentIndex]
        print(tipRate * 100)
        let tip = bill * tipRate
        
        let total = bill + tip
        
        tipRateLabel.text = String(format: "%d%%", Int(tipRate  * 100))
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func tipSliderValueChange(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipRate = (Double(tipSlider.value)*100).rounded()/100
        print(tipRate)
        let tip = bill * tipRate
        
        let total = bill + tip
        
        tipRateLabel.text = String(format: "%d%%", Int(tipRate  * 100))
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        totalLabel.text = String(format: "$%.2f", total)
        
        tipControl.selectedSegmentIndex = 3
    }
    
    @IBAction func tipControlValueChange(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        
        let tipCustom = Double(tipSlider.value)
        let tipPercentages = [0.15, 0.18, 0.2, tipCustom]
        let tipRate = tipPercentages[tipControl.selectedSegmentIndex]
        print(tipRate * 100)
        let tip = bill * tipRate
        
        let total = bill + tip
        
        tipRateLabel.text = String(format: "%d%%", Int(tipRate  * 100))
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        totalLabel.text = String(format: "$%.2f", total)
        
        tipSlider.value = Float(tipRate)
    }
    
    
    @IBAction func settingButtonTouchUpInside(_ sender: Any) {
        
    }
}

