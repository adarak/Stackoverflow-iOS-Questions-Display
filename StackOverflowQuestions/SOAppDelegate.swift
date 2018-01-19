//
//  SOAppDelegate.swift
//  StackOverflowQuestions
//
//  Created by Envoy on 1/18/18.
//  Copyright © 2018 Adam Ake. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let screenBounds = UIScreen.main.bounds
        let appWindow = UIWindow(frame: screenBounds)
        let rootNavigationController = SONavigationController()
        appWindow.rootViewController = rootNavigationController
        appWindow.makeKeyAndVisible()
        self.window = appWindow
        
        return true
    }
}

