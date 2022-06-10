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
  
  var totalQuestionCount: Int {
    questions.count
  }
  
  var currentQuestionIndex: Int {
    questionIndex+1
  }
  
  private func checkIfAnswerIsCorrect(option: Options) {
    if option.rawValue == questions[questionIndex].correctAnswer {
      //This is correct answer
      updateScore()
      view?.updateUICorrectAnswer(option: option.rawValue)
    } else {
      //This is wrong answer
      view?.updateUIWrongAnswer(option: option.rawValue,
                                correctOption: questions[questionIndex].correctAnswer)
    }
    
    questionIndex+=1
    
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2.0) {
      self.moveToNextQuestion()
    }
  }
  
  private func updateScore() {
    let scorePerQuestion = questions[questionIndex].score
    totalScore += scorePerQuestion
  }
  
  private func moveToNextQuestion() {
    
    if questionIndex == questions.count-1 {
      UserDefaults.standard.saveScore(currentScore: totalScore)
      router?.dismissQuiz()
    }
    
    view?.enableOptions()
    view?.resetOptions()
    
    let question = questions[questionIndex]
    view?.updateQuestion(question: question)
    
    view?.updateHeaderStatus(currentQuestionIndex: currentQuestionIndex,
                             totalQuestionCount: totalQuestionCount,
                             totalScore: totalScore)
  }
}

// MARK: - QuizPresenterInterface

extension QuizPresenter: QuizPresenterInterface {
  
  func viewDidLoad() {
    moveToNextQuestion()
  }
  
  func selectedOption(tag: Int) {
    
    view?.disableOptions()
    
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
