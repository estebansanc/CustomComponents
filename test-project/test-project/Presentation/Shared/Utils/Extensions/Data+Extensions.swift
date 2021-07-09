//
//  Data+Extensions.swift
//  ParrotLite
//
//  Created by Esteban Sánchez on 22/06/2021.
//

import Foundation

// MARK:- Mime Types
extension Data {
    var mimeType: String {
        let array = [UInt8](self)
        let ext: String
        switch (array[0]) {
        case 0xFF:
            // JPG
            ext = "image/jpeg"
        case 0x89:
            // PNG
            ext = "image/jpeg"
        case 0x47:
            // GIF
            ext = "image/gif"
        case 0x49, 0x4D :
            // TIFF
            ext = "image/tiff"
        case 0x25, 0x50, 0x44, 0x46 :
            // PDF
            ext = "application/pdf"
        default:
            ext = "unknown"
        }
        return ext
    }
}


