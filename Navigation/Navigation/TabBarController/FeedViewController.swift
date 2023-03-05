//
//  FeedViewController.swift
//  Navigation
//
//  Created by Николай Игнатов on 19.12.2022.
//

import Foundation
import UIKit

final class FeedViewController: UIViewController{
    
    private lazy var buttonOnScreen = CustomButton(title: "  press me  ", titleColor: .white, backgroundColor: nil, font: .boldSystemFont(ofSize: 24), cornerRadius: 20, borderWidth: 1, borderColor: .white) {
        self.navigationController?.pushViewController(PostViewController(), animated: true)
    }
    
    private lazy var secondButtonOnScreen = CustomButton(title: "  press me  ", titleColor: .white, backgroundColor: nil, font: .boldSystemFont(ofSize: 24), cornerRadius: 20, borderWidth: 1, borderColor: .white) {
        self.navigationController?.pushViewController(PostViewController(), animated: true)
    }
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .center
        stack.addArrangedSubview(buttonOnScreen)
        stack.addArrangedSubview(secondButtonOnScreen)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(stackView)
        setConstraints()
    }
}

extension FeedViewController {
    private func setConstraints(){
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
