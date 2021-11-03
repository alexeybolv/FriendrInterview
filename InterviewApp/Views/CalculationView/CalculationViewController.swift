//
//  CalculationViewController.swift
//  InterviewApp
//
//  Created by Alexey Bolvonovich on 3.11.21.
//

import UIKit

final class CalculationViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet private weak var bananasValueLabel: UILabel!

    // MARK: - Variables

    var viewModel: CalculationViewModel? {
        willSet {
            viewModel?.viewDelegate = nil
        }
        didSet {
            viewModel?.viewDelegate = self
        }
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions

    @IBAction private func calculateAction(_ sender: Any) {
        viewModel?.calculateBananas()
    }
}

extension CalculationViewController: CalculationViewModelViewDelegate {

    func didGetInfo(_ viewModel: CalculationViewModel) {
        bananasValueLabel.text = viewModel.getBananasString()
    }

    func didGetError(_ viewModel: CalculationViewModel, error: String) {
        print("error")
    }
}
