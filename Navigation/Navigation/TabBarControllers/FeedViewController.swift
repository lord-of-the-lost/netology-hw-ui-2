//
//  FeedViewController.swift
//  Navigation
//
//  Created by Николай Игнатов on 19.12.2022.
//

import Foundation
import UIKit

class FeedViewController: UIViewController{
    
    let post = Post(title: "Test")
    
    var buttonOnScreen: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("press me", for: .normal)
        button.tintColor = .black
        button.titleLabel?.font = .boldSystemFont(ofSize: 24)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func buttonTapped(sender: UIButton){
        navigationController?.present(ProfileViewController(), animated: true)
          }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(buttonOnScreen)
    }
   
    
}
