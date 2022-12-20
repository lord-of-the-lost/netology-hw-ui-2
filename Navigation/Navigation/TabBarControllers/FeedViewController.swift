//
//  FeedViewController.swift
//  Navigation
//
//  Created by Николай Игнатов on 19.12.2022.
//

import Foundation
import UIKit

class FeedViewController: UIViewController{
    
    let post = Post(title: "New Post")
    
    var buttonOnScreen: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("press me", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 24)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func buttonTapped(sender: UIButton){
        self.navigationController?.pushViewController(PostViewController(), animated: true)
          }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(buttonOnScreen)
        setConstraints()
    }
   
    
}

extension FeedViewController {
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            buttonOnScreen.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonOnScreen.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonOnScreen.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            buttonOnScreen.heightAnchor.constraint(equalToConstant: 40),
            buttonOnScreen.widthAnchor.constraint(equalToConstant: 60),
        ])
    }
}
