//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Николай Игнатов on 19.12.2022.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController{
    
    private var profileHeaderView: ProfileHeaderView { return self.view as! ProfileHeaderView }
    
    override func loadView() {
        self.view = ProfileHeaderView(frame: UIScreen.main.bounds)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Профиль"

    }
}
