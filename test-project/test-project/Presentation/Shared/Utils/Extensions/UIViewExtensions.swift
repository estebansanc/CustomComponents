//
//  UIViewExtensions.swift
//  MVPC_Architecture
//
//  Created by Esteban Sánchez on 15/05/2021.
//

import Foundation
import UIKit
/// Only available if SkeletonView Pod is installed
//import SkeletonView

// MARK:- Add Constraints with Format
extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

// MARK:- Add Embedded
extension UIView {
    
    func addEmbedded(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        self.addConstraint(self.topAnchor.constraint(equalTo: view.topAnchor))
        self.addConstraint(self.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        self.addConstraint(self.leftAnchor.constraint(equalTo: view.leftAnchor))
        self.addConstraint(self.rightAnchor.constraint(equalTo: view.rightAnchor))
    }
}

// MARK:- Load View from Nib
extension UIView {
    func loadViewFromNib(nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}

// MARK:- Set Gradient Background
extension UIView {
    func setLinearGradientBackground(colorTop: UIColor, colorBottom: UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = bounds

        layer.insertSublayer(gradientLayer, at: 0)
    }
}

/// Only available if SkeletonView pod is installed
//// MARK:- Add Skeletonables
//extension UIView {
//    func setSkeletonableViews(views: UIView...){
//        views.forEach({
//            $0.isSkeletonable = true;
//            $0.skeletonCornerRadius = 10
//        })
//    }
//
//    func showSkeletonIn(views: UIView...){
//        views.forEach({
//            $0.isSkeletonable = true;
//            $0.showSkeleton();
//            $0.startSkeletonAnimation()
//        })
//    }
//
//    func hideSkeletonIn(views: UIView...){
//        views.forEach({
//            $0.hideSkeleton();
//            $0.stopSkeletonAnimation()
//        })
//    }
//}
