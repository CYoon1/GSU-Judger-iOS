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
    let userName: String
    let description: String
    
//    let userID: String
    let eventID: String
}
