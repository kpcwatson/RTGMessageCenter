//
//  MessagesAPIClient.swift
//  RTGMessageCenter
//
//  Created by Kyle Watson on 3/25/24.
//

import Foundation

let baseUrl = "https://vcp79yttk9.execute-api.us-east-1.amazonaws.com/messages/users/"

struct MessagesAPIClient {
    enum APIError: Error {
        case invalidUrl(String?)
        case invalidResponse
        case failedStatusCode(Int)
        case error(MessageError)
    }

    private var session: URLSession
    private var baseComponents: URLComponents = {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "vcp79yttk9.execute-api.us-east-1.amazonaws.com"
        components.path = "/messages/users/"
        return components
    }()

    func fetchMessages(for email: String) async throws -> [Message] {
        let request = try buildUrlRequest(with: email)

        let (data, response) = try await session.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }

        let decoder = JSONDecoder()

        guard httpResponse.statusCode >= 200
                && httpResponse.statusCode < 300 else {
            let messageError = try decoder.decode(MessageError.self, from: data)
            throw APIError.error(messageError)
        }

        decoder.dateDecodingStrategy = Message.dateDecodingStrategy
        let messages = try decoder.decode([Message].self, from: data)

        return messages
    }

    private func buildUrlRequest(with email: String) throws -> URLRequest {
        var components = baseComponents
        components.path += "\(email)"

        guard let url = components.url else {
            throw APIError.invalidUrl(components.string)
        }
        print("Request URL: \(url)")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        print("Request: \(request)")
        return request
    }
}

extension MessagesAPIClient {

    init(urlSession: URLSession = URLSession.shared) {
        self.session = urlSession
    }
}

extension MessagesAPIClient.APIError: CustomStringConvertible {
    var description: String {
        switch self {
        case .invalidUrl(let urlString):
            "Invalid constructed URL: \(urlString ?? "nil")"
        case .invalidResponse:
            "Response is not a valid HTTP response"
        case .failedStatusCode(let statusCode):
            "Invalid response status code: \(statusCode)"
        case .error(let messageError):
            messageError.error
        }
    }
}

extension MessagesAPIClient.APIError: LocalizedError {
    var errorDescription: String? {
        "\(self)"
    }
}
