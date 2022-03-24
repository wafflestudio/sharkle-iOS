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
    @Published var confirmPassword: String = ""
    @Published var username: String = ""
    @Published var isValid: Bool = false
    @Published var emailError: String?
    @Published var isPasswordValid: Bool = false
    @Published var passwordError: String?
    @Published var confirmPasswordError: String?
    @Published var usernameError: String?
    @Published var userIdError: String?
    private var cancellableBag = Set<AnyCancellable>()
    
    init() {
        emailValidPublisher
            .dropFirst()
            .sink { isValid in
                self.emailError = isValid ? nil : "유효한 이메일을 입력해주세요."
            }
            .store(in: &cancellableBag)
        
        passwordValidPublisher
            .dropFirst()
            .sink { isValid in
                self.passwordError = isValid ? nil : "6자리 이상의 비밀번호를 입력해주세요."
            }
            .store(in: &cancellableBag)
        
        confirmPasswordValidPublisher
            .dropFirst()
            .sink { isValid in
                self.confirmPasswordError = isValid ? nil : "비밀번호가 일치하지 않습니다."
            }
            .store(in: &cancellableBag)
        
        usernameValidPublisher
            .dropFirst()
            .sink { isValid in
                self.usernameError = isValid ? nil : "2글자 이상의 이름을 입력해주세요."
            }
            .store(in: &cancellableBag)
        
        userIdValidPublisher
            .dropFirst()
            .sink { isValid in
                self.userIdError = isValid ? nil : "3글자 이상의 아이디를 입력해주세요."
            }
            .store(in: &cancellableBag)
        
        Publishers.CombineLatest(passwordValidPublisher, confirmPasswordValidPublisher)
            .dropFirst()
            .sink { isPasswordValid, isConfirmPasswordValid in
                self.isPasswordValid = isPasswordValid && isConfirmPasswordValid
            }
            .store(in: &cancellableBag)
        
        Publishers.CombineLatest4(emailValidPublisher, $isPasswordValid, usernameValidPublisher, userIdValidPublisher)
            .dropFirst()
            .sink { isEmailValid, isPasswordValid, isUsernameValid, isUserIdValid in
                self.isValid = isEmailValid && isPasswordValid && isUsernameValid && isUserIdValid
            }
            .store(in: &cancellableBag)
    }
    
    private var emailValidPublisher: AnyPublisher<Bool, Never> {
        $email
            .removeDuplicates()
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .map { email in
                let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
                let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
                return emailPredicate.evaluate(with: email)
            }
            .eraseToAnyPublisher()
    }
    
    private var passwordValidPublisher: AnyPublisher<Bool, Never> {
        $password
            .removeDuplicates()
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { password in
                return password.count >= 6
            }
            .eraseToAnyPublisher()
    }
    
    private var confirmPasswordValidPublisher: AnyPublisher<Bool, Never> {
        $confirmPassword
            .removeDuplicates()
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { confirmPassword in
                return self.password == confirmPassword
            }
            .eraseToAnyPublisher()
    }
    
    private var usernameValidPublisher: AnyPublisher<Bool, Never> {
        $username
            .removeDuplicates()
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { username in
                return username.count >= 2
            }
            .eraseToAnyPublisher()
    }
    
    private var userIdValidPublisher: AnyPublisher<Bool, Never> {
        $userId
            .removeDuplicates()
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { userId in
                return userId.count >= 3
            }
            .eraseToAnyPublisher()
    }
    
        
    func signup() -> Bool {
        var success: Bool = false
        
        AuthAPI.signup(email: self.email, userId: self.userId, password: self.password, username: self.username)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("finished")
                case .failure(let error):
                    print("SignUp Error")
                    success = false
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
