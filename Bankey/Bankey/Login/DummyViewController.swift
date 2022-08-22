//
//  DummyViewController.swift
//  Bankey
//
//  Created by user on 02/08/22.
//

import Foundation
import UIKit

// MARK: - DummyViewController
class DummyViewController: UIViewController {
    
    let stackView = UIStackView()
    let label = UILabel()
    let logoutButton = UIButton(type: .system)
    
    weak var logoutDelegate: LogoutDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

// MARK: - Extension
extension DummyViewController {
    
    // MARK:
    func style() {
        // MARK: stackView
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        // MARK: label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bem-vindo"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        
        // MARK: logoutButton
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.configuration = .filled()
        logoutButton.setTitle("Sair", for: [])
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .primaryActionTriggered)
    }
    
    // MARK: stackView
    func layout() {
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(logoutButton)
        
        view.addSubview(stackView)
        
        // MARK: stackView
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    // MARK: @objc
    @objc func logoutButtonTapped(sender: UIButton) {
        logoutDelegate?.didLogout()
    }
}
