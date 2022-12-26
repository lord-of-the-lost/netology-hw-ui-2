//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Николай Игнатов on 26.12.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var imageSize: CGFloat = 100
    
    private lazy var profileImage: UIImageView = {
        let image = UIImage(named: "profileImage")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.frame.size = CGSize(width: imageSize, height: imageSize)
        imageView.layer.cornerRadius = imageSize / 2
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let headerText: UILabel = {
        let text = UILabel()
        text.text = "Nikolay Ignatov"
        text.font = .systemFont(ofSize: 18, weight: .bold)
        text.textColor = .black
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let statusText: UILabel = {
        let text = UILabel()
        text.text = "iOS developer"
        text.font = .systemFont(ofSize: 14, weight: .regular)
        text.textColor = .gray
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let showStatusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show status", for: .normal)
        button.backgroundColor = .blue
        button.tintColor = .white
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(showStatusButtonTapped), for: .touchUpInside)
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
     @objc private func showStatusButtonTapped(){
         print(statusText.text ?? "Status not found")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        showView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
            profileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            profileImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            headerText.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            headerText.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16),
            statusText.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16),
            statusText.bottomAnchor.constraint(equalTo: showStatusButton.topAnchor, constant: -34),
            showStatusButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 16),
            showStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            showStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            showStatusButton.widthAnchor.constraint(equalTo: widthAnchor, constant: -32),
            showStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
