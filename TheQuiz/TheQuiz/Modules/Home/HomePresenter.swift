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
}

// MARK: - HomePresenterInterface

extension HomePresenter: HomePresenterInterface {}
