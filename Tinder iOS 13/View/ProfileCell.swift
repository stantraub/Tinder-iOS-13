//
//  ProfileCell.swift
//  Tinder iOS 13
//
//  Created by Stanley Traub on 7/18/20.
//  Copyright © 2020 Stanley Traub. All rights reserved.
//

import UIKit

class ProfileCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.contentMode = .scaleAspectFill
        imageView.image = #imageLiteral(resourceName: "jane1")
        
        addSubview(imageView)
        imageView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
