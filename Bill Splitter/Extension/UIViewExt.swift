//
//  UIViewExt.swift
//  Bill Splitter
//
//  Created by Sakar Pokhrel on 11/14/17.
//  Copyright © 2017 Sakar Pokhrel. All rights reserved.
//

import UIKit

//It will bind the button to the keyboard when keyboard pops up.
extension UIView {
    
    func bindToKeyboard() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardChangedFrame(_:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    @objc func keyboardChangedFrame(_ notification: NSNotification) {
        
        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
        let startingFrame = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let endingFrame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let deltaY = endingFrame.origin.y - startingFrame.origin.y
        
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIViewKeyframeAnimationOptions.init(rawValue: curve), animations: {
            self.frame.origin.y += deltaY
        }, completion: nil)
    }
    
}
