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
            print("showSearchResults! \(showSearchResults)")
        }
    }

    var body: some View {
        NavigationStack {
            VStack {
                Group {
                    Image("RTG-LOGO")
                    Text("Message Center")
                        .font(.Poppins.header)
                }
                .padding()

                Group {
                    Text("Enter your email to search for your messages")
                        .font(.Poppins.body)
                        .multilineTextAlignment(.center)
                    TextField("Enter your email...", text: $emailAddress)
                        .padding([.top, .leading, .trailing])
                        .font(.Poppins.body)
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
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
                            .font(.Poppins.body)
                            .fontWeight(.bold)
                            .foregroundStyle(.red)
                    }
                }

                WideStyledButton(title: "Search") {
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
