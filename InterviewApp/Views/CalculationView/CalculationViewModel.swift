//
//  CalculationViewModel.swift
//  InterviewApp
//
//  Created by Alexey Bolvonovich on 3.11.21.
//

import UIKit

protocol CalculationViewModelViewDelegate: AnyObject {
    func didGetInfo(_ viewModel: CalculationViewModel)
    func didGetError(_ viewModel: CalculationViewModel, error: String)
}

class CalculationViewModel: NSObject {

    // MARK: - Variables

    weak var viewDelegate: CalculationViewModelViewDelegate?
    private var numberOfBananas: Int = 0

    // MARK: - Helper Methods

    func getBananasString() -> String {
        return numberOfBananas > 0 ? "\(numberOfBananas)" : "No bananas"
    }

    func calculateBananas() {
        let myURLString = "https://en.wikipedia.org/wiki/Banana"
        guard let myURL = URL(string: myURLString) else {
            print("Error: \(myURLString) doesn't seem to be a valid URL")
            return
        }

        DispatchQueue.global(qos: .userInitiated).async {
            do {
                let myHTMLString = try String(contentsOf: myURL, encoding: .utf8)
                self.numberOfBananas = myHTMLString.withoutHtml.components(separatedBy: "banana").count - 1
                DispatchQueue.main.async {
                    self.viewDelegate?.didGetInfo(self)
                }
            } catch let error {
                print("Error: \(error)")
            }
        }
    }
}
