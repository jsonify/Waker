//
//  PreWakeCircle.swift
//  Waker
//
//  Created by Jason Rueckert on 6/9/19.
//  Copyright © 2019 Jason Rueckert. All rights reserved.
//

import UIKit

class RectangleLayer: CAShapeLayer {
    override init() {
        super.init()
        fillColor = Colors.clear.cgColor
        lineWidth = 10.0
        path = roundedRectanglePath.cgPath
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var roundedRectanglePath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 160, height: 160), cornerRadius: 50)
    
    var rectanglePathFull: UIBezierPath {
        let rectanglePath = UIBezierPath()
        rectanglePath.move(to: CGPoint(x: 0.0, y: 100.0))
        rectanglePath.addLine(to: CGPoint(x: 0.0, y: -lineWidth))
        rectanglePath.addLine(to: CGPoint(x: 100.0, y: -lineWidth))
        rectanglePath.addLine(to: CGPoint(x: 100.0, y: 100.0))
        rectanglePath.addLine(to: CGPoint(x: -lineWidth / 2, y: 100.0))
        rectanglePath.close()
        return rectanglePath
    }
    
    func animateStrokeWithColor(color: UIColor, duration: Double) {
        strokeColor = color.cgColor
        let strokeAnimation: CABasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeAnimation.fromValue = 0.0
        strokeAnimation.toValue = 1.0
        strokeAnimation.duration = duration
        add(strokeAnimation, forKey: nil)
    }
}
