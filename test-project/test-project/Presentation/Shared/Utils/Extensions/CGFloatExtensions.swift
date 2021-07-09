//
//  CGFloatExtensions.swift
//  ParrotLite
//
//  Created by Esteban Sánchez on 09/06/2021.
//

import Foundation
import UIKit

// MARK:- Random Numbers
extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
