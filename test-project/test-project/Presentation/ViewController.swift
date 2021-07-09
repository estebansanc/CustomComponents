//
//  ViewController.swift
//  test-project
//
//  Created by Esteban Sánchez on 09/07/2021.
//

import UIKit

class ViewController: UIViewController {
    // MARK:- Properties
    let defaultLeadingSpace: CGFloat = 20
    let defaultTrailingSpace: CGFloat = -20
    
    // MARK:- Views
    var blurBackgroundView: UIVisualEffectView = UIVisualEffectView()
    
    let blurredCardVC: BlurredCardViewController = {
        let vc = BlurredCardViewController()
        return vc
    }()
    
    let backgroundImageView: UIImageView = {
        let view = UIImageView(image: #imageLiteral(resourceName: "ExampleImage-2"))
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStrings()
        setupActions()
        setupAppearence()
        setupBlur()
        
        /// Only available if SkeletonView pod is installed
        //        setupSkeleton()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    // MARK:- Setup Actions
    func setupActions() {
    }
    
    // MARK:- Objc Functions
    
    // MARK:- Setup Views
    private func setupViews() {
        [backgroundImageView, blurBackgroundView, stackView].forEach({ view.addSubview($0) })
        [blurredCardVC.view].forEach({ stackView.addArrangedSubview($0) })
        
        NSLayoutConstraint.activate([
            // Background View
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            // Stack View
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: defaultLeadingSpace),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: defaultTrailingSpace),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -100),
            
            // Neumorphic View
            blurredCardVC.view.heightAnchor.constraint(greaterThanOrEqualToConstant: 200),
        ])
        
        blurBackgroundView.frame = view.bounds
    }
    
    // MARK:- Setup Blur
    func setupBlur() {
        let blurEffect = UIBlurEffect(style: .systemChromeMaterialDark)
        blurBackgroundView.effect = blurEffect
        blurBackgroundView.alpha = 1
    }
    
    /// Only available if SkeletonView pod is installed
    //    private func setupSkeleton() {
    //        view.setSkeletonableViews(views: )
    //    }
    
    // MARK:- Setup Strings
    private func setupStrings() { }
    
    // MARK:- Setup Appearence
    func setupAppearence() {
        view.backgroundColor = .black
    }
}


