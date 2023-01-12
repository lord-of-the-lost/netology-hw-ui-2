//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Николай Игнатов on 19.12.2022.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController{
    
    private var posts = [Post(autor: "apple.com",
                              description: "Swift is cool language",
                              image: "swift",
                              likes: 100,
                              views: 150),
                         
                         Post(autor: "apple.com",
                              description: "Introduce UIKit for iOS developers",
                              image: "uiKit",
                              likes: 70,
                              views: 100),
                         
                         Post(autor: "uncle Bob",
                              description: "SOLID principals",
                              image: "solid",
                              likes: 999,
                              views: 1000),
                         
                         Post(autor: "apple.com",
                              description: "Keychain is a cool and safty system storage",
                              image: "keychain",
                              likes: 50,
                              views: 200)
    ]
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 500
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = false
        view.addSubview(tableView)
        setupConstraints()
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

private extension ProfileViewController {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
        let data = posts[indexPath.row]
        cell.titleLabel.text = data.autor
        cell.postImage.image = UIImage(named: data.image)
        cell.descriptionLabel.text = data.description
        cell.countOfLikes.text = String("Likes: \(data.likes)")
        cell.countOfViews.text = String("Views: \(data.views)")
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return ProfileHeaderView()
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 220
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        500
    }
}
