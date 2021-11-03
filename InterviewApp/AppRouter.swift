//
//  AppRouter.swift
//  InterviewApp
//
//  Created by Alexey Bolvonovich on 3.11.21.
//

import UIKit

protocol Router {
    func route(to routeID: String, from context: UIViewController, parameters: Any?)
}

class AppRouter: Router {

    func route(to routeID: String, from context: UIViewController, parameters: Any?) { }
    
    func initialController() -> UIViewController {
        guard let calculationViewController = CalculationViewController.storyboardInstance() as? CalculationViewController else { return UIViewController() }
        calculationViewController.viewModel = CalculationViewModel()
        let navigationController = UINavigationController(rootViewController: calculationViewController)
        navigationController.isNavigationBarHidden = true
        return navigationController
    }
}
