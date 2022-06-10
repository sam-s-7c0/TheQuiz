//
//  QuizPresenter.swift
//  TheQuiz
//
//  Created by Samina Shaikh on 10/06/2022.
//

import UIKit

class QuizPresenter {
  // MARK: - Properties

  weak var view: QuizViewInterface?
  var interactor: QuizInteractorInterface?
  var router: QuizRouterInterface?
}

// MARK: - QuizPresenterInterface

extension QuizPresenter: QuizPresenterInterface {}
