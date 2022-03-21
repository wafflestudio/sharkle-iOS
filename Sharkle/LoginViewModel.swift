//
//  LoginViewModel.swift
//  Sharkle
//
//  Created by 김우성 on 2022/03/15.
//

import Foundation
import SwiftUI
import Combine

final class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    private var cancellableBag = Set<AnyCancellable>()
    
    func login() {
        AuthAPI.login(email: email, password: password)
            .sink(receiveCompletion: { completion in
                guard case let .failure(error) = completion else { return }
                print(error)
            }, receiveValue: { response in 
                guard let data = try? response.map(LoginResponse.self) else {
                    return
                }
                
                AccountManager.isLoggedIn = true
            })
            .store(in: &cancellableBag)
    }
}
