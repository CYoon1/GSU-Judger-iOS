//
//  Rating.swift
//  GSU-Judger
//
//  Created by Christopher Yoon on 11/15/23.
//

import Foundation

struct Rating: Identifiable, Codable, Hashable {
    var id = UUID().uuidString
    let stars: Int
    let userID: String
    let projID: String
}
