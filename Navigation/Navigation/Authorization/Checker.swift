//
//  Checker.swift
//  Navigation
//
//  Created by Николай Игнатов on 25.02.2023.
//

import Foundation

protocol LoginViewControllerDelegate {
    func check(login: String, password: String) -> Bool
}

final class Checker {
    
    static let shared = Checker()
    
    private let login = "login"
    
    private let password = "password"
    
    func check(login: String, password: String) -> Bool {
        guard login == self.login && password == self.password else { return false }
        return true
    }
    
    private init() {}
}
