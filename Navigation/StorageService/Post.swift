//
//  Post.swift
//  Navigation
//
//  Created by Николай Игнатов on 19.12.2022.
//

import Foundation

public struct Post {
    public let autor: String
    public let description: String
    public let image: String
    public let likes: Int
    public let views: Int
    
}

public var posts = [Post(autor: "apple.com",
                         description: "Swift is a cool language",
                         image: "swift",
                         likes: 100,
                         views: 150),
                    
                    Post(autor: "apple.com",
                         description: "Introduce UIKit for iOS developers",
                         image: "uiKit",
                         likes: 70,
                         views: 100),
                    
                    Post(autor: "uncle Bob",
                         description: "SOLID principals",
                         image: "solid",
                         likes: 999,
                         views: 1000),
                    
                    Post(autor: "apple.com",
                         description: "Keychain is a cool and safty system storage",
                         image: "keychain",
                         likes: 50,
                         views: 200)
]
