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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    presenter?.viewDidLoad()
  }
  
  @IBAction func didTapAnswer(_ sender: UIButton) {
    presenter?.selectedOption(tag: sender.tag)
  }
}

// MARK: - QuizViewInterface

extension QuizViewController: QuizViewInterface {
  func updateQuestion(question: Question) {
    
  }
}

extension QuizViewController: Instantiable {
  static var storyboardName: StringConvertible {
    StoryboardName.quiz
  }
}
