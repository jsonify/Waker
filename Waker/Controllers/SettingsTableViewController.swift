//
//  SettingsTableViewController.swift
//  Waker
//
//  Created by Jason on 6/10/18.
//  Copyright © 2018 Jason Rueckert. All rights reserved.
//

import UIKit
import StoreKit


class SettingsTableViewController: UITableViewController {

    @IBOutlet weak var showClock: UISwitch!
    @IBOutlet weak var enableSoundSwitch: UISwitch!
    @IBOutlet weak var hideBackButton: UISwitch!
    @IBOutlet weak var flipMode: UISwitch!
    
    @IBOutlet weak var particlesSwitch: UISwitch!
    @IBOutlet weak var gradientSlider: UISlider!
    
    let defaults = UserDefaults.standard
    let clockSwitchStateKey = "clockSwitchState"
    let gradientSliderValueKey = "gradientSliderValue"
    let backButtonStateKey = "backButtonState"
    let enableSoundSwitchStateKey = "enableSoundSwitchState"
    let flipModeSwitchKey = "flipModeSwitchState"
    let particlesSwitchStateKey = "particlesSwitchState"
    
    private var settingsTool = SettingsTool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showClock.isOn = defaults.bool(forKey: clockSwitchStateKey)
        enableSoundSwitch.isOn = defaults.bool(forKey: enableSoundSwitchStateKey)
        gradientSlider.value = defaults.float(forKey: gradientSliderValueKey)
        hideBackButton.isOn = defaults.bool(forKey: backButtonStateKey)
        flipMode.isOn = defaults.bool(forKey: flipModeSwitchKey)
        particlesSwitch.isOn = defaults.bool(forKey: particlesSwitchStateKey)
    }

    override func viewDidAppear(_ animated: Bool) {
        guard let navBar = navigationController?.navigationBar else { fatalError("Navigation controller does not exist")}
        
        navBar.barTintColor = UIColor.orange
    }
    @IBAction func reviewAction(_ sender: UIButton) {

        settingsTool.reviewApp()
    }
    
    @IBAction func showClockPressed(_ sender: UISwitch) {
        if showClock.isOn {
            showClock.isOn = false
            self.defaults.set(false, forKey: clockSwitchStateKey)
        } else {
            showClock.isOn = true
            self.defaults.set(true, forKey: clockSwitchStateKey)
        }
    }
    
    @IBAction func gradientChanged(_ sender: UISlider) {
        defaults.set(gradientSlider.value, forKey: gradientSliderValueKey)
    }
    
    @IBAction func hideBackButtonPressed(_ sender: Any) {
        if hideBackButton.isOn {
            hideBackButton.isOn = false
            self.defaults.set(false, forKey: backButtonStateKey)
        } else {
            hideBackButton.isOn = true
            self.defaults.set(true, forKey: backButtonStateKey)
        }
    }
    
    @IBAction func enableSoundPressed(_ sender: UISwitch) {
        if enableSoundSwitch.isOn {
            enableSoundSwitch.isOn = false
            self.defaults.set(false, forKey: enableSoundSwitchStateKey)
        } else {
            enableSoundSwitch.isOn = true
            self.defaults.set(true, forKey: enableSoundSwitchStateKey)
        }
    }
    
    @IBAction func flipModePressed(_ sender: Any) {
        if flipMode.isOn {
            flipMode.isOn = false
            self.defaults.set(false, forKey: flipModeSwitchKey)
        } else {
            flipMode.isOn = true
            self.defaults.set(true, forKey: flipModeSwitchKey)
        }
    }
    
    @IBAction func enableParticlesPressed(_ sender: Any) {
        if particlesSwitch.isOn {
            particlesSwitch.isOn = false
            self.defaults.set(false, forKey: particlesSwitchStateKey)
        } else {
            particlesSwitch.isOn = true
            self.defaults.set(true, forKey: particlesSwitchStateKey)
        }
    }
    
}
