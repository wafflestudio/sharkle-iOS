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
    @Published private(set) var circles: [Circle] = .init()
    @Published var isLoading = false
    @Published var isErrorAlert = false
    @Published var errorMessage = ""
    
    private var bag = Set<AnyCancellable>()
    
    private let getCircleListSubject = PassthroughSubject<Void, Never>()
    
    private let circleListSubject = PassthroughSubject<CircleResponse, Never>()
    private let isLoadingSubject = PassthroughSubject<Bool, Never>()
    private let errorSubject = PassthroughSubject<Error, Never>()
    
    init() {
        bindInputs()
        bindOutputs()
    }
    
    deinit {
        bag.removeAll()
    }
    
    func apply() {
        getCircleListSubject.send(())
    }
    
    func bindInputs() {
        getCircleListSubject
            .flatMap { _ in
                CircleAPI.getCircle()
                    .catch { [weak self] error -> Empty<CircleResponse, Never> in
                        self?.errorSubject.send(error)
                        return .init()
                    }
            }.share()
            .subscribe(circleListSubject)
            .store(in: &bag)
        
        getCircleListSubject
            .map { _ in true }
            .share()
            .subscribe(isLoadingSubject)
            .store(in: &bag)
    }
    
    func bindOutputs() {
        isLoadingSubject
            .assign(to: \.isLoading, on: self)
            .store(in: &bag)

        circleListSubject
            .map { _ in false }
            .assign(to: \.isLoading, on: self)
            .store(in: &bag)

        circleListSubject
            .sink(receiveValue: {
                self.circles = $0.results
            })
            .store(in: &bag)

        errorSubject
            .map { _ in false }
            .assign(to: \.isLoading, on: self)
            .store(in: &bag)

        errorSubject
            .map { _ in true }
            .assign(to: \.isErrorAlert, on: self)
            .store(in: &bag)

        errorSubject
            .map { $0.localizedDescription }
            .assign(to: \.errorMessage, on: self)
            .store(in: &bag)
    }
}
