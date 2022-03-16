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
        VStack(spacing: 25) {
            HStack {
                Text("이메일")
                TextField("이메일 주소", text: $viewModel.email)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
            }
            
            HStack {
                Text("아이디")
                TextField("아이디 입력", text: $viewModel.userId)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
            }
            
            HStack {
                Text("비밀번호")
                TextField("비밀번호 입력", text: $viewModel.password)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
            }
            
            HStack {
                Text("이름")
                TextField("이름", text: $viewModel.username)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
            }
            
            Button(action: {
                viewModel.signup()
            }, label: {
                Text("회원가입")
            })
            .padding()
        }
        .padding()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
