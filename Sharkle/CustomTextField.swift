//
//  CustomTextField.swift
//  Sharkle
//
//  Created by 김우성 on 2022/03/23.
//

import SwiftUI

struct CrossButton: View {
    @Binding var text: String
    var body: some View {
        Button(action: {
            self.text = ""
        }, label: {
            Image(systemName: "xmark.circle")
                .font(.system(size: 18))
        })
    }
}

struct CustomTextField: View {
    @Binding var text: String
    var placeHolder: String
    var isPasswordField: Bool
    var errorMessage: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(placeHolder)
                .foregroundColor(.black)
                .font(.headline)
                .opacity(0.5)
            
            HStack {
                if isPasswordField {
                    SecureField("", text: $text)
                        .foregroundColor(.black)
                        .font(.headline)
                } else {
                    TextField("", text: $text)
                        .foregroundColor(.black)
                        .font(.headline)
                        .autocapitalization(.none)
                }
                
                Spacer()
                
                CrossButton(text: $text)
                    .foregroundColor(errorMessage == nil ? .gray : .red)
                    .disabled(text == "")
                    .opacity(text == "" ? 0 : 1)
            }
            
            Rectangle()
                .fill(errorMessage == nil ? .gray: .red)
                .frame(height: 1)
                .padding(.top, 0)
            
            Text(errorMessage ?? "")
                .foregroundColor(.red)
                .font(.caption)
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: .constant("Good"), placeHolder: "Email", isPasswordField: false)
    }
}
