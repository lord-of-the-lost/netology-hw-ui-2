//
//  CustomButton.swift
//  Navigation
//
//  Created by Николай Игнатов on 05.03.2023.
//

import UIKit

final class CustomButton: UIButton {
    
    private var buttonAction: (() -> Void)?
    
    init(title: String?, titleColor: UIColor?, backgroundColor: UIColor?, font: UIFont?, cornerRadius: CGFloat?, borderWidth: CGFloat?, borderColor: UIColor?, buttonAction: (() -> Void)?) {
        super.init(frame: .zero)
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = font
        self.layer.cornerRadius = cornerRadius ?? 0
        self.layer.borderWidth = borderWidth ?? 0
        self.layer.borderColor = borderColor?.cgColor
        self.buttonAction = buttonAction
        self.translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonTapped() {
        buttonAction?()
    }
}
