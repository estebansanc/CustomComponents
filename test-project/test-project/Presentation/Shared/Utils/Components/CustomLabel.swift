//
//  CustomLabel.swift
//  test-project
//
//  Created by Esteban Sánchez on 09/07/2021.
//

import UIKit

class CustomLabel: UILabel {
    // MARK:- Properties
    var textPadding = UIEdgeInsets(
        top: 1,
        left: 0,
        bottom: 1,
        right: 0
    )

    var insets: UIEdgeInsets { get { return textPadding } }
    
    // MARK:- Initialiazers
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        setSkeletonableViews(views: self)
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        return addInsetsTo(size: super.intrinsicContentSize)
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return addInsetsTo(size: super.sizeThatFits(size))
    }

    // MARK:- Add Insets To
    func addInsetsTo(size: CGSize) -> CGSize {
        return CGSize(
            width: size.width + textPadding.left + textPadding.right,
            height: size.height + textPadding.top + textPadding.bottom
        )
    }
    
    // MARK:- Description Style
    func setDescriptionStyle(text: String,
                             alignment: NSTextAlignment = .left,
                             textColor: UIColor = .white
    ) {
        let font = UIFont.italicSystemFont(ofSize: 12)
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineSpacing = 10
        paragraph.alignment = alignment
        paragraph.lineBreakMode = .byWordWrapping
        
        let attributedKey: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: textColor,
            .paragraphStyle: paragraph
        ]
        
        let attributedText = NSAttributedString(string: text, attributes: attributedKey)
        self.attributedText = attributedText
    }
    
    // MARK:- Title Style
    func setTitleStyle(text: String,
                       alignment: NSTextAlignment = .left,
                       fontSize: CGFloat = 36,
                       coloredText: String = ".",
                       coloredTextColor: UIColor = .systemTeal,
                       textColor: UIColor = .white) {
        let font = UIFont.boldSystemFont(ofSize: fontSize)
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineSpacing = 5
        paragraph.alignment = alignment
        paragraph.lineBreakMode = .byTruncatingTail
        
        let attributedKey: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: textColor,
            .paragraphStyle: paragraph
        ]
        
        let attributedText = NSMutableAttributedString(string: text, attributes: attributedKey)
        attributedText.setColorForText(textForAttribute: coloredText, withColor: coloredTextColor)
        self.attributedText = attributedText
    }
}
