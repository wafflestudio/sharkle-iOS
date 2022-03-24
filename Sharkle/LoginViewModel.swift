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
    
    func login() -> Bool {
        var success: Bool = false
        
        AuthAPI.login(email: self.email, password: self.password)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Login Error")
                    success = false
                case .finished:
                    print("Finished")
                }
            }, receiveValue: { response in
                success = true
                guard let data = try? response.mapJSON() else {
                    return
                }
                print("data: ", data)
            })
            .store(in: &self.cancellableBag)
        
        return success
    }
}
