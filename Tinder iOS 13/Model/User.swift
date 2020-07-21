//
//  User.swift
//  Tinder iOS 13
//
//  Created by Stanley Traub on 7/9/20.
//  Copyright © 2020 Stanley Traub. All rights reserved.
//

import UIKit

struct User {
    var name: String
    var age: Int
    var email: String
    let uid: String
    var imageURLs: [String]
    var profession: String
    var minSeekingAge: Int
    var maxSeekingAge: Int
    var bio: String
    
    init(dictionary: [String: Any]) {
        self.age = dictionary["age"] as? Int ?? 0
        self.email = dictionary["email"] as? String ?? ""
        self.imageURLs = dictionary["imageURLs"] as? [String] ?? [String]()
        self.name = dictionary["fullname"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
        self.profession = dictionary["profession"] as? String ?? ""
        self.minSeekingAge = dictionary["minSeekingAge"] as? Int ?? 18
        self.maxSeekingAge = dictionary["maxSeekingAge"] as? Int ?? 40
        self.bio = dictionary["bio"] as? String ?? ""
    }
}
