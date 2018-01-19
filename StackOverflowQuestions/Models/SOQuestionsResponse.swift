//
//  SOQuestionsResponse.swift
//  StackOverflowQuestions
//
//  Created by Envoy on 1/18/18.
//  Copyright © 2018 Adam Ake. All rights reserved.
//

import UIKit

struct SOQuestionsResponse: Decodable {

    var items: [SOQuestion]
    
    enum CodingKeys: String, CodingKey {
        case items
    }
}
