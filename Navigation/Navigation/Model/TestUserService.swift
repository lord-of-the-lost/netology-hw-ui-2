//
//  TestUserService.swift
//  Navigation
//
//  Created by Николай Игнатов on 22.02.2023.
//

import UIKit

final class TestUserService: UserService {
    
    private let user: User
    
    init() {
        self.user = User(
            login: "test",
            fullName: "Test User",
            avatar: UIImage(systemName: "photo")!,
            status: "Active"
        )
    }
    
    func authorization(login: String, completion: @escaping (User?) -> Void) {
        guard user.login == login else {
            completion(nil)
            return
        }
        completion(user)
    }
}
