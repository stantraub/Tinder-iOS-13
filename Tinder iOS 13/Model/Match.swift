//
//  Match.swift
//  Tinder iOS 13
//
//  Created by Stanley Traub on 7/23/20.
//  Copyright © 2020 Stanley Traub. All rights reserved.
//

import Foundation

struct Match {
    let name: String
    let profileImageUrl: String
    let uid: String
    
    init(dictionary: [String: Any]) {
        self.name = dictionary["name"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
    }
}
