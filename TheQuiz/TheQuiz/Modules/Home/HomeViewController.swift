//
//  HomeViewController.swift
//  TheQuiz
//
//  Created by Samina Shaikh on 10/06/2022.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - Properties
    
    var presenter: HomePresenterInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Test
        APIClient.shared.getQuestions { questions in
            print(questions)
        }
        
        
    }
}

// MARK: - HomeViewInterface

extension HomeViewController: HomeViewInterface {}

extension HomeViewController: Instantiable {
    static var storyboardName: StringConvertible {
        StoryboardName.main
    }
}
