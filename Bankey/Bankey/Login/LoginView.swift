//
//  LoginView.swift
//  Bankey
//
//  Created by user on 07/07/22.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    let usernameTextField = UITextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) não foi implementado.")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
}

extension LoginView {
    
    func style() {
        // * translatesAutoresizingMaskIntoConstraints para false para desativar o comportamento padrão.
        translatesAutoresizingMaskIntoConstraints = false // <- nunca esquecer esta linha.
        backgroundColor = .systemPurple
        
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false // <- nunca esquecer.
        usernameTextField.placeholder = "Usuário"
        usernameTextField.delegate = self // <- O TextField vai enviar mensagens através deste protocolo.
    }
    
    func layout() {
        addSubview(usernameTextField) // // <- nunca esquecer.
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            usernameTextField.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: usernameTextField.trailingAnchor, multiplier: 1)
        ])
    }
}

// MARK: - UITextFieldDelegate
extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool { // <- Call Back
        if textField.text != "" {
            return true
        } else {
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
}
