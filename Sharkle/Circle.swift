//
//  Circle.swift
//  Sharkle
//
//  Created by 김우성 on 2022/05/20.
//

import Foundation

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
