//
//  EmailSearch.swift
//  RTGMessageCenter
//
//  Created by Kyle Watson on 3/25/24.
//

import SwiftUI

struct EmailSearch: View {
    @State private var emailAddress = ""

    var body: some View {
        VStack {
            Text("Enter your email to search for your messages")
                .font(Font.custom("Poppins", size: 16))
                .multilineTextAlignment(.center)
                .padding(16.0)
            TextField("Enter your email...", text: $emailAddress)
                .padding([.top, .leading, .trailing])
                .font(Font.custom("Poppins", size: 16))
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
            Divider()
                .foregroundStyle(.black)
                .padding(.horizontal)

            Spacer()

            StyledButton(title: "Search") {
                //
            }
        }
        .padding()
    }
}

#Preview {
    EmailSearch()
}
