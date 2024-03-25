//
//  Message.swift
//  RTGMessageCenter
//
//  Created by Kyle Watson on 3/25/24.
//

import Foundation

struct Message {
    let name: String
    let date: Date
    let message: String
}

extension Message: Codable {
    static let dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        return .formatted(dateFormatter)
    }()
}
