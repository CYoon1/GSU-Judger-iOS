//
//  Project.swift
//  GSU-Judger
//
//  Created by Christopher Yoon on 10/20/23.
//

import Foundation

struct Project: Identifiable, Codable, Hashable {
    var id = UUID().uuidString
    let projectName: String
    let description: String
}
