//
//  OnboardingViewController.swift
//  Waker
//
//  Created by Jason on 7/3/18.
//  Copyright © 2018 Jason Rueckert. All rights reserved.
//

import UIKit
import paper_onboarding

class OnboardingViewController: UIViewController, PaperOnboardingDataSource, PaperOnboardingDelegate {

    

    @IBOutlet weak var onboardingView: OnboardingView!
    
    @IBOutlet weak var getStartedButton: UIButton!
    
    fileprivate let items = [
        OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "wakeUpTime1"),
                           title: "WakeUp Time",
                           description: "Start by setting your preferred wake up time.",
                           pageIcon: #imageLiteral(resourceName: "particle1"),
                           color: UIColor(red: 17/255, green: 57/255, blue: 71/255, alpha: 1),
                           titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descriptionFont),
        
        OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "prewakeTimer1"),
                           title: "PreWake Timer",
                           description: "This setting is for the color bars leading up to the Wake Up time.",
                           pageIcon: #imageLiteral(resourceName: "particle1"),
                           color: UIColor(red: 44/255, green: 135/255, blue: 136/255, alpha: 1),
                           titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descriptionFont),
        
        OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "wakeScreenDuration1"),
                           title: "Wake Up Screen Duration",
                           description: "This timer is to set how long the Wake Up screen is shown.",
                           pageIcon: #imageLiteral(resourceName: "particle1"),
                           color: UIColor(red: 146/255, green: 179/255, blue: 0/255, alpha: 1),
                           titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descriptionFont),
        
        OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "settings1"),
                           title: "Settings",
                           description: "Adjust some of the audio or visual settings to fine tune your Waker experience.",
                           pageIcon: #imageLiteral(resourceName: "particle1"),
                           color: UIColor(red: 247/255, green: 172/255, blue: 0/255, alpha: 1),
                           titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descriptionFont),
        
        OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "start1"),
                           title: "Start",
                           description: "Push START and you're all set!",
                           pageIcon: #imageLiteral(resourceName: "particle1"),
                           color: UIColor(red: 215/255, green: 56/255, blue: 88/255, alpha: 1),
                           titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descriptionFont),
        ]
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        onboardingView.dataSource = self
        onboardingView.delegate = self


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func gotStartedButton(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: "onboardingComplete")
    }
    
    func onboardingItemsCount() -> Int {
        return 5
    }
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        return items[index]
    }

    func onboardingConfigurationItem(_: OnboardingContentViewItem, index _: Int) {
        
    }
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        if index == 3 {
            if self.getStartedButton.alpha == 1 {
                UIView.animate(withDuration: 0.2) {
                    self.getStartedButton.alpha = 0
                }
            }
        }
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        if index == 4 {
            UIView.animate(withDuration: 0.4) {
                self.getStartedButton.alpha = 1
            }
        }
    }
}

extension OnboardingViewController {
    
    private static let titleFont = UIFont(name: "AvenirNext-Bold", size: 24.0) ?? UIFont.boldSystemFont(ofSize: 36.0)
    private static let descriptionFont = UIFont(name: "AvenirNext-Regular", size: 18.0) ?? UIFont.systemFont(ofSize: 14.0)
}
