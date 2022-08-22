//
//  LoginView.swift
//  Bankey
//
//  Created by user on 07/07/22.
//

import UIKit

// MARK: - LoginView
class LoginView: UIView {
    
    let stackView = UIStackView()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let dividerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) não foi implementado")
    }
}

extension LoginView {
    
    // MARK: - Style
    func style() {
        // * translatesAutoresizingMaskIntoConstraints para false para desativar o comportamento padrão.
        translatesAutoresizingMaskIntoConstraints = false // <- nunca esquecer esta linha.
        backgroundColor = .secondarySystemBackground
        
        // MARK: stackView
        stackView.translatesAutoresizingMaskIntoConstraints = false // <- nunca esquecer esta linha.
        stackView.axis = .vertical
        stackView.spacing = 8
        
        // MARK: usernameTextField
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false // <- nunca esquecer.
        usernameTextField.placeholder = "Usuário"
        usernameTextField.delegate = self // <- O TextField vai enviar mensagens através deste protocolo.
        
        // MARK: passwordTextField
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false // <- nunca esquecer.
        passwordTextField.placeholder = "Senha"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        
        // MARK: dividerView
        dividerView.translatesAutoresizingMaskIntoConstraints = false // <- nunca.
        dividerView.backgroundColor = .secondarySystemFill
        
        layer.cornerRadius = 5
        clipsToBounds = true
    }
    
    // MARK: - Layout
    func layout() {
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(passwordTextField)
        
        addSubview(stackView) // // <- nunca esquecer.
        
        // MARK: stackView
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
        
        // MARK: dividerView
        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}

// MARK: - UITextFieldDelegate
extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool { // <- Call Back
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
}
