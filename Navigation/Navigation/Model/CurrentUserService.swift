//
//  CurrentUserService.swift
//  Navigation
//
//  Created by Николай Игнатов on 21.02.2023.
//

import UIKit

final class CurrentUserService: UserService {
    
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    func authorization(login: String, completion: @escaping (User?) -> Void) {
        guard user.login == login else {
            completion(nil)
            return
        }
        completion(user)
    }
}

