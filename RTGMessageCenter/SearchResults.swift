//
//  SearchResults.swift
//  RTGMessageCenter
//
//  Created by Kyle Watson on 3/25/24.
//

import SwiftUI

struct SearchResults: View {
    @Environment(\.dismiss) private var dismiss

    let emailAddress: String
    let messageService: MessagesProvider

    @State private var messages = [Message]()
    @State private var isLoading = true
    @State private var loadingError: Error?

    private var sortedMessages: [Message] {
        return messages.sorted { $0.date > $1.date }
    }

    var body: some View {
        VStack(alignment: .leading) {
            List {
                Text("Message Center")
                    .font(.Poppins.body)
                    .fontWeight(.bold)
                ForEach(sortedMessages) { message in
                    HStack {
                        Text(message.message)
                            .font(.Poppins.callout)
                        Spacer()
                        Text(message.date.formatted(date: .numeric, time: .omitted))
                            .font(.Poppins.callout)
                    }
                }
            }
            .listStyle(.plain)
        }
        .overlay {
            if let loadingError {
                ContentUnavailableView {
                    Label("An error occurred", systemImage: "exclamationmark.triangle")
                } description: {
                    Text("\(loadingError.localizedDescription)")
                        .font(.Poppins.callout)
                }
            } else if messages.isEmpty {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    ContentUnavailableView {
                        Label("No messages yet", systemImage: "square.stack.3d.up.slash")
                    } description: {
                        Text("There are no messages to display for \(emailAddress)")
                            .font(.Poppins.body)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                }
            }
        }
        .task(priority: .userInitiated) {
            do {
                messages = try await messageService.messages(for: emailAddress)
            } catch {
                loadingError = error
            }

            isLoading = false
        }
    }

    init(
        emailAddress: String,
        messageService: MessagesProvider = MessageService()
    ) {
        self.emailAddress = emailAddress
        self.messageService = messageService
    }
}

#Preview {
    NavigationStack {
        SearchResults(emailAddress: "test@test.com",
                      messageService: MockMessageService())
    }
}
