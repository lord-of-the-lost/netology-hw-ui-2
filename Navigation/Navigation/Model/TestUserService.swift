//
//  TestUserService.swift
//  Navigation
//
//  Created by Николай Игнатов on 22.02.2023.
//

import UIKit

final class TestUserService: UserService {
    
    var password: String
    
    var user: User
    
    init() {
        self.user = User(
            login: "test",
            fullName: "Test User",
            avatar: UIImage(systemName: "photo")!,
            status: "Active"
        )
        self.password = "test"
    }
}
