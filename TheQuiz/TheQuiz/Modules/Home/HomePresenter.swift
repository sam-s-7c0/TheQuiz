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
  
  func viewDidLoad() {
    view?.disableStartGame()
    interactor?.downloadQuestions()
  }
  
  func viewWillAppear() {
    view?.updateHighestScore(highestScore: UserDefaults.standard.integer(forKey: "highestScore"))
  }
  
  func errorOccured(error: Error) {
    view?.showError(error: error.localizedDescription)
    
  }
  
  func questionsDownloaded(questions: [Question]) {
    self.questions = questions
    view?.enableStartGame()
  }
  
  
  
  func startGame() {
    router?.showGameView(questions: questions)
  }
}
