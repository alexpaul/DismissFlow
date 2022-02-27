//
//  ViewController.swift
//  DismissFlow
//
//  Created by Alex Paul on 2/25/22.
//

import UIKit

final class HomeViewController: UIViewController {

    private var settingsButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"

        settingsButton = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(showSettings))
        navigationItem.rightBarButtonItem = settingsButton
    }

    /// Presents the Settings View
    @objc private func showSettings() {
        let settingsVC = SettingsViewController(onDismiss: {
            print("Setting VC Dismissed")
        })

        let navController = UINavigationController(rootViewController: settingsVC)

        settingsVC.modalPresentationStyle = .formSheet

        navigationController?.present(navController, animated: true)
    }
}

