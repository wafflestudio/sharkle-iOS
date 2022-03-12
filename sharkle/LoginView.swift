//
//  LoginView.swift
//  sharkle
//
//  Created by 김우성 on 2022/03/07.
//

import SwiftUI

struct LoginView: View {
    @Binding var isLoggedIn: Bool
    @State private var id: String = ""
    @State private var password: String = ""
    
    var body: some View {
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
                    
                    VStack(spacing: 5) {
                        HStack {
                            Image(systemName: "person").foregroundColor(.gray)
                            TextField("아이디를 입력해주세요", text: $id)
                                .font(.subheadline)
                            
                            Button {
                                id = ""
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                            }
                            .opacity(id.isEmpty ? 0 : 1)
                            .disabled(id.isEmpty ? true : false)
                        }
                        .frame(width: 233, height: 34, alignment: .center)
                        .padding(.horizontal, 10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                        
                        
                        HStack {
                            Image(systemName: "lock").foregroundColor(.gray)
                            TextField("비밀번호를 입력해주세요", text: $password)
                                .font(.subheadline)
                            Button {
                                password = ""
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                            }
                            .opacity(password.isEmpty ? 0 : 1)
                            .disabled(password.isEmpty ? true : false)
                        }
                        .frame(width: 233, height: 34, alignment: .center)
                        .padding(.horizontal, 10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    }
                    
                    HStack(spacing: 17) {
                        Button {
                            isLoggedIn = true
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView(isLoggedIn: .constant(false))
                .previewInterfaceOrientation(.portrait)
        }
    }
}
