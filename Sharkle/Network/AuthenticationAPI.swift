//
//  AuthenticationAPI.swift
//  Sharkle
//
//  Created by 김우성 on 2022/03/14.
//

import Combine
import Moya

enum AuthenitcationAPI {
    case login(email: String, password: String)
    case signup(email: String, user_id: String, password: String, username: String)
}

extension AuthenitcationAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://sharkle-server.kro.kr/api/v1")!
    }
    
    var path: String {
        switch self {
        case .login:
            return "/auth/login"
        case .signup:
            return "/auth/signup"
        }
    }
    
    var method: Method {
        switch self {
        case .login:
            return .get
        case .signup:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case let .login(email, password):
            return .requestJSONEncodable(["email": email, "password": password])
        case let .signup(email, user_id, password, username):
            return .requestJSONEncodable(["email": email, "user_id": user_id,"password": password, "username": username])
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}

struct LoginResponse: Codable {
    var refresh: String
    var access: String
}
