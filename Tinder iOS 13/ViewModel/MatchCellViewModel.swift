//
//  MatchCellViewModel.swift
//  Tinder iOS 13
//
//  Created by Stanley Traub on 7/23/20.
//  Copyright © 2020 Stanley Traub. All rights reserved.
//

import Foundation

struct MatchCellViewModel {
    
    let nameText: String
    var profileImageUrl: URL?
    let uid: String
    
    init(match: Match) {
        nameText = match.name
        profileImageUrl = URL(string: match.profileImageUrl)
        uid = match.uid
    }
}
