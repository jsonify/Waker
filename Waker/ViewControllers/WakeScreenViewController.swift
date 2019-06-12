//
//  WakeScreenViewController.swift
//  Waker
//
//  Created by Jason on 5/28/18.
//  Copyright © 2018 Jason Rueckert. All rights reserved.
//

import UIKit
//import SwiftySound

class WakeScreenViewController: UIViewController, HolderViewDelegate {
    
    var holderView = HolderView(frame: .zero)
    @IBOutlet weak var barsView: UIImageView!
    
    // Circles
//    let shapeLayer1 = CAShapeLayer()
//    var currentStage = 1
    
    
    // Columns
    var imageView: UIImageView!
    
    @IBOutlet weak var exitButton: UIButton!
    
    // UserDefault Info
    let defaults = UserDefaults.standard
    let preWakeDurationKey = "preWakeDuration"
    let wakeDurationKey = "wakeDuration"
    let flipModeSwitchStateKey = "flipModeSwitchState"
    
    var preWakeDurationValuePiece : Double = 0
    var wakeDurationValueInterval : TimeInterval = 0
    
    var hasBeenClicked = false
    
    //MARK: - View Loading Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if let preWakeDurationValue = defaults.object(forKey: preWakeDurationKey) as? TimeInterval {
            preWakeDurationValuePiece = preWakeDurationValue
        }
        if let wakeDurationValue = defaults.object(forKey: wakeDurationKey) as? TimeInterval {
            wakeDurationValueInterval = wakeDurationValue
        }
    }
    
    func addHolderView() {
        let boxSize: CGFloat = 100.0
        holderView.frame = CGRect(x: view.bounds.width / 2 - boxSize / 2,
                                  y: view.bounds.height / 2 - boxSize / 2,
                                  width: boxSize,
                                  height: boxSize)
        holderView.parentFrame = view.frame
        holderView.delegate = self
        view.addSubview(holderView)
        holderView.drawRedAnimationCircle()
    }
    //MARK: Animation Methods
    func animateLabel() {
        holderView.removeFromSuperview()
        view.backgroundColor = Colors.green
        
        let label: UILabel = UILabel(frame: view.frame)
        label.textColor = Colors.white
        label.font = UIFont(name: "HelveticaNeue-Thin", size: 170.0)
        label.textAlignment = .center
        label.text = "Wake Up!"
        label.transform = label.transform.scaledBy(x: 0.25, y: 0.25)
        view.addSubview(label)
        
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1, options: .curveEaseInOut, animations: {
//            label.transform = label.transform.scaledBy(x: 2, y: 2)
        }) { (finished) in
            Timer.scheduledTimer(withTimeInterval: self.wakeDurationValueInterval, repeats: false, block: { (Timer) in
                self.defaults.set(false, forKey: "hasFiredKey")
                //                self.performSegueToReturnBack()
                self.holderView.removeFromSuperview()
                self.hasBeenClicked = false
            })
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if defaults.bool(forKey: flipModeSwitchStateKey) {
            self.view.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }
        addHolderView()
    }
    
    func WakeUpTime() {
        print("Wake Up!")
//        UIView.animate(withDuration: 0.001, delay: 5, animations: {
////            self.greenWakeImage.isHidden = false
////            self.exitButton.isHidden = false
//        }) { (true) in
//            if self.forCousteau {
//                //                self.presentImage.isHidden = false
//                self.presentPopup.transform = CGAffineTransform(scaleX: 0.3, y: 2)
//                UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .allowUserInteraction, animations: {
//                    self.presentPopup.transform = .identity
//                }, completion: { (success) in
//
//                })
//                self.presentPopup.alpha = 1
//                //                self.randomlyPickCharacter()
//
//            }
        
//        }
    }
    
    @IBAction func exitPressed(_ sender: UIButton) {
        dismiss(animated: false)
    }
    
    @IBAction func giftBoxButton(_ sender: Any) {
        if !hasBeenClicked {
            hasBeenClicked = true
        }
    }
    // TODO: - Change this from a UIImage to a UIButton and make it clickable
    @IBAction func characterButtonPressed(_ sender: Any) {
        
    }
    
//    func randomlyPickCharacter() {
//        characterPicked = false
//        let numberOfImages: UInt32 = 29
//        let random = arc4random_uniform(numberOfImages)
//        let imageName = "image_\(random)"
//        if characterPicked == false {
//            characterImage.image = UIImage(named: imageName)
//            let myImage = characterImage.image
//            characterButton.setImage(myImage, for: UIControlState.normal)
//            
//            characterPicked = true
//        }
//    }
}

extension UIViewController {
    func performSegueToReturnBack()  {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
}


// MARK: Old Code
// From viewDidLoad:
//        UIView.animate(withDuration: preWakeDurationValuePiece/12, delay: 0, options: .curveLinear, animations: {
//            self.stage1Col1.transform = CGAffineTransform(translationX: 0, y: 667)
//        }) { (true) in
//            self.showStage1_2()
//        }

// From reference to the old bar system:
//        let layer2 = CAShapeLayer()
//        layer2.path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: view.bounds.width/3, height: view.bounds.height)).cgPath
//        layer2.fillColor = UIColor.red.cgColor
//        view.layer.addSublayer(layer2)
//
//        let layer3 = CAShapeLayer()
//        layer3.path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: view.bounds.width/3, height: view.bounds.height)).cgPath
//        layer3.fillColor = UIColor.red.cgColor
//        view.layer.addSublayer(layer3)

//
//    func showStage1_2() {
//        UIView.animate(withDuration: preWakeDurationValuePiece/12, delay: 0, options: .curveLinear, animations: {
//            self.stage1Col2.transform = CGAffineTransform(translationX: 0, y: 667)
//        }) { (true) in
//            self.showStage1_3()
//        }
//    }
