//
//  SignUpView.swift
//  Sharkle
//
//  Created by 김우성 on 2022/03/15.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject private var viewModel = SignUpViewModel()
    
    var body: some View {
        VStack {
            VStack(spacing: 30) {
                TextFieldWithValidation(placeholder: "이메일 주소", field: $viewModel.email, isValid: $viewModel.isEmailValid, validationMessage: "유효한 이메일을 입력해주세요.")
                
                TextFieldWithValidation(placeholder: "비밀번호", field: $viewModel.password, isValid: $viewModel.isPasswordValid, validationMessage: "6자리 이상의 비밀번호를 입력해주세요.", isSecure: true)
                
                TextFieldWithValidation(placeholder: "비밀번호 확인", field: $viewModel.passwordAgain, isValid: $viewModel.isPasswordConfirm, validationMessage: "비밀번호가 다릅니다.", isSecure: true)
                
                TextFieldWithValidation(placeholder: "사용자 이름", field: $viewModel.username, isValid: $viewModel.isUsernameValid, validationMessage: "2글자 이상의 이름을 입력해주세요.")
                
                TextFieldWithValidation(placeholder: "사용자 아이디", field: $viewModel.userId, isValid: $viewModel.isUserIdValid, validationMessage: "2글자 이상의 아이디를 입력해주세요.")
            }
            .padding()

            Button(action: {
                print("활성화")
                //viewModel.signup()
            }, label: {
                Text("회원가입")
            })
            .disabled(!(viewModel.isValid && viewModel.isPasswordConfirm))
            .padding()
        }

    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}


struct TextFieldWithValidation: View {
    var placeholder: String
    @Binding var field: String
    @Binding var isValid: Bool
    let validationMessage: String
    @State private var message: String = ""
    var isSecure = false
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if isSecure {
                    SecureField(placeholder, text: $field)
                } else {
                    TextField(placeholder, text: $field, onEditingChanged: { isChanged in
                        if !isChanged {
                            message = (isValid ? "" : validationMessage)
                        }
                    })
                }
            }
            .autocapitalization(.none)
            .padding(10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
            
            Text(message)
                .frame(height: 10)
                .font(.caption)
                .foregroundColor(Color.red)
        }
    }
}
