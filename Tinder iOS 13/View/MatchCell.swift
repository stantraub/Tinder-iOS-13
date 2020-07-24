//
//  MatchCell.swift
//  Tinder iOS 13
//
//  Created by Stanley Traub on 7/23/20.
//  Copyright © 2020 Stanley Traub. All rights reserved.
//

import UIKit

class MatchCell: UICollectionViewCell {
    //MARK: - Properties
    
    var viewModel: MatchCellViewModel! {
        didSet {
            usernameLabel.text = viewModel.nameText
            profileImageView.sd_setImage(with: viewModel.profileImageUrl)
        }
    }
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.setDimensions(height: 80, width: 80)
        imageView.layer.cornerRadius = 80 / 2
        return imageView
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let stack = UIStackView(arrangedSubviews: [profileImageView, usernameLabel])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.alignment = .center
        stack.spacing = 6
        
        addSubview(stack)
        stack.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
