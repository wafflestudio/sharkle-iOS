//
//  AccountManager.swift
//  Sharkle
//
//  Created by 김우성 on 2022/03/16.
//

import Foundation

struct AccountManager {
    private static let tokenKey = "Token"
    
    static var token: String? {
        get {
            return UserDefaults.standard.value(forKey: tokenKey) as? String
        }
        
        set {
            UserDefaults.standard.setValue(newValue, forKey: tokenKey)
        }
    }
}
