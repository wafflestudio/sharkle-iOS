//
//  LoginView.swift
//  sharkle
//
//  Created by 김우성 on 2022/03/07.
//

import SwiftUI

struct LoginView: View {
    @State private var id: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            Color("LoginBackgroundColor")
                .ignoresSafeArea()
                .overlay(
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Image(systemName: "")
                                .frame(width: 26, height: 26, alignment: .leading)
                                .background(.gray)
                                .cornerRadius(.infinity)
                            
                            Text("Sharkle")
                        }
                        .frame(width: 126, height: 26, alignment: .leading)
                        
                        VStack(spacing: 3) {
                            TextField("아이디를 입력해주세요", text: $id)
                                .frame(width: 253, height: 34, alignment: .center)
                                .textFieldStyle(.roundedBorder)
                            
                            TextField("비밀번호를 입력해주세요", text: $password)
                                .frame(width: 253, height: 34, alignment: .center)
                                .textFieldStyle(.roundedBorder)
                        }
                        
                        HStack(spacing: 17) {
                            Button {
                                
                            } label: {
                                Text("로그인")
                                    .foregroundColor(.white)
                                    .fontWeight(.medium)
                            }
                            .frame(width: 118, height: 38, alignment: .center)
                            .background(.blue)
                            .cornerRadius(5)

                            Button {
                                
                            } label: {
                                Text("회원 가입")
                                    .foregroundColor(.gray)
                                    .fontWeight(.medium)
                            }
                            .frame(width: 118, height: 38, alignment: .center)
                            .background(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.gray, lineWidth: 1)
                            )
                        }
                    }
                    .frame(width: 300, height: 200, alignment: .center)
                    .background(.white)
                    .cornerRadius(15))
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
