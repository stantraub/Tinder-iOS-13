//
//  SettingsController.swift
//  Tinder iOS 13
//
//  Created by Stanley Traub on 7/13/20.
//  Copyright © 2020 Stanley Traub. All rights reserved.
//

import UIKit

class SettingsController: UITableViewController {
    
    //MARK: - Properties
    
    private let headerView = SettingsHeader()
    private let imagePicker = UIImagePickerController()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleDone() {
        print("Tapped done")
    }
    
    //MARK: - Helpers
    
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
        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 300)
    }
}
//MARK: - SettingsHeaderDelegate

extension SettingsController: SettingsHeaderDelegate {
    func settingsHeader(_ header: SettingsHeader, didSelect index: Int) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    
}

//MARK: - UIImagePickerControllerDelegate

extension SettingsController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[.originalImage] as? UIImage
        
        dismiss(animated: true, completion: nil)
    }
}
