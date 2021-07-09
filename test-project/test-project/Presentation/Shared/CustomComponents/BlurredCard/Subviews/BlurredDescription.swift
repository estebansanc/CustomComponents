//
//  BlurredLabel.swift
//  test-project
//
//  Created by Esteban Sánchez on 09/07/2021.
//

import UIKit

class BlurredDescription: UIView {
    // MARK:- Properties
    let defaultLeadingSpace: CGFloat = 40
    let defaultTrailingSpace: CGFloat = -40
    
    // MARK:- Views
    var blurFooterView: UIVisualEffectView = UIVisualEffectView()
    
    let titleLabel: CustomLabel = {
        let view = CustomLabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let descriptionLabel: CustomLabel = {
        let view = CustomLabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK:- Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setupBlur()
        setupStrings()
        setupActions()
        setupAppearence()
        /// Only available if SkeletonView pod is installed
        //        setupSkeleton()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupViews()
    }
    
    // MARK:- Setup Actions
    func setupActions() { }
    
    // MARK:- Objc Functions®®
    
    // MARK:- Setup Views
    private func setupViews() {
        [blurFooterView, titleLabel, descriptionLabel].forEach { addSubview($0) }
        
        NSLayoutConstraint.activate([
            // Title Label
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: defaultLeadingSpace),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: defaultTrailingSpace),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -10),
            // Description Label
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: defaultLeadingSpace),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: defaultTrailingSpace),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
        
        blurFooterView.frame = bounds
    }
    
    /// Only available if SkeletonView pod is installed
    //    private func setupSkeleton() {
    //        view.setSkeletonableViews(views: )
    //    }
    
    // MARK:- Setup Blur
    func setupBlur() {
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterialDark)
        blurFooterView.effect = blurEffect
        blurFooterView.alpha = 1
    }
    
    // MARK:- Setup Strings
    private func setupStrings() {
        titleLabel.setTitleStyle(text: "What is Lorem Ipsum?", textColor: .white)
        descriptionLabel.setDescriptionStyle(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make ")
    }
    
    // MARK:- Setup Appearence
    func setupAppearence() {
    }
}
