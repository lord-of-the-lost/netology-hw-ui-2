//
//  PostViewController.swift
//  Navigation
//
//  Created by Николай Игнатов on 19.12.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationBar()
    }
    
    private func configureNavigationBar(){
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "info.circle"), for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside) 
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: button)
    }
    
    @objc func buttonTapped(sender: UIButton){
        let infoViewController = InfoViewController()
        self.present(infoViewController, animated: true)
    }
}
