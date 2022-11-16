//
//  UIColorExtension.swift
//  Beeline Test Task
//
//  Created by Илья Сергеевич on 09.11.2022.
//

import Foundation
import UIKit

extension UIColor {
    
    static var beelineYelow: UIColor {
        #colorLiteral(red: 0.8235294118, green: 0.7450980392, blue: 0, alpha: 1)
    }
    static var beelineYelowOpacity: UIColor {
        #colorLiteral(red: 0.8235294118, green: 0.7450980392, blue: 0, alpha: 0.28)
    }
    
    static var beelineBlack: UIColor {
        #colorLiteral(red: 0.007843137719, green: 0.007843137719, blue: 0.007843136787, alpha: 0.2031489492)
    }
    
    static var beelineBack = UIColor(patternImage: UIImage(named: "beelinebackground.jpg")!)
}
