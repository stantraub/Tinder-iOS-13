//
//  SettingsController.swift
//  Tinder iOS 13
//
//  Created by Stanley Traub on 7/13/20.
//  Copyright © 2020 Stanley Traub. All rights reserved.
//

import UIKit
import JGProgressHUD

private let reuseIdentifier = "SettingsCell"

protocol SettingsControllerDelegate: class {
    func settingsController(_ controller: SettingsController, wantsToUpdate user: User)
    func settingsControllerWantsToLogout(_ controller: SettingsController)
}

class SettingsController: UITableViewController {
    
    //MARK: - Properties
    private var user: User
    private let footerView = SettingsFooter()
    private lazy var headerView = SettingsHeader(user: user)
    private let imagePicker = UIImagePickerController()
    private var imageIndex = 0
    
    weak var delegate: SettingsControllerDelegate?
    
    //MARK: - Lifecycle
    
    init(user: User) {
        self.user = user
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleDone() {
        view.endEditing(true)
        let hud = JGProgressHUD(style: .dark)
        hud.textLabel.text = "Saving Your Data"
        hud.show(in: view)
        
        Service.saveUserData(user: user) { (error) in
            self.delegate?.settingsController(self, wantsToUpdate: self.user)
            hud.dismiss()
        }
        
    }
    
    //MARK: - API
    
    func uploadImage(image: UIImage) {
        let hud = JGProgressHUD(style: .dark)
        hud.textLabel.text = "Saving image"
        hud.show(in: view)
        
        Service.uploadImage(image: image) { imageUrl in
            self.user.imageURLs.append(imageUrl)
            hud.dismiss()
        }
    }
    
    //MARK: - Helpers
    
    func setHeaderImage(_ image: UIImage?) {
        headerView.buttons[imageIndex].setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
    }
    
    func configureUI() {
        headerView.delegate = self
        imagePicker.delegate = self
        
        navigationItem.title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .black
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDone))
        
        tableView.separatorStyle = .none
        
        tableView.tableHeaderView = headerView
        tableView.backgroundColor = .systemGroupedBackground
        tableView.rowHeight = 44
        tableView.register(SettingsCell.self, forCellReuseIdentifier: reuseIdentifier)
        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 300)
        
        tableView.tableFooterView = footerView
        footerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 88)
        footerView.delegate = self
    }
}

//MARK: - UITableViewDataSource

extension SettingsController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return SettingsSections.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SettingsCell
        guard let section = SettingsSections(rawValue: indexPath.section) else { return cell}
        let viewModel = SettingsViewModel(user: user, section: section)
        cell.viewModel = viewModel
        cell.delegate = self
        return cell
    }
}

//MARK: - UITableViewDelegete

extension SettingsController {
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 32
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let section = SettingsSections(rawValue: section) else { return nil }
        return section.description
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let section = SettingsSections(rawValue: indexPath.section) else { return 0 }
        return section == .ageRange ? 96 : 44
        
    }
}

//MARK: - SettingsHeaderDelegate

extension SettingsController: SettingsHeaderDelegate {
    func settingsHeader(_ header: SettingsHeader, didSelect index: Int) {
        self.imageIndex = index
        present(imagePicker, animated: true, completion: nil)
    }
    
    
}

//MARK: - UIImagePickerControllerDelegate

extension SettingsController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        
        uploadImage(image: selectedImage)
        setHeaderImage(selectedImage)
        dismiss(animated: true, completion: nil)
    }
}

extension SettingsController: SettingsCellDelegate {
    func settingsCell(_ cell: SettingsCell, wantsToUpdateAgeRangeWith sender: UISlider) {
        if sender == cell.minAgeSlider {
            user.minSeekingAge = Int(sender.value)
        } else {
            user.maxSeekingAge = Int(sender.value)
        }
    }
    
    func settingsCell(_ cell: SettingsCell, wantsToUpdateUserWith value: String, for section: SettingsSections) {
        switch section {
        case .name:
            user.name = value
        case .profession:
            user.profession = value
        case .age:
            user.age = Int(value) ?? user.age
        case .bio:
            user.bio = value
        case .ageRange:
            break
        }
        
        print("USer is \(user)")
    }
}

extension SettingsController: SettingsFooterDelegate {
    func handleLogout() {
        delegate?.settingsControllerWantsToLogout(self)
    }
    
    
}
