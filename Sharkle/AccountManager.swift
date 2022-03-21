//
//  AccountManager.swift
//  Sharkle
//
//  Created by 김우성 on 2022/03/16.
//

import Foundation
import SwiftUI

struct AccountManager {
    static var refreshToken: String? {
        get {
            return UserDefaults.standard.value(forKey: "RefreshToken") as? String
        }
        
        set {
            UserDefaults.standard.setValue(newValue, forKey: "RefreshToken")
        }
    }
    
    static var accessToken: String? {
        get {
            return UserDefaults.standard.value(forKey: "AccessToken") as? String
        }
        
        set {
            UserDefaults.standard.setValue(newValue, forKey: "AccessToken")
        }
    }
    
    static var isLoggedIn: Bool {
        get {
            guard let isLoggedIn = UserDefaults.standard.value(forKey: "IsLoggedIn") as? Bool else { return false }
            return isLoggedIn
        }
        
        set {
            UserDefaults.standard.setValue(newValue, forKey: "IsLoggedIn")
        }
    }
}
