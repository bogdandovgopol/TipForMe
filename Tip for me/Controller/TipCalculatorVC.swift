//
//  ViewController.swift
//  Tip for me
//
//  Created by Bogdan Dovgopol on 22/7/19.
//  Copyright © 2019 Bogdan Dovgopol. All rights reserved.
//

import UIKit

class TipCalculatorVC: UIViewController {
    @IBOutlet weak var totalBeforeTipTxt: UITextField!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var tipLbl: UILabel!
    @IBOutlet weak var tipSplitSlider: UISlider!
    @IBOutlet weak var splitLbl: UILabel!
    @IBOutlet weak var totalAmount: UITextField!
    @IBOutlet weak var eachPersonAmount: UITextField!
    var tipCalculator  = TipCalculator(billAmount: 0, tipPercentage: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        totalBeforeTipTxt.attributedPlaceholder = NSAttributedString(string: "0", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        //check if billAmount changed
        totalBeforeTipTxt.addTarget(self, action: #selector(self.billAmountChanged(_:)), for: UIControl.Event.editingChanged)
        
        totalBeforeTipTxt.becomeFirstResponder()

    }
    
    func calculateTip() {
        tipCalculator.tipPercentage = Int(tipPercentageSlider.value)
        tipCalculator.billAmount = (totalBeforeTipTxt.text! as NSString).doubleValue
        tipCalculator.calculateTip()
        updateUI()
    }
    
    func updateUI() {
        let totalAfterTip = Double(tipCalculator.totalAmount)
        let numberOfPeople = Double(Int(tipSplitSlider.value))
        totalAmount.text = convertToCurrency(amount: totalAfterTip as NSNumber)
        eachPersonAmount.text = convertToCurrency(amount: (totalAfterTip / numberOfPeople) as NSNumber)
    }
    
    func convertToCurrency(amount: NSNumber) -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        // localize to grouping and decimal separator
        currencyFormatter.locale = Locale.current
        let priceString = currencyFormatter.string(from: amount)!
        
        return priceString
    }
    
    @IBAction func tipSliderChanged(_ sender: Any) {
        tipLbl.text = "TIP(\(Int(tipPercentageSlider.value))%)"
        calculateTip()
    }
    
    @IBAction func tipSplitChanged(_ sender: Any) {
        splitLbl.text = "SPLIT(\(Int(tipSplitSlider.value)))"
        calculateTip()
    }
    
    
    @objc func billAmountChanged(_ textField: UITextField) {
        calculateTip()
    }
    
}

