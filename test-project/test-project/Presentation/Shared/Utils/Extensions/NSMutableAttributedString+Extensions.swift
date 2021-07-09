//
//  NSMutableAttributedString+Extensions.swift
//  MVPC_Architecture
//
//  Created by Esteban Sánchez on 16/05/2021.
//

import Foundation
import UIKit

extension NSMutableAttributedString {

    func setColorForText(textForAttribute: String, withColor color: UIColor) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }

}
