//
//  User.swift
//  Navigation
//
//  Created by Николай Игнатов on 21.02.2023.
//

import UIKit

protocol UserService {
    var user: User { get }
    var password: String { get }
    func checkLogin(login: String, password: String) -> User?
}

class User {
    let login: String
    let fullName: String
    let avatar: UIImage
    let status: String
    
    init(login: String, fullName: String, avatar: UIImage, status: String) {
        self.login = login
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
    }
}

extension UserService {
    func checkLogin(login: String, password: String) -> User? {
        return login == user.login && password == password ? user : nil
    }
}
