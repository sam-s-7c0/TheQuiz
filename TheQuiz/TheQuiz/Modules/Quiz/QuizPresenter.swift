//
//  QuizPresenter.swift
//  TheQuiz
//
//  Created by Samina Shaikh on 10/06/2022.
//

import UIKit


enum Options :String{
  case A
  case B
  case C
  case D
}

class QuizPresenter {
  // MARK: - Properties
  
  weak var view: QuizViewInterface?
  var interactor: QuizInteractorInterface?
  var router: QuizRouterInterface?
  
  // MARK: Variables
  var questions: [Question] = []
  var questionIndex: Int = 0
  var totalScore: Int = 0
  
  
  private func checkIfAnswerIsCorrect(option: Options) {
    if option.rawValue == questions[questionIndex].correctAnswer {
      //This is correct answer
      updateScore()
    } else {
      //This is wrong answer
    }
    
    questionIndex+=1
  }
  
  private func updateScore() {
    let scorePerQuestion = questions[questionIndex].score
    totalScore += scorePerQuestion
  }
  
  private func moveToNextQuestion() {
    let question = questions[questionIndex]
    view?.updateQuestion(question: question)
  }
}

// MARK: - QuizPresenterInterface

extension QuizPresenter: QuizPresenterInterface {
  
  func viewDidLoad() {
    
  }
  
  func selectedOption(tag: Int) {
    switch tag  {
    case 1:
      self.checkIfAnswerIsCorrect(option: Options.A)
    case 2:
      self.checkIfAnswerIsCorrect(option: Options.B)
    case 3:
      self.checkIfAnswerIsCorrect(option: Options.C)
    case 4:
      self.checkIfAnswerIsCorrect(option: Options.D)
    default:
      //Default
      break
    }
  }
}
