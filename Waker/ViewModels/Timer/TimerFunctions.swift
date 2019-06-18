//
//  TimerFunctions.swift
//  Waker
//
//  Created by Jason Rueckert on 6/17/19.
//  Copyright © 2019 Jason Rueckert. All rights reserved.
//

import Foundation

class TimerFunctions {
    static func createTimer(timerModel: TimerModel) {
        
    }
    
    static func readTimers() {
        if Data.timerModels.count == 0 {
            Data.timerModels.append(TimerModel(title: "7:00 am"))
            Data.timerModels.append(TimerModel(title: "10:00 am"))
            Data.timerModels.append(TimerModel(title: "3:30 pm"))
        } 
    }
    
    static func updateTimer(timerModel: TimerModel) {
        
    }
    
    static func deleteTimer(timerModel: TimerModel) {
        
    }
}
