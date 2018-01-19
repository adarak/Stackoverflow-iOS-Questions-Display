//
//  SOQuestionsViewController.swift
//  StackOverflowQuestions
//
//  Created by Envoy on 1/18/18.
//  Copyright © 2018 Adam Ake. All rights reserved.
//

import UIKit

class SOQuestionsViewController: UIViewController {

    @IBOutlet weak fileprivate var collectionView: SOQuestionsCollectionView!
    
    var session = SOService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Newest Questions Mentioning iOS"
        
        // setting up collectionview after retrieving response
        self.session.getTopQuestions().then(execute: { [weak self] (questionsResponse) -> Void in
            self?.collectionView.setup(questionsResponse: questionsResponse)
        }).catch(execute: { (error) in
            print(error)
        })
    }
}
