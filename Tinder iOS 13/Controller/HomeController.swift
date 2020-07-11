//
//  HomeController.swift
//  Tinder iOS 13
//
//  Created by Stanley Traub on 7/9/20.
//  Copyright © 2020 Stanley Traub. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    //MARK: - Properties
    
    private let topStack = HomeNavigationStackView()
    private let bottomStack = BottomControlsStackView()
    
    private let deckView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        view.layer.cornerRadius = 5
        return view
    }()
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureCards()
    }
    
    //MARK: - Helpers
    
    func configureCards() {
        
        let user1 = User(name: "Jane Doe", age: 22, images: [#imageLiteral(resourceName: "kelly1"), #imageLiteral(resourceName: "kelly2"), #imageLiteral(resourceName: "kelly3")])
        let user2 = User(name: "Megan", age: 21, images: [#imageLiteral(resourceName: "jane2"), #imageLiteral(resourceName: "jane1")])
        let cardView1 = CardView(viewModel: CardViewModel(user: user1))
        let cardView2 = CardView(viewModel: CardViewModel(user: user2))
      

        deckView.addSubview(cardView1)
        deckView.addSubview(cardView2)
        
        cardView1.fillSuperview()
        cardView2.fillSuperview()
    }
    
    func configureUI() {
        view.backgroundColor = .white
        
        let stack = UIStackView(arrangedSubviews: [topStack, deckView, bottomStack])
        stack.axis = .vertical
        view.addSubview(stack)
        
        view.addSubview(stack)
        stack.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor,
                        bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor)
        
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = .init(top: 0, left: 12, bottom: 0, right: 12)
        stack.bringSubviewToFront(deckView)
        
    }
}
