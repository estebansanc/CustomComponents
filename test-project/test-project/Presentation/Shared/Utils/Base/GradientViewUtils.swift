//
//  GradientViewUtils.swift
//  MVPC_Architecture
//
//  Created by Esteban Sánchez on 18/05/2021.
//

import Foundation
import UIKit

// MARK:- Radial Gradient Layer
class RadialGradientLayer: CALayer {
    @objc public var colors = [UIColor.systemRed.cgColor, UIColor.systemBlue.cgColor] {
        didSet {
            backgroundColor = colors.last
        }
    }
    
    required override init() {
        super.init()
        needsDisplayOnBoundsChange = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required override init(layer: Any) {
        super.init(layer: layer)
    }
    
    override func draw(in context: CGContext) {
        context.saveGState()
        
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let endRadius = max(bounds.width, bounds.height) / 2
        
        var locations = [CGFloat]()
        for index in 0...colors.count - 1 {
            locations.append(CGFloat(index) / CGFloat(colors.count - 1))
        }
        
        if let gradient = CGGradient(colorsSpace: nil, colors: colors as CFArray, locations: locations) {
            context.drawRadialGradient(gradient, startCenter: center, startRadius: 0.0, endCenter: center, endRadius: endRadius, options: CGGradientDrawingOptions.drawsBeforeStartLocation)
        }
    }
}

// MARK:- Radial Gradient View
public class RadialGradientView: UIView {
    
    let darkestColor: UIColor = .black
    let darkerColor: UIColor = .black
    let lighterColor: UIColor = .blue
    let lightestColor: UIColor = .black
    
    let gradientLayer = RadialGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        if gradientLayer.frame != bounds {
            gradientLayer.frame = bounds
        }
    }
    
    private func commonInit() {
        backgroundColor = darkestColor
        gradientLayer.colors = [lightestColor.cgColor, lighterColor.cgColor, darkerColor.cgColor, darkestColor.cgColor]
        layer.addSublayer(gradientLayer)
    }
    
}
