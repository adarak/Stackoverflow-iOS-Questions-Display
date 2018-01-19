//
//  SOQuestion.swift
//  StackOverflowQuestions
//
//  Created by Envoy on 1/18/18.
//  Copyright © 2018 Adam Ake. All rights reserved.
//

import Foundation

struct SOQuestion: Decodable {
    
    var tags: [String]
    var owner: SOQuestionOwner
    var isAnswered: Bool
    var viewCount: Int
    var answerCount: Int
    var title: String
    
    enum CodingKeys: String, CodingKey {
        case tags
        case owner
        case isAnswered = "is_answered"
        case viewCount = "view_count"
        case answerCount = "answer_count"
        case title
    }
    
}
