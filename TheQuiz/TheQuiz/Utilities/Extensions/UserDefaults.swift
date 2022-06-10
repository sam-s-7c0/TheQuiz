//
//  UserDefaults.swift
//  TheQuiz
//
//  Created by Samina Shaikh on 10/06/2022.
//

import Foundation

extension UserDefaults {
    
  func valueExists(forKey key: String) -> Bool {
    return object(forKey: key) != nil
  }
  
  func saveScore(currentScore: Int) {
    if UserDefaults.standard.valueExists(forKey: "highestScore") {
      let lastScore = UserDefaults.standard.integer(forKey: "highestScore")
      if currentScore > lastScore {
        UserDefaults.standard.set(currentScore, forKey: "highestScore")
      }
    } else {
      UserDefaults.standard.set(currentScore, forKey: "highestScore")
    }
  }
}
