//
//  LoginView.swift
//  Sharkle
//
//  Created by 김우성 on 2022/03/15.

import SwiftUI

struct LoginView: View {
    @ObservedObject private var viewModel = LoginViewModel()
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("LightGray").edgesIgnoringSafeArea(.all)
                
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
                            TextField("이메일를 입력해주세요", text: $viewModel.email)
                                .font(.subheadline)
                                .autocapitalization(.none)
                            
                            Button(action: {
                                viewModel.email = ""
                            }, label: {
                                Image(systemName: "xmark.circle")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 10.5))
                            })
                            .opacity(viewModel.email.isEmpty ? 0 : 1)
                            .disabled(viewModel.email.isEmpty ? true : false)
                        }
                        .frame(width: 233, height: 34, alignment: .center)
                        .padding(.horizontal, 10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                        
                        
                        HStack {
                            Image(systemName: "lock").foregroundColor(.gray)
                            SecureField("비밀번호를 입력해주세요", text: $viewModel.password)
                                .font(.subheadline)
                                .autocapitalization(.none)
                            Button(action: {
                                viewModel.password = ""
                            }, label: {
                                Image(systemName: "xmark.circle")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 10.5))
                            })
                            .opacity(viewModel.password.isEmpty ? 0 : 1)
                            .disabled(viewModel.password.isEmpty ? true : false)
                        }
                        .frame(width: 233, height: 34, alignment: .center)
                        .padding(.horizontal, 10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    }
                    
                    HStack(spacing: 17) {
                        Button {
                            print("Login Button Click!")
                            viewModel.login()
                            print(AccountManager.isLoggedIn)
                        } label: {
                            Text("로그인")
                                .foregroundColor(.white)
                                .fontWeight(.medium)
                        }
                        .frame(width: 118, height: 38, alignment: .center)
                        .background((viewModel.email == "" || viewModel.password == "") ?  Color.gray : Color("LightBlue"))
                        .cornerRadius(10)
                        .disabled(viewModel.email == "" || viewModel.password == "")
                        

                        NavigationLink(destination: {
                            SignUpView()
                        }, label: {
                            Text("회원 가입")
                                .foregroundColor(.gray)
                                .fontWeight(.medium)
                                .frame(width: 118, height: 38, alignment: .center)
                                .background(.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.gray, lineWidth: 1)
                                )
                        })
                    }
                }
                .frame(width: 300, height: 200, alignment: .center)
                .background(.white)
                .cornerRadius(15)
                .navigationBarHidden(true)
            }
        }
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
