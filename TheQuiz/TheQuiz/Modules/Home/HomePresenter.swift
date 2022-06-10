//
//  HomePresenter.swift
//  TheQuiz
//
//  Created by Samina Shaikh on 10/06/2022.
//

import UIKit

class HomePresenter {
  // MARK: - Properties
  
  weak var view: HomeViewInterface?
  var interactor: HomeInteractorInterface?
  var router: HomeRouterInterface?
  
  
  // MARK: Variables
  var questions: [Question] = []
}

// MARK: - HomePresenterInterface

extension HomePresenter: HomePresenterInterface {
  func errorOccured(error: Error) {
    view?.showError(error: error.localizedDescription)
    
  }
  
  func questionsDownloaded(questions: [Question]) {
    self.questions = questions
    view?.enableStartGame()
  }
  
  func viewDidLoad() {
    view?.disableStartGame()
    view?.hideScore()

    interactor?.downloadQuestions()
  }
  
  func startGame() {
    router?.showGameView(questions: questions)
  }
}
