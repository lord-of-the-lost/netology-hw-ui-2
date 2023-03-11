//
//  FeedCoordinator.swift
//  Navigation
//
//  Created by Николай Игнатов on 11.03.2023.
//

import UIKit

final class FeedCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let feedViewController = FeedViewController()
        feedViewController.coordinator = self
        navigationController.pushViewController(feedViewController, animated: false)
    }
}
