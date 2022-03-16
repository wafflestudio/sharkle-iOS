//
//  AuthenticationAPI.swift
//  Sharkle
//
//  Created by 김우성 on 2022/03/14.
//
import Foundation
import Combine
import Moya

enum AuthenitcationService {
    case login(email: String, password: String)
    case signup(email: String, userId: String, password: String, username: String)
    case refresh(refresh: String)
    case verify(token: String)
}

extension AuthenitcationService: TargetType {
    var baseURL: URL {
        return URL(string: "http://sharkle-server.kro.kr/api/v1")!
    }
    
    var path: String {
        switch self {
        case .login:
            return "/auth/login/"
        case .signup:
            return "/auth/signup/"
        case .refresh:
            return "/auth/token/refresh/"
        case .verify:
            return "/auth/token/verify/"
        }
    }
    
    var method: Method {
        return .post
    }
    
    var task: Task {
        switch self {
        case let .login(email, password):
            return .requestJSONEncodable(["email": email, "password": password])
        case let .signup(email, userId, password, username):
            return .requestJSONEncodable(["email": email, "user_id": userId,"password": password, "username": username])
        case let .refresh(refresh):
            return .requestJSONEncodable(["refresh": refresh])
        case let .verify(token):
            return .requestJSONEncodable(["refresh": token])
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}

struct LoginResponse: Codable {
    var refresh: String?
    var access: String
}

struct AuthenticationAPI {
    private static var provider = MoyaProvider<AuthenitcationService>()
    
    static func login(email: String, password: String) -> AnyPublisher<Response, MoyaError> {
        return provider.requestPublisher(.login(email: email, password: password))
    }
    
    static func signup(email: String, userId: String, password: String, username: String) -> AnyPublisher<Response, MoyaError> {
        return provider.requestPublisher(.signup(email: email, userId: userId, password: password, username: username))
    }
    
    static func refresh(refresh: String) -> AnyPublisher<Response, MoyaError> {
        return provider.requestPublisher(.refresh(refresh: refresh))
    }
    
    static func verify(token: String) -> AnyPublisher<Response, MoyaError> {
        return provider.requestPublisher(.verify(token: token))
    }
}
