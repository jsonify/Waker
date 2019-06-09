//
//  SettingsTools.swift
//  Waker
//
//  Created by Jason on 6/6/18.
//  Copyright © 2018 Jason Rueckert. All rights reserved.
//

import UIKit

class SettingsTool {

    func reviewApp() {
        let appID = "1403390894"
        let urlStr: String = "itms-apps://itunes.apple.com/us/app/appName/id\(appID)?mt=8&action=write-review"
        
        if let url = URL(string: urlStr), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
}
