//
//  UIViewController.swift
//  TheQuiz
//
//  Created by Samina Shaikh on 10/06/2022.
//

import Foundation
import UIKit

extension UIViewController {
  @objc func topMostViewController() -> UIViewController {
    // Handling Modal views
    if let presentedViewController = self.presentedViewController {
      return presentedViewController.topMostViewController()
    }
    // Handling UIViewController's added as subviews to some other views.
    else {
      for view in self.view.subviews
      {
        // Key property which most of us are unaware of / rarely use.
        if let subViewController = view.next {
          if subViewController is UIViewController {
            let viewController = subViewController as! UIViewController
            return viewController.topMostViewController()
          }
        }
      }
      return self
    }
  }
}

extension UIApplication {
    
    var keyWindow: UIWindow? {
        // Get connected scenes
        return UIApplication.shared.connectedScenes
            // Keep only active scenes, onscreen and visible to the user
            .filter { $0.activationState == .foregroundActive }
            // Keep only the first `UIWindowScene`
            .first(where: { $0 is UIWindowScene })
            // Get its associated windows
            .flatMap({ $0 as? UIWindowScene })?.windows
            // Finally, keep only the key window
            .first(where: \.isKeyWindow)
    }
    
}
