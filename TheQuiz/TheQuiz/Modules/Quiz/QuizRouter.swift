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
  
  static func createModule(questions: [Question]) -> QuizViewController {
    let router = QuizRouter()
    let presenter = QuizPresenter()
    let interactor = QuizInteractor()
    let view = QuizViewController.instantiateFromStoryboard()
    
    presenter.interactor = interactor
    presenter.router = router
    presenter.view = view
    
    presenter.questions = questions
    
    view.presenter = presenter
    interactor.presenter = presenter
    router.presenter = presenter
    
    return view
  }
}

// MARK: - QuizRouterInterface

extension QuizRouter: QuizRouterInterface {}
