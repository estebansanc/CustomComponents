//
//  LoadingOverlay.swift
//  Pruuv
//
//  Created by Mauricio Sánchez on 10/02/2021.
//

import Foundation
import UIKit

public class LoadingOverlay {
    
    // Configuración
//    static var overlayBackgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
    static var overlayBackgroundColor = UIColor.systemBlue.withAlphaComponent(0.8)
    static var activityIndicatorStyle = UIActivityIndicatorView.Style.medium
    
    // Variables
    var overlayView = UIView()
    var activityIndicator = UIActivityIndicatorView()
    var blurLoadingOverlayVC: BlurLoadingOverlayViewController?
    
    // Singleton
    // ----------------------------------------------------------------------------------
    class var shared: LoadingOverlay {
        struct Static {
            static let instance: LoadingOverlay = LoadingOverlay()
        }
        return Static.instance
    }
    
    // MAKR:- Flat Overlay
    public func show(over view: UIView!){
        hide()
        
        overlayView = UIView()
        overlayView.backgroundColor = LoadingOverlay.overlayBackgroundColor
        overlayView.layer.cornerRadius = view.layer.cornerRadius
        
        activityIndicator = UIActivityIndicatorView(style: LoadingOverlay.activityIndicatorStyle)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = UIColor.systemBlue
        activityIndicator.tintColor = UIColor.systemBlue
        
        overlayView.addSubview(activityIndicator)
        overlayView.addConstraint(overlayView.centerXAnchor.constraint(equalTo: activityIndicator.centerXAnchor))
        overlayView.addConstraint(overlayView.centerYAnchor.constraint(equalTo: activityIndicator.centerYAnchor))
        activityIndicator.startAnimating()
        
        view.addEmbedded(view: overlayView)
    }
    
    public func hide(){
        activityIndicator.stopAnimating()
        overlayView.removeFromSuperview()
    }
    
    // MARK: Blur Overlay
    public func showBlur(over viewController: UIViewController!) {
        let vc = BlurLoadingOverlayViewController()
        vc.setupModalPresentationStyle()
        blurLoadingOverlayVC = vc
        
        viewController.view.window?.rootViewController?.present(
            blurLoadingOverlayVC!,
            animated: true,
            completion: nil
        )
    }
    
    public func hideBlur(){
        blurLoadingOverlayVC?.animateOut()
    }
}
