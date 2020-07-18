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
    private let user: User
    let section: SettingsSections
    
    let placeholderText: String
    var value: String?
    
    var shouldHideInputField: Bool {
        return section == .ageRange
    }
    
    var shouldHideSlider: Bool {
        return section != .ageRange
    }
    
    init(user: User, section: SettingsSections) {
        self.user = user
        self.section = section
        
        placeholderText = "Enter \(section.description.lowercased()).."
        
        switch section {
        case .name:
            value = user.name
        case .profession:
            value = user.profession
        case .age:
            value = "\(user.age)"
        case .bio:
            value = user.bio
        case .ageRange:
            break
        }
    }
}
