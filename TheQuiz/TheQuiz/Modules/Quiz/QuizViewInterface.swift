//
//  QuizViewInterface.swift
//  TheQuiz
//
//  Created by Samina Shaikh on 10/06/2022.
//

import UIKit

// MARK: - Presenter -> View

protocol QuizViewInterface: AnyObject {}

// MARK: - View -> Presenter

protocol QuizPresenterInterface: AnyObject {}

// MARK: - Presenter -> Router

protocol QuizRouterInterface: AnyObject {}

// MARK: - Presenter -> Interactor

protocol QuizInteractorInterface: AnyObject {}
