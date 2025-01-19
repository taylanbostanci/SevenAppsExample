//
//  UserTableViewCell.swift
//  SevenApssExample
//
//  Created by TaylanBostanci on 19.01.2025.
//

import UIKit

final class UserTableViewCell: BaseTableViewCell<UserResponseModel> {
    
    // MARK: - UI Elements
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    
    
    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    // MARK: - Setup UI Elements
    func configureUI() {
        stackView.backgroundColor = .cyan
        stackView.layer.cornerRadius = 12
        
        userNameLabel.font = .boldSystemFont(ofSize: 16)
        userEmailLabel.font = .italicSystemFont(ofSize: 16)
    }
    
    // MARK: - Configure UI with ResponseModel Data
    override func configure(with responseData:  UserResponseModel) {
        userNameLabel.text = responseData.name
        userEmailLabel.text = responseData.email
    }
}
