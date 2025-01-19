//
//  UILabel+Ext.swift
//  SevenApssExample
//
//  Created by TaylanBostanci on 19.01.2025.
//

import UIKit

extension UILabel {
    func setBoldAndItalicText(boldText: String, italicText: String, boldFontSize: CGFloat = 16, italicFontSize: CGFloat = 16) {
        let boldAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: boldFontSize)
        ]
        
        let italicAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.italicSystemFont(ofSize: italicFontSize)
        ]
        
        let boldAttributedString = NSMutableAttributedString(string: boldText, attributes: boldAttributes)
        let italicAttributedString = NSAttributedString(string: italicText, attributes: italicAttributes)
        
        boldAttributedString.append(italicAttributedString)
        
        self.attributedText = boldAttributedString
    }
}
