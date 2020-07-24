//
//  AuthButton.swift
//  Tinder iOS 13
//
//  Created by Stanley Traub on 7/11/20.
//  Copyright © 2020 Stanley Traub. All rights reserved.
//

import UIKit

class AuthButton: UIButton {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        layer.cornerRadius = 5
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        isEnabled = false
        setTitleColor(.white, for: .normal)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
