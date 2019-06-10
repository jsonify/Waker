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
    let ovalLayer = OvalLayer()
//    let redRectangleLayer = RectangleLayer()
//    let blueRectangleLayer = RectangleLayer()

    var parentFrame :CGRect = .zero
    weak var delegate:HolderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Colors.clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func addOval() {
        layer.addSublayer(ovalLayer)
        ovalLayer.expand()
        Timer.scheduledTimer(timeInterval: 0.3, target: ovalLayer, selector: #selector(OvalLayer.wobble), userInfo: nil, repeats: false)
        
    }

}
