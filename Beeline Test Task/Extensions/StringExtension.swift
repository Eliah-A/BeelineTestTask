//
//  StringExtension.swift
//  Beeline Test Task
//
//  Created by Илья Сергеевич on 10.11.2022.
//

import Foundation
import UIKit
//allow string strikethrough
extension String {
    public func strikethrough () -> NSMutableAttributedString{
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSRange(location: 0, length: attributeString.length))
        attributeString.addAttribute(NSAttributedString.Key.strikethroughColor, value: UIColor.red, range: NSRange(location: 0, length: attributeString.length))
        return attributeString
    }
}
