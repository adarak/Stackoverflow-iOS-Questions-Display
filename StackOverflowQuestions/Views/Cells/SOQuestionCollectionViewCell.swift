//
//  SOQuestionCollectionViewCell.swift
//  StackOverflowQuestions
//
//  Created by Envoy on 1/18/18.
//  Copyright © 2018 Adam Ake. All rights reserved.
//

import UIKit

class SOQuestionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak fileprivate var titleLabel: UILabel!
    @IBOutlet weak fileprivate var topTagTitleLabel: UILabel!
    @IBOutlet weak fileprivate var userImageView: UIImageView!
    @IBOutlet weak fileprivate var userNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(question: SOQuestion) {
        DispatchQueue.main.async {
            self.titleLabel.text = question.title
            self.userNameLabel.text = question.owner.displayName
            
            // displaying the main tag for the question in the cell
            if !question.tags.isEmpty {
                self.topTagTitleLabel.text = question.tags.first
            }
            
            // getting user profile image
            let service = SOService()
            service.getImage(url: question.owner.profileImageURL).then(execute: { [weak self] (image) -> Void in
                if let `self` = self {
                    UIView.transition(with: self.userImageView, duration: 0.2, options: .curveLinear, animations: {
                        self.userImageView.image = image
                    }, completion: nil)
                }
            }).catch(execute: { (error) in
                print(error)
            })
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.titleLabel.text = ""
        self.topTagTitleLabel.text = ""
        self.userImageView.image = nil
        self.userNameLabel.text = ""
    }
}
