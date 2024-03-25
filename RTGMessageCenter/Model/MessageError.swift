//
//  MessageError.swift
//  RTGMessageCenter
//
//  Created by Kyle Watson on 3/25/24.
//

import Foundation

struct MessageError: Codable {
    let error: String

    enum CodingKeys: String, CodingKey {
        case error = "Error"
    }
}
