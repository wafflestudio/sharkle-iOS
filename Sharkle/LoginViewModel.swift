//
//  LoginViewModel.swift
//  Sharkle
//
//  Created by 김우성 on 2022/03/15.
//

import Foundation
import Combine

final class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    private var cancellableBag = Set<AnyCancellable>()
    
    func login() {
        
    }
}
