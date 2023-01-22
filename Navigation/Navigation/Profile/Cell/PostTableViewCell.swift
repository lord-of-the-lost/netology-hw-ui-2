//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Николай Игнатов on 12.01.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.textColor = .black
        title.numberOfLines = 2
        title.font = .systemFont(ofSize: 20, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let postImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let countOfLikes: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let countOfViews: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .regular )
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupViews() {
        backgroundColor = .white
        selectionStyle = .none
        addSubview(titleLabel)
        addSubview(postImage)
        addSubview(descriptionLabel)
        addSubview(countOfLikes)
        addSubview(countOfViews)
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

private extension PostTableViewCell {
    func setConstraints(){
        NSLayoutConstraint.activate([
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        postImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
        postImage.leadingAnchor.constraint(equalTo: leadingAnchor),
        postImage.trailingAnchor.constraint(equalTo: trailingAnchor),
        postImage.heightAnchor.constraint(equalTo: postImage.widthAnchor),
        descriptionLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 16),
        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        countOfLikes.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
        countOfLikes.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        countOfLikes.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        countOfViews.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
        countOfViews.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        countOfViews.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        ])
    }
}
