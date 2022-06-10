//
//  QuizInteractor.swift
//  TheQuiz
//
//  Created by Samina Shaikh on 10/06/2022.
//

import Foundation

class QuizInteractor {
  // MARK: - Properties

  weak var presenter: QuizPresenterInterface?
}

// MARK: - QuizInteractorInterface

extension QuizInteractor: QuizInteractorInterface { }
