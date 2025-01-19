//
//  LocalizableUtils.swift
//  SevenApssExample
//
//  Created by TaylanBostanci on 19.01.2025.
//

import Foundation

class LocalizableUtils: NSObject {
    static let shared = LocalizableUtils()
    
    var appbundle = Bundle.main
    
    func stringForKey(key: String) -> String {
        return appbundle.localizedString(forKey: key, value: "", table: "Localizable")
    }
    
    public enum Strings: String {
        
        //Common Cases
        case back = "back"
        case ok = "ok"
        case error = "error"
        
        //User List Page Cases
        case userList = "user_list"
        
        //Detail Page Cases
        case name = "name"
        case email = "email"
        case phone = "phone"
        case website = "website"
        case userDetailPage = "user_detail_page"
        
        //API Errors
        case invalidURL = "invalidURL"
        case noData = "noData"
        case failed_decode_response = "failed_decode_response"

    }
}
