//
//  ClockViewController.swift
//  Waker
//
//  Created by Jason on 5/9/18.
//  Copyright © 2018 Jason Rueckert. All rights reserved.
//

import UIKit
import AVFoundation
import SwiftySound

class ClockViewController: UIViewController {
    
    //UserDefaults
    let defaults = UserDefaults.standard
    let wakeUpTimeKey = "wakeUpTime"
    let preWakeDurationKey = "preWakeDuration"
    let wakeDurationKey = "wakeDuration"
    let clockSwitchStateKey = "clockSwitchState"
    let enableSoundSwitchStateKey = "enableSoundSwitchState"
    let gradientSliderValueKey = "gradientSliderValue"
    let backButtonStateKey = "backButtonState"
    let flipModeSwitchStateKey = "flipModeSwitchState"
    let particlesSwitchStateKey = "particlesSwitchState"
    
    // TextField Labels/Image Views
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var bgImage: UIImageView!
    
    var preWakeHasTriggered = false
    
    // Gradients
    let newLayer = CAGradientLayer()

    private var rainSound: Sound?
    var hasFired: Bool = false
    let backgroundDuration : Double = 60

    //MARK: - View Loading Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if defaults.bool(forKey: flipModeSwitchStateKey) {
            self.view.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }
        
        if defaults.bool(forKey: enableSoundSwitchStateKey) {
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
                
                    playSoundFile()
                
            }
            catch {
                // report for an error
                print(error)
            }
        }
        
        if defaults.bool(forKey: clockSwitchStateKey) {
            showClock()
        }
        
        if defaults.bool(forKey: particlesSwitchStateKey) {
            particlesEffect()
        }
        
        setCustomBackImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()

        view.backgroundColor = UIColor(red: 51/255, green: 69/255, blue: 107/255, alpha: 1.0)
        backgroundAnimation(durationInterval: backgroundDuration)
        let gradientAlpha = defaults.float(forKey: gradientSliderValueKey)
        let gradient1 = UIColor(white: 0, alpha: 1).cgColor
        let gradient2 = UIColor(white: 0, alpha: CGFloat(gradientAlpha)).cgColor
        let gradient3 = UIColor(white: 0, alpha: 1).cgColor
        newLayer.colors = [gradient1, gradient2, gradient3]
        newLayer.frame = view.frame
        view.layer.addSublayer(newLayer)
        checkForWakeTimeString()
    }
    
    
    
    func setCustomBackImage() {
        let backButton = UIBarButtonItem(image: UIImage(named: "backArrow"), style: .plain, target: self, action: #selector(popCurrentViewController(_:)))
        if defaults.bool(forKey: backButtonStateKey) {
            backButton.tintColor = UIColor(white: 1, alpha: 0)
        } else {
            backButton.tintColor = UIColor(white: 1, alpha: 0.5)
        }
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.leftBarButtonItem = backButton
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    @objc func popCurrentViewController(_ animated: Bool)
    {
        _ = self.navigationController?.popViewController(animated: true)
        Sound.stopAll()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        defaults.set(false, forKey: "hasFiredKey")
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
//        Sound.enabled = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
//        Sound.enabled = false
    }
    
    func particlesEffect() {
        let emitter = Emitter.get(with: #imageLiteral(resourceName: "particle2"))
        emitter.emitterPosition = CGPoint(x: view.frame.width/2, y: 0)
        emitter.emitterSize = CGSize(width: view.frame.width, height: 2)
        view.layer.addSublayer(emitter)
        
    }
    
    //MARK: - Time Methods
    func checkForWakeTimeString() {
        
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (Timer) in
                self.hasFired = self.defaults.bool(forKey: "hasFiredKey")
                let date = Date()
                let tempWakeUpTime = self.defaults.object(forKey: self.wakeUpTimeKey) as? Date
                let pwdInterval = Int((self.defaults.object(forKey: self.preWakeDurationKey) as? TimeInterval)!)
                
                let preWakeUpTimeStr = self.formatTime(date: tempWakeUpTime!.addSeconds(-pwdInterval))
                
                let dateStr = self.formatTime(date: date)
                
                
                if preWakeUpTimeStr.compare(dateStr) == .orderedSame && !self.preWakeHasTriggered {
                    
                    self.performSegue(withIdentifier: "toWakeScreenViewControllerSegue", sender: self)
                    self.preWakeHasTriggered = true
//                    self.defaults.set(true, forKey: "hasFiredKey")
                }
            }
        
    }
    
    //MARK: - Audio/Visual Methods
    func playSoundFile() {
        if let rainUrl = Bundle.main.url(forResource: "rain", withExtension: "mp3") {
            rainSound = Sound(url: rainUrl)
        } else {
            print("url not found")
            return
        }   
        Sound.play(file: "rain", fileExtension: "mp3", numberOfLoops: -1)
    }
    
    func backgroundAnimation(durationInterval: Double) {
        // code background animations here
        bgColor1(duration: durationInterval)
    }
    
    func bgColor1(duration: Double) {
        UIView.animate(withDuration: duration, animations: {
            self.view.backgroundColor = UIColor(red: 23/255, green: 135/255, blue: 136/255, alpha: 1)
        }) { (true) in
            self.bgColor2(duration: duration)
        }
    }
    
    func bgColor2(duration: Double) {
        UIView.animate(withDuration: duration, animations: {
            self.view.backgroundColor = UIColor(red: 255/255, green: 184/255, blue: 49/255, alpha: 1)
        }) { (true) in
            self.bgColor3(duration: duration)
        }
    }
    
    func bgColor3(duration: Double) {
        UIView.animate(withDuration: duration, animations: {
            self.view.backgroundColor = UIColor(red: 173/255, green: 172/255, blue: 8/255, alpha: 1)
        }) { (true) in
            self.bgColor1(duration: duration)
        }
    }
    
    func showClock() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (Timer) in
            self.currentTimeLabel.textColor = UIColor(white: 1, alpha: 0.25)
            self.currentTimeLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .short)
        }
    }
    
    //MARK: - Time Formatter Methods
    
    func timeString(time:TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.zeroFormattingBehavior = [ .dropAll ]
        let formattedDuration = formatter.string(from: time)
        return formattedDuration!
    }
    
    func formatTime(date:Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
}

extension Date {
    func adding(minutes: Int) -> Date {
        return Calendar.current.date(byAdding: .minute, value: minutes, to: self)!
    }
    
    func addSeconds(_ seconds: Int) -> Date {
        let seconds: TimeInterval = Double(seconds)
        let newDate: Date = self.addingTimeInterval(seconds)
        return newDate
    }
    
    func addMinutes(_ minutes: Int) -> Date {
        let seconds: TimeInterval = Double(minutes) * 60
        let newDate: Date = self.addingTimeInterval(seconds)
        return newDate
    }
    
}
