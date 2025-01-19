//
//  Constants.swift
//  SevenApssExample
//
//  Created by TaylanBostanci on 19.01.2025.
//

import Foundation

struct Constants {
    struct TableViewCells {
        static let userTableViewCell = "UserTableViewCell"
    }
    
    struct Urls {
        static let baseURL = "https://jsonplaceholder.typicode.com"
        static let usersURL = "/users"
    }
    
    struct APIErors {
        static let invalidURL = "The URL provided is invalid."
        static let noDataReceived = "No data was received from the server."
        static let decodingFailed = "Failed to decode the response."
    }
    
    static let defaultFontSize = 16.0
    static let defaultCornerRadius = 12.0
    static let defaultPadding = 20.0
    static let defaultTopMargin = 100.0

}
