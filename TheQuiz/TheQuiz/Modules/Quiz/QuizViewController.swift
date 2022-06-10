//
//  QuizViewController.swift
//  TheQuiz
//
//  Created by Samina Shaikh on 10/06/2022.
//

import UIKit

class QuizViewController: UIViewController {
  // MARK: - Properties
  
  @IBOutlet private weak var labelTotalScore: UILabel!
  @IBOutlet private weak var labelScore: UILabel!
  @IBOutlet private weak var imageQuiz: UIImageView!
  @IBOutlet private weak var labelQuiz: UILabel!
  
  @IBOutlet private weak var optionA: RectBorderButton!
  @IBOutlet private weak var optionB: RectBorderButton!
  @IBOutlet private weak var optionC: RectBorderButton!
  @IBOutlet private weak var optionD: RectBorderButton!
  
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
  func updateHeaderStatus(currentQuestionIndex: Int,
                          totalQuestionCount: Int,
                          totalScore: Int) {
    labelTotalScore.text = "Frage \(currentQuestionIndex)/\(totalQuestionCount) - Akutelle Punktzahl: \(totalScore)"
  }
  
  
  func disableOptions() {
    optionA.isUserInteractionEnabled = false
    optionB.isUserInteractionEnabled = false
    optionC.isUserInteractionEnabled = false
    optionD.isUserInteractionEnabled = false
  }
  
  func enableOptions() {
    optionA.isUserInteractionEnabled = true
    optionB.isUserInteractionEnabled = true
    optionC.isUserInteractionEnabled = true
    optionD.isUserInteractionEnabled = true
  }
  
  func updateQuestion(question: Question) {
    
    labelQuiz.text = question.question
    labelScore.text = "\(question.score) Punkte"
    
    optionA.setTitle(question.answers.a, for: .normal)
    optionB.setTitle(question.answers.b, for: .normal)
    optionC.setTitle(question.answers.c, for: .normal)
    optionD.setTitle(question.answers.d, for: .normal)
    
    if let imageURL = question.questionImageURL {
      imageQuiz.downloaded(from: imageURL)
    }
  }
  
  func updateUICorrectAnswer(option: String) {
    switch option {
    case "A":
      optionA.borderColor = .green
    case "B":
      optionB.borderColor = .green
    case "C":
      optionC.borderColor = .green
    case "D":
      optionD.borderColor = .green
    default:
      break
    }
  }
  
  func updateUIWrongAnswer(option: String) {
    switch option {
    case "A":
      optionA.borderColor = .red
    case "B":
      optionB.borderColor = .red
    case "C":
      optionC.borderColor = .red
    case "D":
      optionD.borderColor = .red
    default:
      break
    }
  }
  
  func resetOptions() {
    optionA.borderColor = .gray
    optionB.borderColor = .gray
    optionC.borderColor = .gray
    optionD.borderColor = .gray
  }
}

extension QuizViewController: Instantiable {
  static var storyboardName: StringConvertible {
    StoryboardName.quiz
  }
}
