//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Николай Игнатов on 13.01.2023.
//

import Foundation
import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    let screenWidth = UIScreen.main.bounds.width
    lazy var imageWidthHeight = (screenWidth - 48) / 4
    
    private let titleLabel: UILabel = {
       let title = UILabel()
       title.text = "Photos"
       title.textColor = .black
       title.font = .systemFont(ofSize: 24, weight: .bold)
       title.translatesAutoresizingMaskIntoConstraints = false
       return title
   }()
    
    private let backArrow: UIImageView = {
       let image = UIImageView()
       image.image = UIImage(systemName: "arrow.right")
       image.translatesAutoresizingMaskIntoConstraints = false
       return image
   }()
    
    private lazy var firstImage: UIImageView = {
       let image = UIImageView()
       image.image = UIImage(named: "1")
        image.clipsToBounds = true
       image.layer.cornerRadius = 6
       image.contentMode = .scaleAspectFit
       image.translatesAutoresizingMaskIntoConstraints = false
       return image
   }()
    
    private lazy var secondImage: UIImageView = {
       let image = UIImageView()
       image.image = UIImage(named: "2")
        image.clipsToBounds = true
       image.layer.cornerRadius = 6
       image.contentMode = .scaleAspectFit
       image.translatesAutoresizingMaskIntoConstraints = false
       return image
   }()
    
    private lazy var thirdImage: UIImageView = {
       let image = UIImageView()
       image.image = UIImage(named: "3")
       image.clipsToBounds = true
       image.layer.cornerRadius = 6
       image.contentMode = .scaleAspectFit
       image.translatesAutoresizingMaskIntoConstraints = false
       return image
   }()
    
    private lazy var fourthImage: UIImageView = {
       let image = UIImageView()
       image.image = UIImage(named: "4")
        image.clipsToBounds = true
       image.layer.cornerRadius = 6
       image.contentMode = .scaleAspectFit
       image.translatesAutoresizingMaskIntoConstraints = false
       return image
   }()
    
    private func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
        addSubview(titleLabel)
        addSubview(backArrow)
        addSubview(firstImage)
        addSubview(secondImage)
        addSubview(thirdImage)
        addSubview(fourthImage)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension PhotosTableViewCell {
    func setConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            backArrow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 12),
            backArrow.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            firstImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            firstImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            firstImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 12),
            firstImage.widthAnchor.constraint(equalToConstant: imageWidthHeight),
            firstImage.heightAnchor.constraint(equalToConstant: imageWidthHeight),
            secondImage.leadingAnchor.constraint(equalTo: firstImage.trailingAnchor, constant: 8),
            secondImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            secondImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 12),
            thirdImage.leadingAnchor.constraint(equalTo: secondImage.trailingAnchor, constant: 8),
            thirdImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            thirdImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 12),
            fourthImage.leadingAnchor.constraint(equalTo: thirdImage.trailingAnchor, constant: 8),
            fourthImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 12),
            fourthImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            fourthImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 12),
        ])
    }
}
