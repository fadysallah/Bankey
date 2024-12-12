//
//  ViewController.swift
//  Bankey
//
//  Created by Fady Salah on 10/12/2024.
//

import UIKit

class LoginViewController: UIViewController {
    let Loginview = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    
    
    var userName : String? {
        return Loginview.usernameTextField.text
    }
    var password : String? {
        return Loginview.passwordTextField.text
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension LoginViewController {
        private func style() {
            Loginview.translatesAutoresizingMaskIntoConstraints = false
            
            signInButton.translatesAutoresizingMaskIntoConstraints = false
            signInButton.configuration = .filled()
            signInButton.configuration?.imagePadding = 8 //for indicator spacing
            signInButton.setTitle("Sign In", for: [])
            signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
            
            //Error message Style
            
            errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
            errorMessageLabel.textColor = .systemRed
            errorMessageLabel.textAlignment = .center
            errorMessageLabel.numberOfLines = 0
            errorMessageLabel.text = "Username or Password is incorrect!"
            errorMessageLabel.isHidden = true
            
        }
    // here is the layout of View
        private func layout(){
            view.addSubview(Loginview)
            view.addSubview(signInButton)
            view.addSubview(errorMessageLabel)
           
            
            //LoginView
            NSLayoutConstraint.activate([
                 // thus is used to center the view
                Loginview.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                
                Loginview.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
                
                view.trailingAnchor.constraint(equalToSystemSpacingAfter: Loginview.trailingAnchor, multiplier: 1)
        ])
            
            //signin button
            NSLayoutConstraint.activate([
                // it's for a very common auto layout constraint code
                signInButton.topAnchor.constraint(equalToSystemSpacingBelow: Loginview.bottomAnchor, multiplier: 2),
                signInButton.leadingAnchor.constraint(equalTo: Loginview.leadingAnchor),
                signInButton.trailingAnchor.constraint(equalTo: Loginview.trailingAnchor)
                
            ])
            
            //Error Message
            NSLayoutConstraint.activate([
                // it's for a very common auto layout constraint code
                errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 1),
                errorMessageLabel.leadingAnchor.constraint(equalTo: Loginview.leadingAnchor),
                errorMessageLabel.trailingAnchor.constraint(equalTo: Loginview.trailingAnchor)
            ])
            
       }
    }
    
//MARK: - Actions
extension LoginViewController {
    @objc  func signInTapped(sender: UIButton) {
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let userName = userName, let password = password else {
            assertionFailure("User name / password should never be nill! ")
            return
        }
        
        if userName.isEmpty || password.isEmpty {
            configureView(withMessage:"Username / password cannot be bllink")
            return
        }
        
        if userName == "Fady" && password == "123456" {
            signInButton.configuration?.showsActivityIndicator = true
        }else{
            configureView(withMessage: "Incorrect username / password")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLabel.text = message
        errorMessageLabel.isHidden = false
    }
}
