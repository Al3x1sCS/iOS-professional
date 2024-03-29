//
//  AppDelegate.swift
//  Bankey
//
//  Created by user on 07/07/22.
//

import UIKit

// MARK: Tema
let appColor: UIColor = UIColor(red:150.0/255.0, green:66.0/255.0, blue:255/255.0, alpha: 1) // ROXO CLARO
let appColor2: UIColor = UIColor(red:0, green:128.0/255.0, blue:150.0/255.0, alpha: 1) // VERDE ESCURO
let appColor3: UIColor = UIColor(red:0, green:159.0/255.0, blue:184.0/255.0, alpha: 1) // VERDE CLARO
let appColor4: UIColor = UIColor(red:120.0/255.0, green:36.0/255.0, blue:225.0/255.0, alpha: 1) // ROXO MEDIO
let appColor5: UIColor = UIColor(red:94.0/255.0, green:0/255.0, blue:203.0/255.0, alpha: 1) // ROXO ESCURO

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    let loginViewController = LoginViewController()
    let onboardingViewController = OnboardingContainerViewController()
    let mainViewController = MainViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        
        loginViewController.delegate = self
        onboardingViewController.delegate = self
        
        registerForNotifications()
        
        displayLogin()
        
        return true
    }
    
    // MARK: Register For Notifications
    private func registerForNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(didLogout), name: .logout, object: nil)
    }
    
    // MARK: displayLogin
    private func displayLogin() {
        setRootViewController(loginViewController)
    }
    
    // MARK: displayNextScreen
    private func displayNextScreen() {
        if LocalState.hasOnboarded {
            prepMainView()
            setRootViewController(mainViewController)
        } else {
            setRootViewController(onboardingViewController)
        }
    }
    
    // MARK: prepMainView
    private func prepMainView() {
        mainViewController.setStatusBar()
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().backgroundColor = appColor
    }
}

// MARK: - Extensions
extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.7,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}

// MARK: didLogin
extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didLogin() {
        displayNextScreen()
    }
}

// MARK: didFinishOnboarding
extension AppDelegate: LoginViewControllerDelegate {
    func didFinishOnboarding() {
        LocalState.hasOnboarded = true
        prepMainView()
        setRootViewController(mainViewController)
    }
}

// MARK: didLogout
extension AppDelegate: LogoutDelegate {
    @objc func didLogout() {
        setRootViewController(loginViewController)
    }
}
