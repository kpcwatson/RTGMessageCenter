//
//  EmailSearch.swift
//  RTGMessageCenter
//
//  Created by Kyle Watson on 3/25/24.
//

import SwiftUI

struct EmailSearch: View {
    @State private var emailAddress = ""
    @State private var showSearchResults = false

    @State private var errors = [String]()

    private func validateAndShowResults() {
        // reset errors
        errors.removeAll()

        // validate required fields
        if emailAddress.isEmpty {
            errors.append("An email address is required to continue")
        }

        // if no errors, show results
        if errors.isEmpty {
            showSearchResults = true
        }
    }

    var body: some View {
        NavigationStack {
            VStack {
                Group {
                    Image("RTG-LOGO")
                    Text("Message Center")
                        .font(Font.custom("Poppins", size: 24))
                }
                .padding()

                Group {
                    Text("Enter your email to search for your messages")
                        .font(Font.custom("Poppins", size: 16))
                        .multilineTextAlignment(.center)
                        .padding(16.0)
                    TextField("Enter your email...", text: $emailAddress)
                        .padding([.top, .leading, .trailing])
                        .font(Font.custom("Poppins", size: 16))
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                        .onSubmit {
                            validateAndShowResults()
                        }
                    Divider()
                        .foregroundStyle(.black)
                        .padding(.horizontal)
                }

                Spacer()

                if !errors.isEmpty {
                    ForEach(errors, id: \.self) { error in
                        Text(error)
                            .font(Font.custom("Poppins", size: 16))
                            .fontWeight(.bold)
                            .foregroundStyle(.red)
                    }
                }

                StyledButton(title: "Search") {
                    validateAndShowResults()
                }
                .disabled(emailAddress.isEmpty == true)
            }
            .padding()
            .navigationDestination(isPresented: $showSearchResults) {
                SearchResults(emailAddress: emailAddress)
            }
        }
    }
}

#Preview {
    EmailSearch()
}
