//
//  ImagePicker.swift
//  MVPC_Architecture
//
//  Created by Esteban Sánchez on 25/05/2021.
//

import Foundation
import UIKit

protocol ImagePickerDelegate: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
}

class ImagePicker {
    
    weak var delegate: ImagePickerDelegate?
    
    func presentDialog(in controller: UIViewController) {
        let alertVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        alertVC.addAction(UIAlertAction(title: "Take a photo", style: .default, handler: { [weak controller, weak self] _ in
            let picker = UIImagePickerController()
            picker.delegate = self?.delegate
            picker.mediaTypes = ["public.image"]
            picker.sourceType = .camera
            controller?.view.window?.rootViewController?.present(picker, animated: true, completion: nil)
        }))
        
        alertVC.addAction(UIAlertAction(title: "Pick from gallery", style: .default, handler: { [weak controller, weak self] _ in
            let picker = UIImagePickerController()
            picker.delegate = self?.delegate
            picker.mediaTypes = ["public.image"]
            picker.sourceType = .savedPhotosAlbum
            controller?.view.window?.rootViewController?.present(picker, animated: true, completion: nil)
        }))
        
        alertVC.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        controller.view.window?.rootViewController?.present(alertVC, animated: true, completion: nil)
    }
}
