//
//  TotalBillVC.swift
//  Bill Splitter
//
//  Created by Sakar Pokhrel on 11/14/17.
//  Copyright © 2017 Sakar Pokhrel. All rights reserved.
//

import UIKit

class TotalBillVC: UIViewController {

    @IBOutlet weak var totalFoodCostlabel: UILabel!
    @IBOutlet weak var numberOfDinersLabel: UILabel!
    @IBOutlet weak var eachAmountLabel: UILabel!
    @IBOutlet weak var tipsLabel: UILabel!
    
    var resturantBillToShow: ResturantBill!
    
    //VIEW DID LOAD:
    override func viewDidLoad() {
        super.viewDidLoad()
        self.totalFoodCostlabel.text = "$ \(resturantBillToShow.totalBillAmount)"
        self.numberOfDinersLabel.text = "\(resturantBillToShow.dinerNumbers)"
        self.eachAmountLabel.text = "$ \(resturantBillToShow.eachDinerAmount)"
        self.tipsLabel.text = "$ \(resturantBillToShow.tipsAmount)"
    }
    
    //TAKES DATA FROM BILLSPLITTERVC
    func initData(resturantBill: ResturantBill) {
        resturantBillToShow = resturantBill
    }

    //CLOSE BUTTON PRESSED:
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
}
