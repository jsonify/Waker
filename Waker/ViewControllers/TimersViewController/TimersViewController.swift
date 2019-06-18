//
//  SettingsViewController.swift
//  Waker
//
//  Created by Jason on 5/7/18.
//  Copyright © 2018 Jason Rueckert. All rights reserved.
//

import UIKit


class TimersViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var preWakeTimeLabel: UILabel!
    @IBOutlet weak var wakeDurationTextLabel: UILabel!
    
    private var viewModel = UserViewModel()
    
    let defaults = UserDefaults.standard
    let wakeUpTimeKey = "wakeUpTime"
    let preWakeDurationKey = "preWakeDuration"
    let wakeDurationKey = "wakeDuration"

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

//        UIApplication.shared.statusBarStyle = .lightContent

    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

//        UIApplication.shared.statusBarStyle = .default
    }

    
    //MARK: - View Loading Methods 
    override func viewDidLoad() {
        super.viewDidLoad()
                
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()

        

        if defaults.object(forKey: preWakeDurationKey) != nil {
            if let preWakeDurationValue = defaults.object(forKey: preWakeDurationKey) as? TimeInterval {
                viewModel.isPreWakeSaved = true
                preWakeTimeLabel.text = viewModel.timeString(time: preWakeDurationValue)
            }
        }
        
        if defaults.object(forKey: wakeUpTimeKey) != nil {
            if let wakeUpTimeValue = defaults.object(forKey: wakeUpTimeKey) as? Date {
                viewModel.isWakeUpTimeSaved = true
                timeLabel.text = viewModel.formatTime(date: wakeUpTimeValue)
            } 
        }
        
        if defaults.object(forKey: wakeDurationKey) != nil {
            if let wakeDurationValue = defaults.object(forKey: wakeDurationKey) as? TimeInterval {
                viewModel.isDurationSaved = true
                wakeDurationTextLabel.text = viewModel.timeString(time: wakeDurationValue)
            } else {
                wakeDurationTextLabel.text = "Click to Set"
            }
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "sendDataForwards", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDatePopupViewControllerSegue" {
            let popup = segue.destination as! DatePopupViewController
            popup.wakeUpTimePicker = true
            // 1. Using a function to save data
            popup.onSave = onSaveTime
        }
        if segue.identifier == "toPreWakeTimePopupViewControllerSegue" {
            let popup = segue.destination as! DatePopupViewController
            popup.preWakeUpTimePicker = true
            // 2. Using a closure to save data
            popup.onSave = { (data) in
                self.preWakeTimeLabel.text = data
            }
        }
        if segue.identifier == "toWakeDurationPopupViewControllerSegue" {
            let popup = segue.destination as! DatePopupViewController
            popup.wakeDurationPicker = true
            // 2. Using a closure to save data
            popup.onSave = { (data) in
                self.wakeDurationTextLabel.text = data
            }
        }
    }

    func onSaveTime(_ data: String) -> () {
        timeLabel.text = data
    }
}
