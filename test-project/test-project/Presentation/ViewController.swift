//
//  ViewController.swift
//  test-project
//
//  Created by Esteban Sánchez on 09/07/2021.
//

import UIKit

class ViewController: UIViewController {
    // MARK:- Properties
    let defaultLeadingSpace: CGFloat = 40
    let defaultTrailingSpace: CGFloat = -40
    
    // MARK:- Views
    let neumorphicView: NeumorphicView = {
        let view = NeumorphicView()
        return view
    }()
    
    let neumorphicTextField: NeumorphicTextField = {
        let view = NeumorphicTextField()
        view.placeholder = "Enter your text here..."
        view.textColor = .white
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
        view.backgroundColor = .systemGreen
        stackView.backgroundColor = view.backgroundColor
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        neumorphicView.cornerRadius = neumorphicView.frame.height / 2
    }
    
    // MARK:- Setup
    private func setupViews() {
        [stackView].forEach({ view.addSubview($0) })
        [neumorphicTextField, neumorphicView].forEach({ stackView.addArrangedSubview($0) })
        
        NSLayoutConstraint.activate([
            // Stack View
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: defaultLeadingSpace),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: defaultTrailingSpace),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -100),
            
            // Neumorphic View
            neumorphicView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),
            neumorphicView.widthAnchor.constraint(equalTo: neumorphicView.heightAnchor),
            
            // Neumorphic Text Field
            neumorphicTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
        
    }
}

