//
//  AppDelegate.swift
//  Bankey
//
//  Created by user on 07/07/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let loginViewController = LoginViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        
        loginViewController.delegate = self
        onboardingContainerViewController.delegate = self
        
//        window?.rootViewController = loginViewController
        window?.rootViewController = onboardingContainerViewController
//        window?.rootViewController = OnboardingViewController(heroImageName: "delorean", titleText: "Bankey é mais rápido, mais fácil de usar e tem uma aparência totalmente inovadora que fará você se sentir como se estivesse de volta a 1989.")
        
        
        return true
    }
}

extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didLogin() {
        print("foo - Did login")
    }
}

extension AppDelegate: LoginViewControllerDelegate {
    func didFinishOnboarding() {
        print("foo - Did onboard")
    }
}
