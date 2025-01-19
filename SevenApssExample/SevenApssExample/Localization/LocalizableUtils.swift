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
        return appbundle.localizedString(forKey: key, value: "", table: "LocalizableStrings")
    }
    
    public enum Strings: String {
        case back = "back"
        case ok = "ok"
        case error = "error"
    }
}
