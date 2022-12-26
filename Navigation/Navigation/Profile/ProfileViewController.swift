//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Николай Игнатов on 19.12.2022.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController{
    private let profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray

    }
    override func viewWillLayoutSubviews() {
        profileHeaderView.frame = view.frame
        view.addSubview(profileHeaderView)
    }
}
