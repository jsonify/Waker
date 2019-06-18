//
//  AppDelegate.swift
//  Waker
//
//  Created by Jason on 5/7/18.
//  Copyright © 2018 Jason Rueckert. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let defaults = UserDefaults.standard
    let wakeUpTimeKey = "wakeUpTime"
    let preWakeDurationKey = "preWakeDuration"
    let wakeDurationKey = "wakeDuration"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
       
//        window = UIWindow(frame: UIScreen.main.bounds)
//        
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        var initialViewController = sb.instantiateViewController(withIdentifier: "Onboarding")
//        
//        let defaults = UserDefaults.standard
//        
//        if defaults.bool(forKey: "onboardingComplete") {
//            initialViewController = sb.instantiateViewController(withIdentifier: "Mainapp")
//        }
//        
//        window?.rootViewController = initialViewController
//        window?.makeKeyAndVisible()
//        
//        let launchedBefore = defaults.bool(forKey: "launchedBefore")
//        if !launchedBefore
//        {
//            print("First launch")
//            UserDefaults.standard.set(true, forKey: "launchedBefore")
//            let preWakeDuration: TimeInterval = 60
//            let wakeUpTimeValue: Date = Date()
//            let wakeDurationValue: TimeInterval = 60
//            defaults.set(preWakeDuration, forKey: preWakeDurationKey)
//            defaults.set(wakeUpTimeValue, forKey: wakeUpTimeKey)
//            defaults.set(wakeDurationValue, forKey: wakeDurationKey)
//        }
       
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

