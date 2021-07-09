//
//  String+Extensions.swift
//  MVPC_Architecture
//
//  Created by Esteban Sánchez on 22/05/2021.
//

import Foundation

/// With this extension we can validate strings, according to regular expressions
// MARK:- Regular Expression Validations
extension String {
    
    enum ValidityType {
        case email
        case password
        case nonEmpty
        case date
        case number
    }
    
    enum Regex: String {
        case email = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$"
        case password = ".{4,25}"
        case nonEmpty = "^\\w+[\\s+\\w+\\.]*"
        case date = #"^\d{1,2}[\/-]\d{1,2}[\/-]\d{4}$"#
        case number = "[0-9]+"
    }
    
    func isValid(_ validityType: ValidityType) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""
        
        switch validityType {
            case .email:
                regex = Regex.email.rawValue
            case .password:
                regex = Regex.password.rawValue
            case .nonEmpty:
                regex = Regex.nonEmpty.rawValue
            case .date:
                regex = Regex.date.rawValue
            case .number:
                regex = Regex.number.rawValue

        }
        
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
}
