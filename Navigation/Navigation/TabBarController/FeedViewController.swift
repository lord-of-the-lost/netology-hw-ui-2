//
//  FeedViewController.swift
//  Navigation
//
//  Created by Николай Игнатов on 19.12.2022.
//

import Foundation
import UIKit

class FeedViewController: UIViewController{
    
    private  let post = Post(title: "New Post")
    
    private lazy var buttonOnScreen: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("  press me  ", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 24)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var secondButtonOnScreen: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("  press me  ", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 24)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func buttonTapped(sender: UIButton){
        self.navigationController?.pushViewController(PostViewController(), animated: true)
          }
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .center
        stack.addArrangedSubview(buttonOnScreen)
        stack.addArrangedSubview(secondButtonOnScreen)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(stackView)
        setConstraints()
    }
}

extension FeedViewController {
    private func setConstraints(){
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            buttonOnScreen.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//            buttonOnScreen.heightAnchor.constraint(equalToConstant: 40),
//            buttonOnScreen.widthAnchor.constraint(equalToConstant: 60),
        ])
    }
}
