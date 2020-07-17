//
//  SettingsViewModel.swift
//  Tinder iOS 13
//
//  Created by Stanley Traub on 7/16/20.
//  Copyright © 2020 Stanley Traub. All rights reserved.
//

import Foundation

enum SettingsSections: Int, CaseIterable {
    case name
    case profession
    case age
    case bio
    case ageRange
    
    var description: String {
        switch self {
            case .name: return "Name"
            case .profession: return "Profession"
            case .age: return "Age"
            case .bio: return "Bio"
            case .ageRange: return "Seeking Age Range"
        }
    }
}

struct SettingsViewModel {
    
}
