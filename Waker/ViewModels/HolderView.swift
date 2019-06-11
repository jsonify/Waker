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
    let preWakeDuration = 10.0
    let redRectangleLayer = RectangleLayer()
    let blueRectangleLayer = RectangleLayer()
    //    let ovalLayer = OvalLayer()
    //    let triangleLayer = TriangleLayer()
    //    let arcLayer = ArcLayer()

    var parentFrame :CGRect = .zero
    weak var delegate:HolderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Colors.clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func drawRedAnimationRectangle() {
        layer.addSublayer(redRectangleLayer)
        redRectangleLayer.animateStrokeWithColor(color: Colors.red, duration: 5.0)
        Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(drawBlueAnimationRectangle), userInfo: nil, repeats: false)
    }
    
    @objc
    func drawBlueAnimationRectangle() {
        layer.addSublayer(blueRectangleLayer)
        blueRectangleLayer.animateStrokeWithColor(color: Colors.blue, duration: 5.0)
        
        Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(expandView), userInfo: nil, repeats: false)
    }
    
    @objc
    func expandView() {
        backgroundColor = Colors.blue
        
        frame = CGRect(x: frame.origin.x - blueRectangleLayer.lineWidth, y: frame.origin.y - blueRectangleLayer.lineWidth, width: frame.size.width + blueRectangleLayer.lineWidth * 2, height: frame.size.height + blueRectangleLayer.lineWidth * 2)
        
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
