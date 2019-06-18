//
//  Timer.swift
//  Waker
//
//  Created by Jason Rueckert on 6/17/19.
//  Copyright © 2019 Jason Rueckert. All rights reserved.
//

import Foundation

class TimerModel {
    let id: UUID
    var title: String!
    
    init(title: String) {
        id = UUID()
        self.title = title
    }
}
