//
//  SOQuestionOwner.swift
//  StackOverflowQuestions
//
//  Created by Envoy on 1/18/18.
//  Copyright © 2018 Adam Ake. All rights reserved.
//

import Foundation

struct SOQuestionOwner: Decodable {
    
    var displayName: String
    var profileImageURL: String
    
    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case profileImageURL = "profile_image"
    }
}
