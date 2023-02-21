//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Николай Игнатов on 26.12.2022.
//

import SnapKit
import UIKit

final class ProfileHeaderView: UIView {
    
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
        return imageView
    }()
    
    private let headerText: UILabel = {
        let text = UILabel()
        text.text = "Nikolay Ignatov"
        text.font = .systemFont(ofSize: 18, weight: .bold)
        text.textColor = .black
        return text
    }()
    
    private let statusTextLabel: UILabel = {
        let text = UILabel()
        text.text = "iOS developer"
        text.font = .systemFont(ofSize: 14, weight: .regular)
        text.textColor = .gray
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
        showView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
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
        profileImage.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.leading.equalTo(16)
            make.top.equalTo(16)
        }
        
        headerText.snp.makeConstraints { make in
            make.leading.equalTo(profileImage.snp.trailing).offset(16)
            make.top.equalTo(27)
        }
        
        showStatusButton.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.top.equalTo(profileImage.snp.bottom).offset(56)
            make.bottom.equalTo(-20)
            make.height.equalTo(50)
        }
        
        statusTextLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImage.snp.trailing).offset(16)
            make.bottom.equalTo(showStatusButton.snp.top).offset(-74)
        }
        
        statusTextField.snp.makeConstraints { make in
            make.leading.equalTo(profileImage.snp.trailing).offset(16)
            make.trailing.equalTo(-16)
            make.top.equalTo(statusTextLabel.snp.bottom).offset(15)
            make.height.equalTo(40)
        }
        
    }
}
