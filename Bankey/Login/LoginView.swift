//
//  LoginView.swift
//  Bankey
//
//  Created by Fady Salah on 10/12/2024.
//

import Foundation
import UIKit

class LoginView: UIView {
    let stacView = UIStackView()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let deviderView = UIView()
        
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /* This override is used for story board we don't need it
    this help new views,giving him a default size
     bas bt delete it lma t custmise el constrains on StackView
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
     
    }
     */
}
    extension LoginView {
        func style() {
            translatesAutoresizingMaskIntoConstraints = false
            backgroundColor = .secondarySystemBackground
            
            stacView.translatesAutoresizingMaskIntoConstraints = false
            stacView.axis = .vertical
            stacView.spacing = 8
            
            usernameTextField.translatesAutoresizingMaskIntoConstraints = false
            usernameTextField.placeholder = "Username"
            usernameTextField.delegate = self
            
            passwordTextField.translatesAutoresizingMaskIntoConstraints = false
            passwordTextField.placeholder = "Password"
            passwordTextField.isSecureTextEntry = true
            passwordTextField.delegate = self
            
            deviderView.translatesAutoresizingMaskIntoConstraints = false
            deviderView.backgroundColor = .secondarySystemFill
            
            layer.cornerRadius = 10
            clipsToBounds = true
        }
        func layout() {
            stacView.addArrangedSubview(usernameTextField)
            stacView.addArrangedSubview(deviderView)
            stacView.addArrangedSubview(passwordTextField)

            addSubview(stacView)
            
            NSLayoutConstraint.activate([
                // it's for a very common auto layout constraint code
                stacView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
                stacView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
                trailingAnchor.constraint(equalToSystemSpacingAfter: stacView.trailingAnchor, multiplier: 1),
                bottomAnchor.constraint(equalToSystemSpacingBelow: stacView.bottomAnchor, multiplier: 1)
            ])
            
            deviderView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        }
    }

// MARK: - UITextFieldDelegate
extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
