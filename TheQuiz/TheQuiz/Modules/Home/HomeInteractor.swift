//
//  HomeInteractor.swift
//  TheQuiz
//
//  Created by Samina Shaikh on 10/06/2022.
//

import Foundation

class HomeInteractor {
  // MARK: - Properties

  weak var presenter: HomePresenterInterface?
}

// MARK: - HomeInteractorInterface

extension HomeInteractor: HomeInteractorInterface {}
