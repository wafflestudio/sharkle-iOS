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
                CustomTextField(text: $viewModel.email,
                                placeHolder: "이메일",
                                isPasswordField: false,
                                errorMessage: viewModel.emailError)
                
                CustomTextField(text: $viewModel.userId,
                                placeHolder: "아이디",
                                isPasswordField: false,
                                errorMessage: viewModel.userIdError)
                
                CustomTextField(text: $viewModel.password,
                                placeHolder: "비밀번호",
                                isPasswordField: true,
                                errorMessage: viewModel.passwordError)
                
                CustomTextField(text: $viewModel.confirmPassword,
                                placeHolder: "비밀번호 확인",
                                isPasswordField: true,
                                errorMessage: viewModel.confirmPasswordError)
                
                CustomTextField(text: $viewModel.username,
                                placeHolder: "사용자 이름",
                                isPasswordField: false,
                                errorMessage: viewModel.usernameError)
            }
            .padding()
            Button(action: {
                
            }, label: {
                Text("회원가입")
                    .foregroundColor(.white)
            })
            .padding()
            .background(viewModel.isValid ? Color("LightBlue") : Color.gray)
            .cornerRadius(10)
            .disabled(!viewModel.isValid)
        }

    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
