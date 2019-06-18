//
//  HolderView.swift
//  Waker
//
//  Created by Jason Rueckert on 6/10/19.
//  Copyright © 2019 Jason Rueckert. All rights reserved.
//

import UIKit

protocol HolderViewDelegate:class {
    func animateLabel()
}

class HolderView: UIView {
    let defaults = UserDefaults.standard
    let preWakeDurationKey = "preWakeDuration"
    var preWakeDurationValuePiece : Double = 0
    var wakeDurationValueInterval : TimeInterval = 0
    
    let redCircleLayer = CircleLayer()
    let purpleCircleLayer = CircleLayer()
    let blueCircleLayer = CircleLayer()
    let cyanCircleLayer = CircleLayer()
    let greenCircleLayer = CircleLayer()
    let yellowCircleLayer = CircleLayer()
    let orangeCircleLayer = CircleLayer()
    
    //    let redRectangleLayer = RectangleLayer()
    //    let blueRectangleLayer = RectangleLayer()
    //    let ovalLayer = OvalLayer()
    //    let triangleLayer = TriangleLayer()
    //    let arcLayer = ArcLayer()

    var parentFrame :CGRect = .zero
    weak var delegate:HolderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Colors.clear
        if let preWakeDurationValue = defaults.object(forKey: preWakeDurationKey) as? TimeInterval {
            preWakeDurationValuePiece = preWakeDurationValue
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func drawRedAnimationCircle() {
        layer.addSublayer(redCircleLayer)
        redCircleLayer.animateStrokeWithColor(color: Colors.red, duration: preWakeDurationValuePiece/7)
        Timer.scheduledTimer(timeInterval: preWakeDurationValuePiece/7, target: self, selector: #selector(drawPurpleAnimationCircle), userInfo: nil, repeats: false)
    }
    
    @objc
    func drawPurpleAnimationCircle() {
        layer.addSublayer(purpleCircleLayer)
        purpleCircleLayer.animateStrokeWithColor(color: UIColor.purple, duration: preWakeDurationValuePiece/7)
        
        Timer.scheduledTimer(timeInterval: preWakeDurationValuePiece/7, target: self, selector: #selector(drawBlueAnimationCircle), userInfo: nil, repeats: false)
    }
    
    @objc
    func drawBlueAnimationCircle() {
        layer.addSublayer(blueCircleLayer)
        blueCircleLayer.animateStrokeWithColor(color: UIColor.blue, duration: preWakeDurationValuePiece/7)
        
        Timer.scheduledTimer(timeInterval: preWakeDurationValuePiece/7, target: self, selector: #selector(drawCyanAnimationCircle), userInfo: nil, repeats: false)
    }
    
    @objc
    func drawCyanAnimationCircle() {
        layer.addSublayer(cyanCircleLayer)
        cyanCircleLayer.animateStrokeWithColor(color: UIColor.cyan, duration: preWakeDurationValuePiece/7)
        
        Timer.scheduledTimer(timeInterval: preWakeDurationValuePiece/7, target: self, selector: #selector(drawGreenAnimationCircle), userInfo: nil, repeats: false)
    }
    
    @objc
    func drawGreenAnimationCircle() {
        layer.addSublayer(greenCircleLayer)
        greenCircleLayer.animateStrokeWithColor(color: UIColor.green, duration: preWakeDurationValuePiece/7)
        
        Timer.scheduledTimer(timeInterval: preWakeDurationValuePiece/7, target: self, selector: #selector(drawYellowAnimationCircle), userInfo: nil, repeats: false)
    }
    @objc
    func drawYellowAnimationCircle() {
        layer.addSublayer(yellowCircleLayer)
        yellowCircleLayer.animateStrokeWithColor(color: UIColor.yellow, duration: preWakeDurationValuePiece/7)
        
        Timer.scheduledTimer(timeInterval: preWakeDurationValuePiece/7, target: self, selector: #selector(expandView), userInfo: nil, repeats: false)
    }
    
    @objc
    func expandView() {
        backgroundColor = UIColor.yellow
        
        frame = CGRect(x: frame.origin.x - yellowCircleLayer.lineWidth, y: frame.origin.y - yellowCircleLayer.lineWidth, width: frame.size.width + yellowCircleLayer.lineWidth * 2, height: frame.size.height + yellowCircleLayer.lineWidth * 2)
        
        layer.sublayers = nil
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            self.frame = self.parentFrame
        }) { (finished) in
            self.addLabel()
        }
    }
    
    func addLabel() {
        delegate?.animateLabel()
    }
    
    //MARK: Unused Methods for now
    //    func addOval() {
    //        layer.addSublayer(ovalLayer)
    //        ovalLayer.expand()
    //        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(wobbleOval), userInfo: nil, repeats: false)
    //
    //            }
    //    @objc
    //    func wobbleOval() {
    //        layer.addSublayer(triangleLayer)
    //        ovalLayer.wobble()
    //
    //        Timer.scheduledTimer(timeInterval: 0.9, target: self, selector: #selector(drawAnimatedTriangle), userInfo: nil, repeats: false)
    //    }
    //
    //    @objc
    //    func drawAnimatedTriangle() {
    //        triangleLayer.animate()
    //
    //        Timer.scheduledTimer(timeInterval: 0.9, target: self, selector: #selector(spinAndTransform), userInfo: nil, repeats: false)
    //    }
    //
    //    @objc
    //    func spinAndTransform() {
    //        layer.anchorPoint = CGPoint(x: 0.5, y: 0.6)
    //
    //        var rotationAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
    //        rotationAnimation.toValue = CGFloat(.pi * 2.0)
    //        rotationAnimation.duration = 0.45
    //        rotationAnimation.isRemovedOnCompletion = true
    //        layer.add(rotationAnimation, forKey: nil)
    //
    //        ovalLayer.contract()
    //
    //        Timer.scheduledTimer(timeInterval: 0.45, target: self, selector: #selector(drawRedAnimationRectangle), userInfo: nil, repeats: false)
    //        Timer.scheduledTimer(timeInterval: 0.65, target: self, selector: #selector(drawBlueAnimationRectangle), userInfo: nil, repeats: false)
    //    }
    //    @objc
    //    func drawArc() {
    //        layer.addSublayer(arcLayer)
    //        arcLayer.animate()
    //
    //        Timer.scheduledTimer(timeInterval: 0.90, target: self, selector: #selector(expandView), userInfo: nil, repeats: false)
    //    }
}