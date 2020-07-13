//
//  AuthenticationViewModel.swift
//  Tinder iOS 13
//
//  Created by Stanley Traub on 7/11/20.
//  Copyright © 2020 Stanley Traub. All rights reserved.
//

import Foundation

protocol AuthenticationViewModel {
    var formIsValid: Bool { get }
}

struct LoginViewModel: AuthenticationViewModel {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false &&
        password?.isEmpty == false
    }
}

struct RegistrationViewModel: AuthenticationViewModel {    
    var email: String?
    var fullname: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false &&
        password?.isEmpty == false &&
        fullname?.isEmpty == false
    }
}
