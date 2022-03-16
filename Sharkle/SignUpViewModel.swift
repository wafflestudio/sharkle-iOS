//
//  SignUpViewModel.swift
//  Sharkle
//
//  Created by 김우성 on 2022/03/16.
//

import Foundation
import Combine
import Moya

final class SignUpViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var userId: String = ""
    @Published var password: String = ""
    @Published var username: String = ""
    private let provider = MoyaProvider<AuthenitcationAPI>()
    private var cancellableBag = Set<AnyCancellable>()
    
    func signUp() {
        print(email, userId, password, username)
        provider.requestPublisher(.signup(email: email, userId: userId, password: password, username: username))
            .sink(receiveCompletion: { completion in
                print("completion : \(completion)")
            }, receiveValue: { message in
                print("message: \(message)")
            }).store(in: &cancellableBag)
    }
}
