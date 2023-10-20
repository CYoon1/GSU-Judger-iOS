//
//  Event.swift
//  GSU-Judger
//
//  Created by Christopher Yoon on 10/20/23.
//

import Foundation

struct Event: Identifiable, Codable {
    var id = UUID().uuidString
    let eventName: String
    let location: String
    let eventDate: Date
}
