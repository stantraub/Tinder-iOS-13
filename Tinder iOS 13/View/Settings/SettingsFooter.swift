//
//  SettingsFooter.swift
//  Tinder iOS 13
//
//  Created by Stanley Traub on 7/18/20.
//  Copyright © 2020 Stanley Traub. All rights reserved.
//

import UIKit

protocol SettingsFooterDelegate: class {
    func handleLogout()
}

class SettingsFooter: UIView {
    
    //MARK: - Properties
    
    weak var delegate: SettingsFooterDelegate?
    
    private lazy var logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Logout", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(handleLogout), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let spacer = UIView()
        spacer.backgroundColor = .systemGroupedBackground
        
        addSubview(spacer)
        spacer.setDimensions(height: 32, width: frame.width)
        
        addSubview(logoutButton)
        logoutButton.anchor(top: spacer.bottomAnchor, left: leftAnchor, right: rightAnchor, height: 50)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not be implemented.")
    }
    
    //MARK: - Selectors
    
    @objc func handleLogout() {
        delegate?.handleLogout()
    }

}
