//
//  BlurLoadingOverlayViewController.swift
//  ParrotLite
//
//  Created by Esteban Sánchez on 09/06/2021.
//

import UIKit

class BlurLoadingOverlayViewController: UIViewController {
    deinit {
        print("Blur loading overlay deinited")
    }
    // MARK: Properties
    var activityIndicatorStyle = UIActivityIndicatorView.Style.medium
    
    // MARK:- Views
    var visualBlurEffectView: UIVisualEffectView?
    var activityIndicator = UIActivityIndicatorView()
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearence()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupBlur()
        animateIn()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupViews()
    }
    
    // MARK: Setup
    func setupBlur() {
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        visualBlurEffectView = UIVisualEffectView(effect: blurEffect)
        visualBlurEffectView?.frame = view.bounds
        visualBlurEffectView?.alpha = 0
        view.addSubview(visualBlurEffectView!)
    }
    
    private func setupViews() {
        view.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupAppearence() {
        activityIndicator = UIActivityIndicatorView(style: LoadingOverlay.activityIndicatorStyle)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = UIColor.systemBlue
        activityIndicator.tintColor = UIColor.systemBlue
    }
    
    func setupModalPresentationStyle() {
        modalPresentationStyle = .overFullScreen
        isModalInPresentation = true
        modalTransitionStyle = .coverVertical
    }
    
    // MARK: Animations
    
    public func hide(){
        animateOut()
        activityIndicator.stopAnimating()
    }
    
    func animateIn() {
        activityIndicator.startAnimating()
        
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseInOut) {
                self.visualBlurEffectView?.alpha = 1
            } completion: { (_) in

            }
    }
    
    func animateOut() {
        self.dismiss(animated: true, completion: nil)
    }
}
