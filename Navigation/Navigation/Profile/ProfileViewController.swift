//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Николай Игнатов on 19.12.2022.
//

import UIKit

final class ProfileViewController: UIViewController{
    
    private let headerView = ProfileHeaderView()
    
    private lazy var avatarImage = headerView.profileImage
    
    private var avatarImageWidthConstraint: NSLayoutConstraint?
    
    private var avatarImageHeightConstraint: NSLayoutConstraint?
    
    private var isAvatarIncreased = false
    
  //  private lazy var avatarImageStartPosition = headerView.profileImage.center
    
    private let viewForAvatarShow: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "multiply.circle.fill"), for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.alpha = 0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemGray6
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 500
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableViewCell")
        tableView.tableHeaderView = self.headerView
        self.headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 250)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = false
        view.backgroundColor = .systemGray6
        view.addSubview(tableView)
        view.insertSubview(viewForAvatarShow, belowSubview: avatarImage)
        view.addSubview(button)
        setupConstraints()
        tableView.delegate = self
        tableView.dataSource = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(avatarTapped))
        headerView.profileImage.isUserInteractionEnabled = true
        headerView.profileImage.addGestureRecognizer(tapGesture)
    }
    
    @objc func avatarTapped() {
        UIView.animate(withDuration: 0.5, animations: {
            self.avatarImage.center = CGPoint(x: self.view.center.x, y: self.view.center.y)
            self.avatarImageWidthConstraint?.constant = self.isAvatarIncreased ? 100 : self.view.bounds.width
            self.avatarImageHeightConstraint?.constant = self.isAvatarIncreased ? 100 : self.view.bounds.width
            self.view.layoutIfNeeded()
            self.isAvatarIncreased.toggle()
            self.viewForAvatarShow.alpha = 0.5
            
        }, completion: { _ in
            UIView.animate(withDuration: 0.3, animations: {
                self.button.alpha = 1
            })
        })
    }
    
    @objc private func buttonTapped(){
           UIView.animate(withDuration: 0.3, animations: {
               self.button.alpha = 0
           }, completion: { _ in
               UIView.animate(withDuration: 0.5, animations: {
                   self.avatarImage.center = CGPoint(x: 70, y: 70) //self.avatarImageStartPosition
                   self.avatarImageWidthConstraint?.constant = 100
                   self.avatarImageHeightConstraint?.constant = 100
                   self.viewForAvatarShow.alpha = 0
                   self.view.layoutIfNeeded()
               })
           })
       }
}
    

private extension ProfileViewController {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            viewForAvatarShow.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewForAvatarShow.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewForAvatarShow.topAnchor.constraint(equalTo: view.topAnchor),
            viewForAvatarShow.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            navigationController?.pushViewController(PhotosViewController(), animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return posts.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath) as! PhotosTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
            let data = posts[indexPath.row]
            cell.titleLabel.text = data.autor
            cell.postImage.image = UIImage(named: data.image)
            cell.descriptionLabel.text = data.description
            cell.countOfLikes.text = String("Likes: \(data.likes)")
            cell.countOfViews.text = String("Views: \(data.views)")
            return cell
        }
    }
}


