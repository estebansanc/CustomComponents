//
//  UITextField+Extensions.swift
//  test-project
//
//  Created by Esteban Sánchez on 09/07/2021.
//

import UIKit

// MARK:- Placeholder Color
extension UITextField{
   @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
}
