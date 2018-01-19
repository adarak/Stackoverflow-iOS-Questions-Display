//
//  SONavigationController.swift
//  StackOverflowQuestions
//
//  Created by Envoy on 1/18/18.
//  Copyright © 2018 Adam Ake. All rights reserved.
//

import UIKit

class SONavigationController: UINavigationController {
    
    enum Constants {
        static let barColor = UIColor(red: 255.0/255.0, green: 120.0/255.0, blue: 20.0/255.0, alpha: 1.0)
        static let textAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // styling the navigation bar
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = Constants.textAttributes
        UINavigationBar.appearance().largeTitleTextAttributes = Constants.textAttributes
        UINavigationBar.appearance().barTintColor = Constants.barColor
        
        // setting the questions view controller as rootviewcontroller.
        let questionsController = SOQuestionsViewController()
        self.viewControllers = [questionsController]
    }
}
