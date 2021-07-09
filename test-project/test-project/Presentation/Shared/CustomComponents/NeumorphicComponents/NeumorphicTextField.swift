//
//  NeumorphicTextField.swift
//  test-project
//
//  Created by Esteban Sánchez on 09/07/2021.
//

import UIKit

class NeumorphicTextField: UITextField {
    deinit {
        print("Neumorphic text field deinited!!")
    }
    
    // MARK:- Properties
    var cornerRadius: CGFloat = 15
    var superviewBackgroundColor: UIColor = .gray
    var darkShadowColor: UIColor = .darkGray.withAlphaComponent(0.5)
    var lightShadowColor: UIColor = .lightGray.withAlphaComponent(0.5)
    var textPadding: UIEdgeInsets = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
    
    // MARK:- Views
    lazy var darkShadow: CALayer = {
        let shadow = CALayer()
        shadow.shadowRadius = cornerRadius
        shadow.shadowOffset = .init(width: 10, height: 10)
        shadow.shadowOpacity = 1
        shadow.cornerRadius = cornerRadius
        return shadow
    }()
    
    lazy var lightShadow: CALayer = {
        let shadow = CALayer()
        shadow.shadowRadius = cornerRadius
        shadow.shadowOffset = .init(width: -10, height: -10)
        shadow.shadowOpacity = 1
        shadow.cornerRadius = cornerRadius
        return shadow
    }()
    
    // MARK:- Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        delegate = self
        setupAppearence()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        updateColors()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupViews()
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    // MARK:- Setup
    private func setupViews() {
        darkShadow.frame = self.bounds
        darkShadow.shadowColor = darkShadowColor.cgColor
        darkShadow.backgroundColor = superviewBackgroundColor.cgColor
        
        lightShadow.frame = self.bounds
        lightShadow.shadowColor = lightShadowColor.cgColor
        lightShadow.backgroundColor = superviewBackgroundColor.cgColor
    }
    
    private func setupAppearence() {
        backgroundColor = .gray
        self.layer.cornerRadius = cornerRadius
        self.layer.insertSublayer(darkShadow, at: 0)
        self.layer.insertSublayer(lightShadow, at: 0)
    }
    
    private func updateColors() {
        superviewBackgroundColor = superview?.backgroundColor ?? superviewBackgroundColor
        darkShadowColor = superview?.backgroundColor?.adjust(saturationBy: 1, brightnessBy: 0.5).withAlphaComponent(0.5) ?? darkShadowColor
        lightShadowColor = superview?.backgroundColor?.adjust(saturationBy: 0.7, brightnessBy: 1).withAlphaComponent(0.8) ?? lightShadowColor
        
        backgroundColor = superviewBackgroundColor
        
        darkShadow.shadowColor = darkShadowColor.cgColor
        darkShadow.backgroundColor = superviewBackgroundColor.cgColor
        
        lightShadow.shadowColor = lightShadowColor.cgColor
        lightShadow.backgroundColor = superviewBackgroundColor.cgColor
        
        placeHolderColor = superviewBackgroundColor.adjust(saturationBy: 0.5, brightnessBy: 1)
    }
}

// MARK:- Text Field Delegate
extension NeumorphicTextField: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resignFirstResponder()
    }
}
