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
    @Published var passwordAgain: String = ""
    @Published var username: String = ""
    @Published var isEmailValid = false
    @Published var isPasswordValid = false
    @Published var isPasswordConfirm = false
    @Published var isUsernameValid = false
    @Published var isUserIdValid = false
    @Published var isValid = false
    private var cancellableBag = Set<AnyCancellable>()
    
    init() {
        $email
            .map { email in
                let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
                let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
                return emailPredicate.evaluate(with: email)
            }
            .assign(to: \.isEmailValid, on: self)
            .store(in: &cancellableBag)
        
        $password
            .map { password in
                return password.count >= 6
            }
            .assign(to: \.isPasswordValid, on: self)
            .store(in: &cancellableBag)
        
        Publishers.CombineLatest($password, $passwordAgain)
            .map { password, passwordAagin in
                return password == passwordAagin
            }
            .assign(to: \.isPasswordConfirm, on: self)
            .store(in: &cancellableBag)
        
        $username
            .map { username in
                return username.count >= 2
            }
            .assign(to: \.isUsernameValid, on: self)
            .store(in: &cancellableBag)
        
        $userId
            .map { userId in
                return userId.count >= 2
            }
            .assign(to: \.isUserIdValid, on: self)
            .store(in: &cancellableBag)
        
        Publishers.CombineLatest4($isEmailValid, $isPasswordValid, $isUsernameValid, $isUserIdValid)
            .map {
                return ($0 && $1 && $2 && $3)
            }
            .assign(to: \.isValid, on: self)
            .store(in: &cancellableBag)
    }
        
    func signup() {
        print(email, userId, password, username)
        AuthAPI.signup(email: email, userId: userId, password: password, username: username)
            .sink(receiveCompletion: { completion in
                print(completion)
            }, receiveValue: { response in
                print(response.data)
            })
            .store(in: &cancellableBag)
    }
}
