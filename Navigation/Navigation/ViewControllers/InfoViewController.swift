//
//  InfoViewController.swift
//  Navigation
//
//  Created by Николай Игнатов on 20.12.2022.
//

import Foundation
import UIKit
class InfoViewController: UIViewController {
    
    private var buttonOnScreen: UIButton = {
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
    
    @objc private func buttonTapped(sender: UIButton){
        let alert = UIAlertController(title: "Info",
                                      message: "Homework is completed",
                                      preferredStyle: UIAlertController.Style.alert)
        
        let awesomeAction = UIAlertAction(title: "Awesome",
                                          style: UIAlertAction.Style.default){
                                          UIAlertAction in
                                          print("все круто")
                                          }
        
        let anyCommentsAction = UIAlertAction(title: "Any comments",
                                              style: UIAlertAction.Style.default){
                                              UIAlertAction in
                                              print("Какие будут замечания?")
                                              }
        
        alert.addAction(awesomeAction)
        alert.addAction(anyCommentsAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        view.addSubview(buttonOnScreen)
        setConstraints()
    }
}

extension InfoViewController {
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

