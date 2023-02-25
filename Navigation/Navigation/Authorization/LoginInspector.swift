//
//  LoginInspector.swift
//  Navigation
//
//  Created by Николай Игнатов on 25.02.2023.
//

import Foundation

struct LoginInspector: LoginViewControllerDelegate {
    func check(login: String, password: String) -> Bool {
        return Checker.shared.check(login: login, password: password)
    }
}
