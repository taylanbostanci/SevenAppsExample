//
//  UserTableViewCell.swift
//  SevenApssExample
//
//  Created by ENQURA on 19.01.2025.
//

import UIKit

class UserTableViewCell: BaseTableViewCell<UserResponseModel> {

    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var userEmailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func configure(with responseData: UserResponseModel) {
        userNameLabel.text = responseData.name
        userEmailLabel.text = responseData.email
     }
    
}
