//
//  APIClient.swift
//  TheQuiz
//
//  Created by Samina Shaikh on 10/06/2022.
//

import Foundation

//TODO: Remove ! to avoid crash
//TODO: Remove remove print statements

public class APIClient {
    
    static let shared = APIClient()
    
    func getQuestions(completionHandler:@escaping (Result<[Question], Error>)->()) {
        
        let url = URL(string: "https://app.check24.de/vg2-quiz/quiz.json")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(Response.self, from: data) {
                    completionHandler(.success(response.questions))
                } else {
                    completionHandler(.failure(error!))
                    print("Invalid Response")
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }
        
        task.resume()
    }
}
