//
//  BlurredCardViewController.swift
//  test-project
//
//  Created by Esteban Sánchez on 09/07/2021.
//

import UIKit

struct BlurredCardViewModel {
    let image: UIImage
    let title: String
    let description: String
}

class BlurredCardViewController: UIViewController {
    // MARK:- Properties
    let defaultLeadingSpace: CGFloat = 40
    let defaultTrailingSpace: CGFloat = -40
    let cornerRadius: CGFloat = 15
    
    // MARK:- Views
    lazy var backgroundImageView: UIImageView = {
        let view = UIImageView(image: #imageLiteral(resourceName: "ExampleImage"))
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var blurFooterView: BlurredDescription = {
        let view = BlurredDescription()
        return view
    }()
    
    // MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStrings()
        setupActions()
        setupAppearence()
        setupShadows()
        
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
    }
    
    // MARK:- Setup Actions
    func setupActions() { }
    
    // MARK:- Objc Functions
    
    // MARK:- Setup Views
    private func setupViews() {
        [backgroundImageView, blurFooterView].forEach { view.addSubview($0) }
        
        NSLayoutConstraint.activate([
            // Background Image View
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // Blur Footer View
            blurFooterView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            blurFooterView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurFooterView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    /// Only available if SkeletonView pod is installed
    //    private func setupSkeleton() {
    //        view.setSkeletonableViews(views: )
    //    }
    
    // MARK:- Setup Strings
    private func setupStrings() { }
    
    // MARK:- Setup Appearence
    func setupAppearence() {
        backgroundImageView.clipsToBounds = true
        backgroundImageView.layer.cornerRadius = cornerRadius
        
        blurFooterView.clipsToBounds = true
        blurFooterView.layer.cornerRadius = cornerRadius
    }
    
    private func setupShadows() {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = cornerRadius
        view.layer.shadowOpacity = 1
    }
}

