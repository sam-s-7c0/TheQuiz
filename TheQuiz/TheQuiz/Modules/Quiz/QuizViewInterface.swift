//
//  QuizViewInterface.swift
//  TheQuiz
//
//  Created by Samina Shaikh on 10/06/2022.
//

import UIKit

// MARK: - Presenter -> View

protocol QuizViewInterface: AnyObject {
  func updateQuestion(question: Question)
  func updateUICorrectAnswer(option: String)
  func updateUIWrongAnswer(option: String, correctOption: String)
  func resetOptions()
  func disableOptions()
  func enableOptions()
  func updateHeaderStatus(currentQuestionIndex: Int,
                          totalQuestionCount: Int,
                          totalScore: Int)
}

// MARK: - View -> Presenter

protocol QuizPresenterInterface: AnyObject {
  func viewDidLoad()
  func selectedOption(tag: Int)
}

// MARK: - Presenter -> Router

protocol QuizRouterInterface: AnyObject {
  func dismissQuiz()
}

// MARK: - Presenter -> Interactor

protocol QuizInteractorInterface: AnyObject {}
