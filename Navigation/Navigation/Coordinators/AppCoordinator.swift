//
//  AppCoordinator.swift
//  Navigation
//
//  Created by Николай Игнатов on 06.03.2023.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    let navigationController: UITabBarController
    
    init(navigationController: UITabBarController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let profileCoordinator = ProfileCoordinator(navigationController: navigationController)
        childCoordinators.append(profileCoordinator)
        profileCoordinator.start()
        
        let feedCoordinator = FeedCoordinator(navigationController: navigationController)
        childCoordinators.append(feedCoordinator)
        feedCoordinator.start()
    }
}
