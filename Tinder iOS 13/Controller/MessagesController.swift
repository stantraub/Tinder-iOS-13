//
//  MessagesController.swift
//  Tinder iOS 13
//
//  Created by Stanley Traub on 7/23/20.
//  Copyright © 2020 Stanley Traub. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MessagesController: UITableViewController {
    //MARK: - Properties
    
    private let user: User
    
    private let headerView = MatchHeader()
    
    //MARK: - Lifecycle
    
    init(user: User) {
        self.user = user
        super.init(style: .plain)
    }
    
    override func viewDidLoad() {
        configureTableView()
        configureNavigationBar()
        fetchMatches()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Selectors
    
    @objc func handleDismissal() {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - API
    
    func fetchMatches() {
        Service.fetchMatches { matches in
            self.headerView.matches = matches
        }
    }
    
    //MARK: - Helpers
    
    func configureTableView() {
        tableView.rowHeight = 80
        tableView.tableFooterView = UIView()
        headerView.delegate = self
        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
        tableView.tableHeaderView = headerView
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    func configureNavigationBar() {
        let leftButton = UIImageView()
        leftButton.setDimensions(height: 28, width: 28)
        leftButton.isUserInteractionEnabled = true
        leftButton.image = #imageLiteral(resourceName: "app_icon").withRenderingMode(.alwaysTemplate)
        leftButton.tintColor = .lightGray
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleDismissal))
        leftButton.addGestureRecognizer(tap)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        
        let icon = UIImageView(image: #imageLiteral(resourceName: "top_right_messages").withRenderingMode(.alwaysTemplate))
        icon.tintColor = .systemPink
        navigationItem.titleView = icon
    }
}

//MARK: - UITableViewDataSource

extension MessagesController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        return cell
    }
}

//MARK: - UITableViewDelegate

extension MessagesController {
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.9826375842, green: 0.3476698399, blue: 0.447683692, alpha: 1)
        label.text = "Messages"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        view.addSubview(label)
        label.centerY(inView: view, leftAnchor: view.leftAnchor, paddingLeft: 12)
        return view
    }
}

//MARK: - MatchHeaderDelegate

extension MessagesController: MatchHeaderDelegate {
    func matchHeader(_ header: MatchHeader, wantsToStartChat uid: String) {
        Service.fetchUser(withUid: uid) { user in
            print("Start chat with \(user.name)")
        }
    }
    
    
}
