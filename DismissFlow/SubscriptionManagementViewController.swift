//
//  SubscriptionManagementViewController.swift
//  DismissFlow
//
//  Created by Alex Paul on 2/25/22.
//

import UIKit

final class SubscriptionManagementViewController: UIViewController {
    private var successButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(Theme.buttonTextColor, for: .normal)
        button.setTitle("Success State", for: .normal)
        button.addTarget(self, action: #selector(handleSuccess), for: .touchUpInside)
        return button
    }()

    private var failureButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(Theme.buttonTextColor, for: .normal)
        button.setTitle("Failure State", for: .normal)
        button.addTarget(self, action: #selector(handleFailure), for: .touchUpInside)
        return button
    }()

    private lazy var stackView: UIStackView = {
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.addArrangedSubview(successButton)
        vStack.addArrangedSubview(failureButton)
        vStack.spacing = 8
        vStack.distribution = .fillEqually
        return vStack
    }()

    /// Closure will be initialized for later use when Flow is Dismissed
    private var dismissBlock: DismissBlock

    init(onDismiss: DismissBlock) {
        self.dismissBlock = onDismiss
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        title = "Subscription Management"
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.80),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.20),
        ])
    }

    @objc private func handleSuccess() {
        dismissBlock?()
    }

    @objc private func handleFailure() {
        navigationController?.popViewController(animated: true)
    }
}
