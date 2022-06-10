//
//  HomeRouter.swift
//  TheQuiz
//
//  Created by Samina Shaikh on 10/06/2022.
//

import UIKit

class HomeRouter {
  // MARK: - Properties
  
  weak var presenter: HomePresenter?
  
  // MARK: - Methods
  
  static func createModule() -> HomeViewController {
    let router = HomeRouter()
    let presenter = HomePresenter()
    let interactor = HomeInteractor()
    let view = HomeViewController.instantiateFromStoryboard()
    
    
    presenter.interactor = interactor
    presenter.router = router
    presenter.view = view
    view.presenter = presenter
    interactor.presenter = presenter
    router.presenter = presenter
    
    return view
  }
}

// MARK: - HomeRouterInterface

extension HomeRouter: HomeRouterInterface {
  func showGameView() {
    //
  }
}
