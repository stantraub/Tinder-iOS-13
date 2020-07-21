//
//  ProfileViewModel.swift
//  Tinder iOS 13
//
//  Created by Stanley Traub on 7/20/20.
//  Copyright © 2020 Stanley Traub. All rights reserved.
//

import UIKit

struct ProfileViewModel {
    
    private let user: User
    let profession: String
    let bio: String
    
    var imageURLs: [URL] {
        return user.imageURLs.map({ URL(string: $0)!})
    }
    
    let userDetailsAttributedString: NSAttributedString
    
    var imageCount: Int {
        return user.imageURLs.count
    }
    
    init(user: User) {
        self.user = user
        
        let attributedText = NSMutableAttributedString(string: user.name,
                                                       attributes: [.font: UIFont.systemFont(ofSize: 24,
                                                                                             weight: .semibold)])
        attributedText.append(NSAttributedString(string: "  \(user.age)",
                                                    attributes: [.font: UIFont.systemFont(ofSize: 22)]))
        
        userDetailsAttributedString = attributedText
        
        profession = user.profession
        bio = user.bio
    }
}
