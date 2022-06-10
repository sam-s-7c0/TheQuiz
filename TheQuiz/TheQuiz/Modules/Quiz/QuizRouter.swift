//
//  QuizRouter.swift
//  TheQuiz
//
//  Created by Samina Shaikh on 10/06/2022.
//

import UIKit

class QuizRouter {
  // MARK: - Properties

  weak var presenter: QuizPresenter?

  // MARK: - Methods

  static func createModule() -> QuizViewController {
    let router = QuizRouter()
    let presenter = QuizPresenter()
    let interactor = QuizInteractor()
    let view = QuizViewController()

    presenter.interactor = interactor
    presenter.router = router
    presenter.view = view
    view.presenter = presenter
    interactor.presenter = presenter
    router.presenter = presenter

    return view
  }
}

// MARK: - QuizRouterInterface

extension QuizRouter: QuizRouterInterface {}
