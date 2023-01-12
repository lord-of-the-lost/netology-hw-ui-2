//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Николай Игнатов on 19.12.2022.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController{
    
   // private var profileHeaderView: ProfileHeaderView { return self.view as! ProfileHeaderView }
    
    //    override func loadView() {
    //        self.view = ProfileHeaderView(frame: UIScreen.main.bounds)
    //    }
    
    private let contentView = ProfileHeaderView()
    
    private lazy var changeTitleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Change title", for: .normal)
        button.backgroundColor = .blue
        button.tintColor = .white
       // button.addTarget(self, action: #selector(changeTitleButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func setupView() {
        view.addSubview(contentView)
        view.addSubview(changeTitleButton)
        setupConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Профиль"
        navigationController?.navigationBar.isHidden = false
        setupView()
    }
}

private extension ProfileViewController {
     func setupConstraints() {
         NSLayoutConstraint.activate([
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 220),
            changeTitleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            changeTitleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            changeTitleButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
         ])
    }
}

