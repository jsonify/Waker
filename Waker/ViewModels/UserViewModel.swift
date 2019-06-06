//
//  UserViewModel.swift
//  Waker
//
//  Created by Jason on 7/7/18.
//  Copyright © 2018 Jason Rueckert. All rights reserved.
//

import Foundation

class UserViewModel {
    var isWakeUpTimeSaved: Bool = false
    var isPreWakeSaved: Bool = false
    var isDurationSaved: Bool = false
}

extension UserViewModel {
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
