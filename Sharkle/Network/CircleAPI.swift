//
//  CircleAPI.swift
//  Sharkle
//
//  Created by 김우성 on 2022/05/20.
//

import Foundation
import Combine
import Moya

enum CircleService {
    case createCircle(type0: Int, type1: Int, name: String, bio: String, introduction: String, tag: String, homepage: String, facebook: String, instagram: String, twitter: String, youtube: String, tiktok: String, band: String)
    case getCircle(name: String, tag: String, tag_str: String, type0: String, type1: String, offset: Int, limit: Int)
    case viewCircle(id: Int)
    case editCircle(id: Int, type0: Int, type1: Int, name: String, bio: String, introduction: String, tag: String, homepage: String, facebook: String, instagram: String, twitter: String, youtube: String, tiktok: String, band: String)
    case deleteCircle(id: Int)
}

extension CircleService: TargetType {
    var baseURL: URL {
        return URL(string: "http://sharkle-server.kro.kr/api/v1")!
    }
    
    var path: String {
        switch self {
        case .createCircle:
            return "/circle/"
        case .getCircle:
            return "/circle/"
        case let .viewCircle(id):
            return "/circle/\(id)/"
        case let .editCircle(id):
            return "/circle/\(id)/"
        case let .deleteCircle(id):
            return "/circle/\(id)/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .createCircle:
            return .post
        case .getCircle:
            return .get
        case .viewCircle:
            return .get
        case .editCircle:
            return .put
        case .deleteCircle:
            return .delete
        }
    }
    
    var task: Task {
        switch self {
        case let .createCircle(type0, type1, name, bio, introduction, tag, homepage, facebook, instagram, twitter, youtube, tiktok, band):
            return .requestJSONEncodable(["type0": String(type0),
                                          "type1": String(type1),
                                          "name": name,
                                          "bio": bio,
                                          "introduction": introduction,
                                          "tag": tag,
                                          "homepage": homepage,
                                          "facebook": facebook,
                                          "instagram": instagram,
                                          "twitter": twitter,
                                          "youtube": youtube,
                                          "tiktok": tiktok,
                                          "band": band])
        case let .getCircle(name, tag, tag_str, type0, type1, offset, limit):
            return .requestJSONEncodable(["name": name,
                                          "tag": tag,
                                          "tag_str": tag_str,
                                          "type0": type0,
                                          "type1": type1,
                                          "offset": String(offset),
                                          "limit": String(limit)])
        case .viewCircle:
            return .requestPlain
        case let .editCircle(_, type0, type1, name, bio, introduction, tag, homepage, facebook, instagram, twitter, youtube, tiktok, band):
            return .requestJSONEncodable(["type0": String(type0),
                                           "type1": String(type1),
                                           "name": name,
                                           "bio": bio,
                                           "introduction": introduction,
                                           "tag": tag,
                                           "homepage": homepage,
                                           "facebook": facebook,
                                           "instagram": instagram,
                                           "twitter": twitter,
                                           "youtube": youtube,
                                           "tiktok": tiktok,
                                           "band": band])
        case .deleteCircle:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}

struct Circle: Codable {
    var id: Int
    var type0: Int
    var type1: Int
    var name: String
    var bio: String
    var introduction: String?
    var tag: String
    var homepage: Homepage
    
    struct Homepage: Codable {
        var id: Int
        var homepage: String?
        var facebook: String?
        var instagram: String?
        var twitter: String?
        var youtube: String?
        var tiktok: String?
        var band: String?
    }
}

struct CircleAPI {
    private static var provider = MoyaProvider<CircleService>(plugins: [AuthPlugin()])
    
    static func createCircle(circle: Circle) -> AnyPublisher<Response, MoyaError> {
        return provider.requestPublisher(.createCircle(type0: circle.type0,
                                                       type1: circle.type1,
                                                       name: circle.name,
                                                       bio: circle.bio,
                                                       introduction: circle.bio ??,
                                                       tag: circle.tag,
                                                       homepage: circle.homepage.homepage ?? "",
                                                       facebook: circle.homepage.facebook ?? "",
                                                       instagram: circle.homepage.instagram ?? "",
                                                       twitter: circle.homepage.twitter ?? "",
                                                       youtube: circle.homepage.youtube ?? "",
                                                       tiktok: circle.homepage.tiktok ?? "",
                                                       band: circle.homepage.band ?? ""))
    }
    
    static func getCircle(name: String, tag: String, tag_str: String, type0: String, type1: String, offset: Int, limit: Int) -> AnyPublisher<Response, MoyaError> {
        return provider.requestPublisher(.getCircle(name: name,
                                                    tag: tag,
                                                    tag_str: tag_str,
                                                    type0: type0,
                                                    type1: type1,
                                                    offset: offset,
                                                    limit: limit))
    }
    
    static func viewCircle(id: Int) -> AnyPublisher<Response, MoyaError> {
        return provider.requestPublisher(.viewCircle(id: id))
    }
    
    static func editCircle(id: Int, circle: Circle) -> AnyPublisher<Response, MoyaError> {
        return provider.requestPublisher(.editCircle(id: id,
                                                     type0: circle.type0,
                                                     type1: circle.type1,
                                                     name: circle.name,
                                                     bio: circle.bio,
                                                     introduction: circle.introduction ?? "",
                                                     tag: circle.tag,
                                                     homepage: circle.homepage.homepage ?? "",
                                                     facebook: circle.homepage.facebook ?? "",
                                                     instagram: circle.homepage.instagram ?? "",
                                                     twitter: circle.homepage.twitter ?? "",
                                                     youtube: circle.homepage.youtube ?? "",
                                                     tiktok: circle.homepage.tiktok ?? "",
                                                     band: circle.homepage.band ?? ""))
    }
 
    
}
