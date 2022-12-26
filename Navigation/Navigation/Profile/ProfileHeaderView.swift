//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Николай Игнатов on 26.12.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private let profileImage: UIImageView = {
        let image = UIImage(named: "profileImage")
        let imageView = UIImageView(image: image)
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        return imageView
    }()
    
    private let headerText: UILabel = {
        let text = UILabel()
        text.text = "Nikolay Ignatov"
        text.font = .systemFont(ofSize: 18, weight: .bold)
        text.textColor = .black
        return text
    }()
    
    private let statusText: UILabel = {
        let text = UILabel()
        text.text = "iOS developer"
        text.font = .systemFont(ofSize: 14, weight: .regular)
        text.textColor = .gray
        return text
    }()
    
    private let showStatusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show status", for: .normal)
        button.backgroundColor = .blue
        button.tintColor = .white
        button.addTarget(self, action: #selector(showStatusButtonTapped), for: .touchUpInside)
        return button
    }()
    
     @objc private func showStatusButtonTapped(){
         print(statusText.text ?? "Status not found")
    }
    
    func showView(){
        setupView()
        setConstraints()
    }
    
    private func setupView(){
        self.addSubview(profileImage)
        self.addSubview(headerText)
        self.addSubview(statusText)
        self.addSubview(showStatusButton)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            profileImage.widthAnchor.constraint(equalToConstant: 100),
            profileImage.heightAnchor.constraint(equalToConstant: 100),
            profileImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            profileImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
        ])
    }
}
