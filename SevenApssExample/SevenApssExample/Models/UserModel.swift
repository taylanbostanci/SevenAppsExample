//
//  Model.swift
//  SevenApssExample
//
//  Created by TaylanBostanci on 19.01.2025.
//

import Foundation

struct UserModel {
    var id: Int
    var name: String
    var surname: String
    var email: String
    var phone: String
}

struct UserResponseModel: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let phone: String
    let website: String
}
