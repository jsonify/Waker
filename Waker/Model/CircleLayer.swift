//
//  PreWakeCircle.swift
//  Waker
//
//  Created by Jason Rueckert on 6/9/19.
//  Copyright © 2019 Jason Rueckert. All rights reserved.
//

import UIKit

class CircleLayer: CAShapeLayer {
    override init() {
        super.init()
        fillColor = Colors.clear.cgColor
        lineWidth = 10.0
        path = circlePath.cgPath
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var circlePath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 160, height: 160), cornerRadius: 80)
    
    func animateStrokeWithColor(color: UIColor, duration: Double) {
        strokeColor = color.cgColor
        let strokeAnimation: CABasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeAnimation.fromValue = 0.0
        strokeAnimation.toValue = 1.0
        strokeAnimation.duration = duration
        add(strokeAnimation, forKey: nil)
    }
}
