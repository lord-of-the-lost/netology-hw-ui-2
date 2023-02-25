//
//  AppDelegate.swift
//  Navigation
//
//  Created by Николай Игнатов on 19.12.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = .blue
        tabBarController.tabBar.backgroundColor = .white
        
        let feedViewController = FeedViewController()
        
        let feedItem = UITabBarItem(title: "Новости",
                                    image: UIImage(systemName: "newspaper"),
                                    selectedImage: UIImage(systemName: "newspaper.fill"))
        feedViewController.tabBarItem = feedItem
        
        let profileViewController = LoginViewController()
        profileViewController.loginDelegate = LoginInspector()
        
        let profileItem = UITabBarItem(title: "Профиль",
                                       image: UIImage(systemName:  "person"),
                                       selectedImage: UIImage(systemName: "person.fill"))
        profileViewController.tabBarItem = profileItem
        
        let controllersArray = [feedViewController, profileViewController]
        
        tabBarController.viewControllers = controllersArray.map { UINavigationController(rootViewController: $0)}
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
    }
    
}

