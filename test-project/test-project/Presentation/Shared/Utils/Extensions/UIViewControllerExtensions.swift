//
//  UIViewControllerExtensions.swift
//  MVPC_Architecture
//
//  Created by Esteban Sánchez on 15/05/2021.
//

import Foundation
import UIKit

// MARK:- Add Child
extension UIViewController {
    func addChild(viewController: UIViewController, in view: UIView) {
        addChild(viewController)
        view.addSubview(viewController.view)
        view.addEmbedded(view: viewController.view)
        viewController.didMove(toParent: self)
    }
}

// MARK:- Loading Overlay
extension UIViewController {
    // + LoadingOverlay
    func showLoadingOverlayOnlyInView(){
        LoadingOverlay.shared.show(over: self.view)
    }
    
    func showLoadingOverlay(){
        showLoadingOverlayOnlyInView()
    }
    
    func showLoadingOverlay(coveringNavigationBar overNavigation: Bool){
        if overNavigation {
            if let navigationController = self.navigationController{
                LoadingOverlay.shared.show(over: navigationController.view)
            }else{
                showLoadingOverlayOnlyInView()
            }
        }else{
            showLoadingOverlayOnlyInView()
        }
    }
    
    func showLoadingOverlay(withTimeout timeout: Int){
        showLoadingOverlay()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(timeout), execute: {
            self.hideLoadingOverlay()
        })
    }
    
    func showLoadingOverlay(withTimeout timeout: Int, coveringNavigationBar overNavigation: Bool){
        showLoadingOverlay(coveringNavigationBar: overNavigation)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(timeout), execute: {
            self.hideLoadingOverlay()
        })
    }
    
    func toggleLoadingOverlay(_ enabled: Bool){
        if enabled{
            showLoadingOverlay()
        }else{
            hideLoadingOverlay()
        }
    }
    
    func toggleLoadingOverlay(_ enabled: Bool, coveringNavigationBar overNavigation: Bool){
        if enabled{
            if overNavigation {
                showLoadingOverlay(coveringNavigationBar: overNavigation)
            }else{
                showLoadingOverlay()
            }
            
        }else{
            hideLoadingOverlay()
        }
    }
    
    func hideLoadingOverlay(){
        LoadingOverlay.shared.hide()
    }
    
    func showBlurLoadingOverlay() {
        LoadingOverlay.shared.showBlur(over: self)
    }
    
    func hideBlurLoadingOverlay() {
        LoadingOverlay.shared.hideBlur()
    }
}

/// Only available if SkeletonView pod is installed
//// MARK:- Skeleton
//extension UIViewController {
//    func showSkeleton() {
//        DispatchQueue.main.async {
//            self.view.skeletonCornerRadius = 10
//            let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .bottomRightTopLeft, duration: 1, autoreverses: true)
//
//            self.view.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: UIColor.init(white: 0.95, alpha: 1), secondaryColor: UIColor.white), animation: animation, transition: .crossDissolve(0.5))
//            self.view.startSkeletonAnimation()
//        }
//    }
//
//    func hideSkeleton() {
//        view.stopSkeletonAnimation()
//        view.hideSkeleton()
//    }
//
//    func showSkeleton(in vcs: UIViewController...) {
//        vcs.forEach({ $0.showSkeleton() })
//        showSkeleton()
//    }
//
//    func hideSkeleton(in vcs: UIViewController...) {
//        vcs.forEach({ $0.hideSkeleton() })
//        hideSkeleton()
//    }
//}
