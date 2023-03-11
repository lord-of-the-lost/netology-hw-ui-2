//
//  ProfileCoordinator.swift
//  Navigation
//
//  Created by Николай Игнатов on 11.03.2023.
//

import UIKit

final class ProfileCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let profileViewController = ProfileViewController()
        profileViewController.coordinator = self
        navigationController.pushViewController(profileViewController, animated: false)
    }
}
