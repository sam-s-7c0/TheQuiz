//
//  HomeInterface.swift
//  TheQuiz
//
//  Created by Samina Shaikh on 10/06/2022.
//

import UIKit

// MARK: - Presenter -> View

protocol HomeViewInterface: AnyObject {
  func disableStartGame()
  func enableStartGame()
  func showError(error: String)
  func showScore()
  func hideScore()
  func updateScore(score: String)
  func updateHighestScore(highestScore: Int)
}

// MARK: - View -> Presenter

protocol HomePresenterInterface: AnyObject {
  func viewDidLoad()
  func viewWillAppear()
  func startGame()
  func questionsDownloaded(questions: [Question])
  func errorOccured(error: Error)
}

// MARK: - Presenter -> Router

protocol HomeRouterInterface: AnyObject {
  func showGameView(questions: [Question])
}

// MARK: - Presenter -> Interactor

protocol HomeInteractorInterface: AnyObject {
  func downloadQuestions()
}
