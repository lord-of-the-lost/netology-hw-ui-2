//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Николай Игнатов on 26.12.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var imageSize: CGFloat = 100
    private var statusText: String?
    
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
    
    private let statusTextLabel: UILabel = {
        let text = UILabel()
        text.text = "iOS developer"
        text.font = .systemFont(ofSize: 14, weight: .regular)
        text.textColor = .gray
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Set a new status"
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(setNewStatus), for: .editingChanged)
        return textField
    }()
    
    private lazy var showStatusButton: UIButton = {
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
         guard let newStatus = statusText else { return }
         guard newStatus.isEmpty else {
             statusTextLabel.text = newStatus
             statusTextField.text = nil
             return
         }
         return
    }
    
    @objc private func setNewStatus(sender: UITextField){
        statusText = sender.text
   }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        showView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        guard let superview = superview else { return }
        widthAnchor.constraint(equalTo: superview.widthAnchor).isActive = true
    }
    
    func showView(){
        setupView()
        setConstraints()
    }
    
    private func setupView(){
        self.backgroundColor = .systemGray6
        self.addSubview(profileImage)
        self.addSubview(headerText)
        self.addSubview(statusTextLabel)
        self.addSubview(statusTextField)
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
            statusTextLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16),
            statusTextLabel.bottomAnchor.constraint(equalTo: showStatusButton.topAnchor, constant: -74),
            statusTextField.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusTextField.topAnchor.constraint(equalTo: statusTextLabel.bottomAnchor, constant: 15),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            showStatusButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 56),
            showStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            showStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            showStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            showStatusButton.widthAnchor.constraint(equalTo: widthAnchor, constant: -32),
            showStatusButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
