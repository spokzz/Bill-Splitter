//
//  ResturantBill.swift
//  Bill Splitter
//
//  Created by Sakar Pokhrel on 11/14/17.
//  Copyright © 2017 Sakar Pokhrel. All rights reserved.
//

import Foundation

struct ResturantBill {
    
    var dinerNumbers: Int
    var totalBillAmount: String
    var eachDinerAmount: String
    var tipsAmount: String
    
    init(dinerNumbers: Int, totalBillAmount: String, eachDinerAmount: String, tipsAmount: String) {
        self.dinerNumbers = dinerNumbers
        self.totalBillAmount = totalBillAmount
        self.eachDinerAmount = eachDinerAmount
        self.tipsAmount = tipsAmount
    }
    
}
