//
//  ViewController.swift
//  AnimationPOC
//
//  Created by mohit.agrawal on 15/09/18.
//  Copyright © 2018 mohit.agrawal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: ShakingTextField!
    let circleShapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        
        let circleShapePath = UIBezierPath(arcCenter: view.center, radius: 100, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        circleShapeLayer.strokeColor = UIColor.cyan.cgColor
        circleShapeLayer.lineWidth = 10
        circleShapeLayer.path = circleShapePath.cgPath
        circleShapeLayer.strokeEnd = 0
        circleShapeLayer.lineCap = kCALineCapRound
        
        view.layer.addSublayer(circleShapeLayer)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapGesture)))
    }

    @objc func tapGesture() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 2
        animation.toValue = 1
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        
        circleShapeLayer.add(animation, forKey: "stroke")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        nameTextField.shake()
    }
}

