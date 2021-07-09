//
//  NeumorphismView.swift
//  test-project
//
//  Created by Esteban Sánchez on 09/07/2021.
//

import UIKit

class NeumorphicView: UIView {
    deinit { print("Neumorphic view deinited!!") }
    
    // MARK:- Properties
    var cornerRadius: CGFloat = 15 {
        didSet {
            layer.cornerRadius = cornerRadius
            darkShadow.cornerRadius = cornerRadius
            lightShadow.cornerRadius = cornerRadius
        }
    }
    var superviewBackgroundColor: UIColor = .gray
    var darkShadowColor: UIColor = .darkGray.withAlphaComponent(0.5)
    var lightShadowColor: UIColor = .lightGray.withAlphaComponent(0.5)
    var withCornerRadius: Bool = true
    
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
    
    // MARK:- Setup
    private func setupViews() {
        darkShadow.frame = self.bounds
        lightShadow.frame = self.bounds
    }
    
    private func setupAppearence() {
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
    }
}

extension UIColor {

    public func adjust(hueBy hue: CGFloat = -1, saturationBy saturation: CGFloat = -1, brightnessBy brightness: CGFloat = -1) -> UIColor {

        var currentHue: CGFloat = 0.0
        var currentSaturation: CGFloat = 0.0
        var currentBrigthness: CGFloat = 0.0
        var currentAlpha: CGFloat = 0.0

        if getHue(&currentHue, saturation: &currentSaturation, brightness: &currentBrigthness, alpha: &currentAlpha) {
            return UIColor(hue: hue == -1 ? currentHue : hue,
                       saturation: saturation == -1 ? currentSaturation : saturation,
                       brightness: brightness == -1 ? currentBrigthness : brightness,
                       alpha: currentAlpha)
        } else {
            return self
        }
    }
}
