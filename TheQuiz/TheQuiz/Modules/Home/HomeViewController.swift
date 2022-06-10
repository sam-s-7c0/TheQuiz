//
//  HomeViewController.swift
//  TheQuiz
//
//  Created by Samina Shaikh on 10/06/2022.
//

import UIKit

class HomeViewController: UIViewController {
  // MARK: - Properties
  
  @IBOutlet weak var stackviewScore: UIStackView!
  @IBOutlet private weak var labelHighscore: UILabel!
  @IBOutlet private weak var buttonStartGame: UIButton!
  var presenter: HomePresenterInterface?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    presenter?.viewDidLoad()
  }
  
  @IBAction func actionStartGame(_ sender: UIButton) {
    presenter?.startGame()
  }
}

// MARK: - HomeViewInterface

extension HomeViewController: HomeViewInterface {
  func showError(error: String) {
    DispatchQueue.main.async {
      let alertView = UIAlertController(title: "Error",
                                        message: error,
                                        preferredStyle: .alert)
      let okAction = UIAlertAction(title: "Ok",
                                   style: .default)
      alertView.addAction(okAction)
      self.present(alertView, animated: true)
    }
  }
  
  func disableStartGame() {
    DispatchQueue.main.async {
      self.buttonStartGame.backgroundColor = UIColor.gray
      self.buttonStartGame.isEnabled = false
    }
  }
  
  func enableStartGame() {
    DispatchQueue.main.async {
      self.buttonStartGame.backgroundColor = UIColor(red: 109/255, green: 161/255, blue: 215/255, alpha: 1)
      self.buttonStartGame.isEnabled = true
    }
  }
  
  func showScore() {
    DispatchQueue.main.async {
      self.stackviewScore.isHidden = false
    }
  }
  
  func hideScore() {
    DispatchQueue.main.async {
      self.stackviewScore.isHidden = true
    }
  }
  
  func updateScore(score: String) {
    labelHighscore.text = score
  }
}

extension HomeViewController: Instantiable {
  static var storyboardName: StringConvertible {
    StoryboardName.main
  }
}
