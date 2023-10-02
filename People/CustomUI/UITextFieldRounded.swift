//
//  UITextFieldRounded.swift
//  People
//
//  Created by Mubeen Riaz on 14/09/2023.
//

import UIKit

@IBDesignable
class UITextFieldRounded: UITextField {
    
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
}
