//
//  QuizViewController.swift
//  TheQuiz
//
//  Created by Samina Shaikh on 10/06/2022.
//

import UIKit

class QuizViewController: UIViewController {
  // MARK: - Properties

  var presenter: QuizPresenterInterface?
}

// MARK: - QuizViewInterface

extension QuizViewController: QuizViewInterface {}

extension QuizViewController: Instantiable {
  static var storyboardName: StringConvertible {
    StoryboardName.quiz
  }
}
