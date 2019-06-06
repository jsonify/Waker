//
//  DatePopupViewController.swift
//  Waker
//
//  Created by Jason on 5/27/18.
//  Copyright © 2018 Jason Rueckert. All rights reserved.
//

import UIKit

class DatePopupViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBAction func backgroundButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    // To distinguish between the wake time and the preWake time
    var preWakeUpTimePicker: Bool = false
    var wakeUpTimePicker: Bool = false
    var wakeDurationPicker: Bool = false
    
    // To use a function as a variable down later to be called as closure in a different VC
    var onSave: ((_ data: String) -> ())?
    
    let defaults = UserDefaults.standard
    let wakeUpTimeKey = "wakeUpTime"
    let preWakeDurationKey = "preWakeDuration"
    let wakeDurationKey = "wakeDuration"
    
    //MARK: - TODO Features
    
    //MARK: - UI Enhancements
    
    //MARK: - View Loading Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // To switch the attributes for the preWake timer
        if wakeUpTimePicker {
            titleLabel.text = "Time"
            titleLabel.backgroundColor = UIColor(red: 102/255, green: 186/255, blue: 182/255, alpha: 1.0)
            datePicker.datePickerMode = .time
            saveButton.setTitle("Save Time", for: .normal)
        } else if preWakeUpTimePicker {
            titleLabel.text = "Duration"
            titleLabel.backgroundColor = UIColor(red: 67/255, green: 155/255, blue: 190/255, alpha: 1.0)
            datePicker.datePickerMode = .countDownTimer
            saveButton.setTitle("Save Duration", for: .normal)
        } else if wakeDurationPicker {
            titleLabel.text = "Duration"
            titleLabel.backgroundColor = UIColor(red: 76/255, green: 116/255, blue: 164/255, alpha: 1.0)
            datePicker.datePickerMode = .countDownTimer
            saveButton.setTitle("Save Duration", for: .normal)
        }
    }
    
    @IBAction func saveDate_TouchUpInside(_ sender: UIButton) {
        // To display the proper string output of popup
        if preWakeUpTimePicker {
            onSave?(timeString(time: datePicker.countDownDuration))
            let preWakeDuration = datePicker.countDownDuration
            UserDefaults().set(preWakeDuration, forKey: preWakeDurationKey)
        } else if wakeUpTimePicker{
            onSave?(formatTime(date: datePicker.date))
            let wakeUpTimeValue = datePicker.date
            UserDefaults().set(wakeUpTimeValue, forKey: wakeUpTimeKey)
        } else if wakeDurationPicker {
            onSave?(timeString(time: datePicker.countDownDuration))
            let wakeDurationValue = datePicker.countDownDuration
            UserDefaults().set(wakeDurationValue, forKey: wakeDurationKey)
        }
        // To close the VC
        dismiss(animated: true)
    }
    
    // MARK: - Time Conversion Methods
    func timeString(time:TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .brief
        formatter.allowedUnits = [.hour, .minute]
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
