//
//  ViewController.swift
//  Bill Splitter
//
//  Created by Sakar Pokhrel on 11/14/17.
//  Copyright © 2017 Sakar Pokhrel. All rights reserved.
//

import UIKit

class BillSplitterVC: UIViewController {

    @IBOutlet weak var totalDinersLabel: CustomizeTextField!
    @IBOutlet weak var totalBillLabel: CustomizeTextField!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var tipsLabel: CustomizeTextField!
    @IBOutlet weak var button_10: UIButton!
    @IBOutlet weak var button_20: UIButton!
    @IBOutlet weak var button_30: UIButton!
    
    //VIEW DID LOAD:
    override func viewDidLoad() {
        super.viewDidLoad()
        totalDinersLabel.delegate = self
        totalBillLabel.delegate = self
        calculateButton.bindToKeyboard()
        addTapGesture()
        
    }
    
    //It will take tips percent after buttonPressed and returns the tipsAmount.
    func calculateTipsAmount(tipsPercent: Double) -> Double {
        var totalBills = Double()
        if totalDinersLabel.text != "" && totalBillLabel.text != "" {
             totalBills = Double(totalBillLabel.text!)!
        }
        return totalBills * tipsPercent
    }

    //CALCULATE BUTTON PRESSED:
    @IBAction func calculateButtonPressed(_ sender: Any) {
        if totalDinersLabel.text != "" && totalBillLabel.text != "" {
            var tipsAmount = Double()
            
            if tipsLabel.text != "" {
                tipsAmount = Double(tipsLabel.text!)!
            } else {
                tipsAmount = 0
            }
            
            let totalDiners = Double(totalDinersLabel.text!)!
            let totalBill = Double(totalBillLabel.text!)!
            
            //It returns 2 decimal point of the result in a String type.
            let amountToPay = String(format: "%.2f", (totalBill + tipsAmount) / totalDiners)
            let formattedTotalBill = String(format: "%.2f", totalBill)
            let formattedTips = String(format: "%.2f", tipsAmount)
            let totalDinersInInt = Int(totalDiners)
            
            //Creating the object of TotalBillVC and passing data.
            guard let totalBillVC = storyboard?.instantiateViewController(withIdentifier: "totalBillVC") as? TotalBillVC else {return }
            totalBillVC.initData(resturantBill: ResturantBill(dinerNumbers: totalDinersInInt, totalBillAmount: formattedTotalBill, eachDinerAmount: amountToPay, tipsAmount: formattedTips))
            self.present(totalBillVC, animated: false, completion: nil)
            
            self.totalBillLabel.text = ""
            self.totalDinersLabel.text = ""
            self.tipsLabel.text = ""
            
    }
            }
    
    
    //CUSTOM TIPS % BUTTON:
    @IBAction func button_10_Pressed(_ sender: Any) {
       let tipsAmount = calculateTipsAmount(tipsPercent: 0.10)
        tipsLabel.text = "\(tipsAmount)"
    }
    
    @IBAction func button_20_Pressed(_ sender: Any) {
        let tipsAmount = calculateTipsAmount(tipsPercent: 0.20)
        tipsLabel.text = "\(tipsAmount)"
    }
    
    @IBAction func button_30_Pressed(_ sender: Any) {
       let tipsAmount = calculateTipsAmount(tipsPercent: 0.30)
        tipsLabel.text = "\(tipsAmount)"
    }
    
   
    //ADD TAP GESTURE RECOGNIZER:
    func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedOnScreen))
        tap.numberOfTapsRequired = 1
        view.addGestureRecognizer(tap)
    }
    
    //USER TAPPED ON SCREEN (ONE TAP)
    @objc func tappedOnScreen() {
        self.view.endEditing(true)
    }
    
    
}

//UITEXTFIELD DELEGATE:
extension BillSplitterVC: UITextFieldDelegate {
    
    //When text field area will be pressed, it will be called.
    func textFieldDidBeginEditing(_ textField: UITextField) {
        totalDinersLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        totalBillLabel.textColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        tipsLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        totalDinersLabel.font = UIFont(name: "Avenir Next", size: 18)
        totalBillLabel.font = UIFont(name: "Avenir Next", size: 18)
        tipsLabel.font = UIFont(name: "Avenir Next", size: 18)
    }
    
}




