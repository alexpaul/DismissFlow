//
//  SettingsViewController.swift
//  DismissFlow
//
//  Created by Alex Paul on 2/25/22.
//

import UIKit

/// Clousre to handle any actions after the Flow  has been dismissed
typealias DismissBlock = (() -> Void)?

final class SettingsViewController: UIViewController {
    private var showSubMgmtButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(Theme.buttonTextColor, for: .normal)
        button.setTitle("Subsciption Management", for: .normal)
        button.addTarget(self, action: #selector(showSubscriptionManagement), for: .touchUpInside)
        return button
    }()

    private var doneButton: UIBarButtonItem!

    /// Closure will be initialized for later use when Flow is Dismissed
    private let dismissBlock: DismissBlock

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

        title = "Settings"

        doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissView))
        navigationItem.rightBarButtonItem = doneButton
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.addSubview(showSubMgmtButton)

        showSubMgmtButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            showSubMgmtButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            showSubMgmtButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            showSubMgmtButton.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 44),
        ])
    }

    /// Presents the Subscription Management View
    @objc private func showSubscriptionManagement() {
        let subscriptionManagementVC = SubscriptionManagementViewController(onDismiss: { [weak self] in
            guard let self = self else { return }

            self.dismiss(animated: true)
            self.dismissBlock?()
        })

        navigationController?.pushViewController(subscriptionManagementVC, animated: true)
    }

    @objc private func dismissView() {
        dismiss(animated: true)
        dismissBlock?()
    }
}
