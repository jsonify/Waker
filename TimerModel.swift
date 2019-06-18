//
//  Timer.swift
//  Waker
//
//  Created by Jason Rueckert on 6/17/19.
//  Copyright © 2019 Jason Rueckert. All rights reserved.
//

import Foundation

class TimerModel {
    var id: String!
    var title: String!
    
    init(title: String) {
        id = UUID().uuidString
        self.title = title
    }
}
