//
//  TipCalculator.swift
//  Tip for me
//
//  Created by Bogdan Dovgopol on 22/7/19.
//  Copyright © 2019 Bogdan Dovgopol. All rights reserved.
//

import Foundation

class TipCalculator {
    var billAmount : Double = 0
    var tipAmount : Double = 0
    var tipPercentage : Int = 0
    var totalAmount : Double = 0
    
    init(billAmount: Double, tipPercentage: Int) {
        self.billAmount = billAmount
        self.tipPercentage = tipPercentage
    }
    
    func calculateTip() {
        tipAmount = billAmount * Double(tipPercentage) / 100
        totalAmount = tipAmount + billAmount
    }
}
