//
//  HomeViewModel.swift
//  Sharkle
//
//  Created by 김우성 on 2022/05/20.
//

import Foundation
import Combine
import Moya

final class HomeViewModel: ObservableObject {
    @Published 
    var cancellableBag = Set<AnyCancellable>()
    
    init() {
        
    }
}
