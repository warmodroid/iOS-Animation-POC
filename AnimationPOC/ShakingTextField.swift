//
//  ShakingTextField.swift
//  AnimationPOC
//
//  Created by mohit.agrawal on 16/09/18.
//  Copyright © 2018 mohit.agrawal. All rights reserved.
//

import UIKit

class ShakingTextField: UITextField {

    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = CGPoint(x: self.center.x - 5, y: self.center.y)
        animation.toValue = CGPoint(x: self.center.x + 5, y: self.center.y)
        
        self.layer.add(animation, forKey: "position")
    }
    
}
