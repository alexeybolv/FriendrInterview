//
//  UIViewController+StoryboardInstance.swift
//  InterviewApp
//
//  Created by Alexey Bolvonovich on 3.11.21.
//

import UIKit

extension UIViewController {

    static func storyboardInstance() -> UIViewController? {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        return storyboard.instantiateInitialViewController()
    }
}
