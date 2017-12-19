//
//  CustomizeTextField.swift
//  Bill Splitter
//
//  Created by Sakar Pokhrel on 11/14/17.
//  Copyright © 2017 Sakar Pokhrel. All rights reserved.
//

import UIKit

@IBDesignable

class CustomizeTextField: UITextField {
    
    //Gives us the size of the screen width
    var screenSize = UIScreen.main.bounds.width
    
    //This function will update the changes in the storyboard
    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }

    //CORNER RADIUS:
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    //PLACEHOLDER IMAGE OF TEXTFIELD
    @IBInspectable var placeholderImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    //It moves the textfield image view or view in left direction based on user data.
    @IBInspectable var leftPadding: Int = 0 {
        didSet {
            updateView()
        }
    }
    
    //BORDER WIDTH:
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
                    }
    }
    
    //BORDER COLOR:
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
        
    
    
    func updateView() {
        
        guard let placeholderImage = placeholderImage else {return }
        leftViewMode = .always
        let placeholderImageView = UIImageView(frame: CGRect(x: leftPadding, y: 0, width: 18, height: 18))
        placeholderImageView.image = placeholderImage
        
        var viewPadding = leftPadding + 18
        
        if borderStyle == .line || borderStyle == .none {
            viewPadding = viewPadding + 8
        }
        let placeholderView = UIView(frame: CGRect(x: 0, y: 0, width: viewPadding, height: 18))
        placeholderView.addSubview(placeholderImageView)
        leftView = placeholderView
    }
    
    
    func customizeView() {
        
        guard let p = placeholder else {return }
        attributedPlaceholder = NSAttributedString(string: p, attributes: [NSAttributedStringKey.foregroundColor : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)])
        
    }

}
