//
//  SettingsCell.swift
//  Tinder iOS 13
//
//  Created by Stanley Traub on 7/16/20.
//  Copyright © 2020 Stanley Traub. All rights reserved.
//

import UIKit

class SettingsCell: UITableViewCell {
    
    //MARK: - Properties
    
    lazy var inputField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.font = UIFont.systemFont(ofSize: 16)
        
        tf.placeholder = "Enter value here..."
        
        let paddingView = UIView()
        paddingView.setDimensions(height: 50, width: 28)
        
        tf.leftView = paddingView
        tf.leftViewMode = .always
        
        return tf
    }()
    
    let minAgeLabel = UILabel()
    let maxAgeLabel = UILabel()
    
    lazy var minAgeSlider = createAgeRangeSlider()
    lazy var maxAgeSlider = createAgeRangeSlider()
    
    //MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(inputField)
        inputField.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Selectors
    
    @objc func handleAgeRangeChanged() {
        
    }
    
    // MARK: Helpers
    
    func createAgeRangeSlider() -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 18
        slider.maximumValue = 60
        slider.addTarget(self, action: #selector(handleAgeRangeChanged), for: .valueChanged)
        return slider
    }
}
