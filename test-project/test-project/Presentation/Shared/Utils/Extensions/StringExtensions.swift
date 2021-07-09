//
//  StringExtensions.swift
//  MVPC_Architecture
//
//  Created by Esteban Sánchez on 25/05/2021.
//

import Foundation

// MARK:- Localizable Strings
extension String { // + Localized
    
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    func localized(_ number: Int) -> String {
        let localized = NSLocalizedString(self, comment: "")
        return String(format: localized, number)
    }
    
    func localized(_ string: String) -> String {
        let localized = NSLocalizedString(self, comment: "")
        return String(format: localized, string)
    }
}
