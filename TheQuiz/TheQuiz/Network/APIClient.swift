//
//  APIClient.swift
//  TheQuiz
//
//  Created by Samina Shaikh on 10/06/2022.
//

import Foundation

public class APIClient {
  
  static let shared = APIClient()
  
  func getQuestions(completionHandler:@escaping (Result<[Question], Error>)->()) {
    
    guard let url = URL(string: "https://app.check24.de/vg2-quiz/quiz.json") else {
      let urlError = NSError(domain:"",
                             code:1000,
                             userInfo:[NSLocalizedDescriptionKey: "Invalid URL"])
      completionHandler(.failure(urlError))
      return
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      if let data = data {
        if let response = try? JSONDecoder().decode(Response.self, from: data) {
          completionHandler(.success(response.questions))
        } else {
          completionHandler(.failure(error!))
        }
      } else if let error = error {
        completionHandler(.failure(error))
      }
    }
    
    task.resume()
  }
}
