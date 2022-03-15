//
//  ContentView.swift
//  sharkle
//
//  Created by 김우성 on 2022/02/27.
//

import SwiftUI
import Combine
import Moya

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
    
    let provide = MoyaProvider<AuthenitcationAPI>()
    var cancellable: AnyCancellable
    
    init() {
        cancellable = provide.requestPublisher(.signup(email: "40kimwoosung@gmail.com", user_id: "asdfjklgh1234", password: "password", username: "KIM"))
            .sink(receiveCompletion: { completion in
                guard case let .failure(error) = completion else { return }

                print(error)
            }, receiveValue: { response in
                print(response)
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
