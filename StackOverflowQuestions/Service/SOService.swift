//
//  SOService.swift
//  StackOverflowQuestions
//
//  Created by Envoy on 1/18/18.
//  Copyright © 2018 Adam Ake. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import PromiseKit

struct SOService {
    
    enum Constants {
        static let topQuestionsURL = "https://api.stackexchange.com/2.2/questions?order=desc&sort=activity&tagged=ios&site=stackoverflow"
    }
    
    func getTopQuestions() -> Promise<SOQuestionsResponse> {
        return Promise { fulfill, reject in
            Alamofire.request(Constants.topQuestionsURL).responseData(completionHandler: { (response) in
                
                switch response.result {
                case .success(_):
                    if let data = response.data {
                        if let questionResponse = self.questionsResponseDecoded(data: data) {
                            fulfill(questionResponse)
                        }
                    }
                    
                case .failure(let error):
                    reject(error)
                }
            })
        }
    }
    
    func getImage(url: String) -> Promise<Image> {
        return Promise { fulfill, reject in
            Alamofire.request(url).responseImage(completionHandler: { (response) in
                if let image = response.result.value {
                    fulfill(image)
                } else {
                    if let error = response.error {
                        reject(error)
                    }
                }
            })
        }
    }
    
    private func questionsResponseDecoded(data: Data) -> SOQuestionsResponse? {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(SOQuestionsResponse.self, from: data)
        } catch _ {
            return nil
        }
    }
}
