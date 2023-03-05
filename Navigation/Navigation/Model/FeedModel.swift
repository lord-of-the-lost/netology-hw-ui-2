//
//  FeedModel.swift
//  Navigation
//
//  Created by Николай Игнатов on 05.03.2023.
//

import Foundation

final class FeedModel {
    private let secretWord = "Password"

    func check(word: String){
        let isCorrect = word == secretWord
        let name = isCorrect ? Notification.Name("PasswordIsCorrect") : Notification.Name("PasswordIsIncorrect")
        NotificationCenter.default.post(name: name, object: nil)
    }
}
