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
}

// MARK: - View -> Presenter

protocol QuizPresenterInterface: AnyObject {
  func viewDidLoad()
  func selectedOption(tag: Int)
}

// MARK: - Presenter -> Router

protocol QuizRouterInterface: AnyObject {}

// MARK: - Presenter -> Interactor

protocol QuizInteractorInterface: AnyObject {}
