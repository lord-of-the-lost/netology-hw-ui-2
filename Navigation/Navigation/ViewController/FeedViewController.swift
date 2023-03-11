//
//  FeedViewController.swift
//  Navigation
//
//  Created by Николай Игнатов on 19.12.2022.
//

import UIKit

final class FeedViewController: UIViewController {
    
    private let feedModel = FeedModel()
    
    weak var coordinator: FeedCoordinator?
    
    private lazy var buttonOnScreen = CustomButton(title: "  press me  ", titleColor: .white, backgroundColor: nil, font: .boldSystemFont(ofSize: 24), cornerRadius: 20, borderWidth: 1, borderColor: .white) {
        self.navigationController?.pushViewController(PostViewController(), animated: true)
    }
    
    private lazy var secondButtonOnScreen = CustomButton(title: "  press me  ", titleColor: .white, backgroundColor: nil, font: .boldSystemFont(ofSize: 24), cornerRadius: 20, borderWidth: 1, borderColor: .white) {
        self.navigationController?.pushViewController(PostViewController(), animated: true)
    }
    
    private lazy var secretWordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter secret word"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var checkGuessButton: UIButton = {
        let button = CustomButton(title: "Check Guess", titleColor: .white, backgroundColor: nil, font: .boldSystemFont(ofSize: 24), cornerRadius: 20, borderWidth: 1, borderColor: .white) {
            guard let word = self.secretWordTextField.text, !word.isEmpty else { return }
            self.feedModel.check(word: word)
        }
        return button
    }()
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .center
        stack.addArrangedSubview(buttonOnScreen)
        stack.addArrangedSubview(secondButtonOnScreen)
        stack.addArrangedSubview(secretWordTextField)
        stack.addArrangedSubview(checkGuessButton)
        stack.addArrangedSubview(resultLabel)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(stackView)
        setConstraints()
        
        NotificationCenter.default.addObserver(self, selector: #selector(correctPassword), name: Notification.Name("PasswordIsCorrect"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(incorrectPassword), name: Notification.Name("PasswordIsIncorrect"), object: nil)
    }
    
    @objc private func correctPassword() {
        resultLabel.text = "Correct!"
        resultLabel.textColor = .green
    }
    
    @objc private func incorrectPassword() {
        resultLabel.text = "Incorrect!"
        resultLabel.textColor = .red
    }
}

extension FeedViewController {
    private func setConstraints(){
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            secretWordTextField.widthAnchor.constraint(equalToConstant: 200),
            checkGuessButton.widthAnchor.constraint(equalToConstant: 200),
            resultLabel.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
}
