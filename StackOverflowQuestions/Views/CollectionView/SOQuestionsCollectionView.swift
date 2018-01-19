//
//  SOQuestionsCollectionView.swift
//  StackOverflowQuestions
//
//  Created by Envoy on 1/18/18.
//  Copyright © 2018 Adam Ake. All rights reserved.
//

import UIKit

class SOQuestionsCollectionView: UICollectionView {
    
    var viewsWereLaidOut = false
    var questionsResponse: SOQuestionsResponse?
    
    enum Constants {
        static let questionCellReuseID = "SOQuestionCollectionViewCell"
        static let edgeInsets = UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
        static let defaultCellHeightWithNoText: CGFloat = 88.0
        static let titleTextSideInsets: CGFloat = 32.0 * 2
        static let titleTextFont = UIFont.systemFont(ofSize: 18)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        if !viewsWereLaidOut {
            viewsWereLaidOut = true
            
            self.contentInset = Constants.edgeInsets
            
            self.register(UINib(nibName: Constants.questionCellReuseID, bundle: nil),
                          forCellWithReuseIdentifier: Constants.questionCellReuseID)
        }
    }
    
    func setup(questionsResponse: SOQuestionsResponse) {
        self.questionsResponse = questionsResponse
        self.delegate = self
        self.dataSource = self
    }
}

extension SOQuestionsCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private func question(at index: Int) -> SOQuestion? {
        if let questionsResponse = questionsResponse {
            if index < questionsResponse.items.count {
                let question = questionsResponse.items[index]
                return question
            }
        }
        return nil
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questionsResponse?.items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Adjusting cell size depending on amount of text in the question title.
        if let question = self.question(at: indexPath.item) {
            let textHeight = question.title.height(withConstrainedWidth: self.frame.width - Constants.titleTextSideInsets, font: Constants.titleTextFont)
            return CGSize.init(width: collectionView.frame.width, height: Constants.defaultCellHeightWithNoText + textHeight)
        }
        return CGSize(width: collectionView.frame.width, height: Constants.defaultCellHeightWithNoText)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.questionCellReuseID, for: indexPath)
            as? SOQuestionCollectionViewCell {
            
            if let question = self.question(at: indexPath.item) {
                cell.setup(question: question)
            }
            
            return cell
        }
        
        return UICollectionViewCell()
    }
}
