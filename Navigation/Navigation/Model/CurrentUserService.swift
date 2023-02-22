//
//  CurrentUserService.swift
//  Navigation
//
//  Created by Николай Игнатов on 21.02.2023.
//

import UIKit

final class CurrentUserService: UserService {
     
    var user = User(login: "hip", fullName: "Hipster Cat", avatar: UIImage(named: "2")!, status: "Waiting for smth...")
    
    var password: String
    
    init() {
        self.password = "password"
    }
}

