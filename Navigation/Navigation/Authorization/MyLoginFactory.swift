//
//  MyLoginFactory.swift
//  Navigation
//
//  Created by Николай Игнатов on 25.02.2023.
//

import Foundation

protocol LoginFactory {
    func makeLoginInspector() -> LoginInspector
}

struct MyLoginFactory: LoginFactory {
    
    func makeLoginInspector() -> LoginInspector {
        return LoginInspector()
    }
}
