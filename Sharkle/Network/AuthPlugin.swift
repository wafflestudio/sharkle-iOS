//
//  AuthPlugin.swift
//  Sharkle
//
//  Created by 김우성 on 2022/03/19.
//

import Foundation
import Moya

struct AuthPlugin: PluginType {
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var request = request
        request.addValue("JWT " + AccountManager.accessToken!, forHTTPHeaderField: "Authorization")
        return request
    }
}
