//
//  AppDelegate.swift
//  Bankey
//
//  Created by Fady Salah on 10/12/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow( frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
      //  window?.rootViewController = LoginViewController()
        window?.rootViewController = OnboardingContainerViewController()
        
      //  window?.rootViewController = OnboardingViewController()

        
        return true
    }

}

