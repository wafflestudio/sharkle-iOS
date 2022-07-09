//
//  Circle.swift
//  Sharkle
//
//  Created by 김우성 on 2022/05/20.
//

import Foundation

struct Circle: Codable, Hashable {
    var id: Int
    var type0: Int
    var type1: Int
    var name: String
    var bio: String?
    var introduction: String?
    var tag: String
    var tag_integer: [Int]
    var homepage: Homepage
}

struct Homepage: Codable, Hashable {
    var id: Int
    var homepage: String?
    var facebook: String?
    var instagram: String?
    var twitter: String?
    var youtube: String?
    var tiktok: String?
    var band: String?
}

struct CircleResponse: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Circle]
}
