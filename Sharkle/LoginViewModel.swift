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
    var cancellableBag = Set<AnyCancellable>()
    
    func login() -> AnyPublisher<Bool, Never> {
        return Future<Bool, Never> { promise in
            AuthAPI.login(email: self.email, password: self.password)
                
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .failure(_):
                        print("Login Error")
                    case .finished:
                        print("Finished")
                    }
                }, receiveValue: { response in
                    guard let data = try? response.mapJSON() else {
                        return
                    }
                    print(data)
                    
                    if response.statusCode == 200 {
                        promise(.success(true))
                    } else {
                        promise(.success(false))
                    }
                })
                .store(in: &self.cancellableBag)
        }
        .eraseToAnyPublisher()
    }
}
