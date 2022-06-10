//
//  HomeInteractor.swift
//  TheQuiz
//
//  Created by Samina Shaikh on 10/06/2022.
//

import Foundation

class HomeInteractor {
  // MARK: - Properties
  
  weak var presenter: HomePresenterInterface?
}

// MARK: - HomeInteractorInterface

extension HomeInteractor: HomeInteractorInterface {
  func downloadQuestions() {
    APIClient.shared.getQuestions { [weak self] result in
      switch result {
      case .success(let questions):
        self?.presenter?.questionsDownloaded(questions: questions)
      case .failure(let error):
        self?.presenter?.errorOccured(error: error)
      }
    }
  }
}
