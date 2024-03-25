//
//  MessageService.swift
//  RTGMessageCenter
//
//  Created by Kyle Watson on 3/25/24.
//

import Foundation

protocol MessagesProvider {
    func messages(
        for emailAddress: String
    ) async throws -> [Message]
}

class MessageService: MessagesProvider {
    let apiClient: MessagesAPIClient

    init(apiClient: MessagesAPIClient = MessagesAPIClient()) {
        self.apiClient = apiClient
    }

    func messages(
        for emailAddress: String
    ) async throws -> [Message] {
        return try await apiClient
            .fetchMessages(for: emailAddress)
    }
}

// MARK: - for use in previews
class MockMessageService: MessagesProvider {
    func messages(
        for emailAddress: String
    ) async throws -> [Message] {
        return [
            Message(
                name: "Mr. Test",
                date: Date(),
                message: "This is the first message!"
            ),
            Message(
                name: "Mr. Test",
                date: Date(timeIntervalSinceNow: -1),
                message: "This is the second message."
            ),
            Message(
                name: "Mr. Test",
                date: Date(timeIntervalSinceNow: 1),
                message: "This is the third message, which is a little bit longer than all of the other messages."
            ),
        ]
    }
}
