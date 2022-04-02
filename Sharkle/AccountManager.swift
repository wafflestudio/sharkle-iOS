//
//  AccountManager.swift
//  Sharkle
//
//  Created by 김우성 on 2022/03/16.
//

import Foundation
import SwiftUI
import Combine

struct AccountManager {
    static private var cancellableBag = Set<AnyCancellable>()
    
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
    
    static func verifyToken(token: String) {
        AuthAPI.verify(token: token)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("finished")
                case .failure(_):
                    print("Verify Token Error")
                }
            }, receiveValue: { response in
                if response.statusCode == 200 {
                    
                } else {
                    
                }
            })
            .store(in: &cancellableBag)
            
    }
    
    static func refreshing() {
        guard let refreshToken = self.refreshToken else { return }
        
        AuthAPI.refresh(refresh: refreshToken)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("finished")
                case .failure(_):
                    print("Refresh Token Error")
                }
            }, receiveValue: { response in
                
            })
            .store(in: &cancellableBag)
    }
}
