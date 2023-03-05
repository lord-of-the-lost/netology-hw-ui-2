//
//  InfoViewController.swift
//  Navigation
//
//  Created by Николай Игнатов on 20.12.2022.
//

import UIKit

final class InfoViewController: UIViewController {
    
    private lazy var buttonOnScreen = CustomButton(title: "press me", titleColor: .white, backgroundColor: nil, font: .boldSystemFont(ofSize: 24), cornerRadius: 20, borderWidth: 1, borderColor: .white) {
        
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

