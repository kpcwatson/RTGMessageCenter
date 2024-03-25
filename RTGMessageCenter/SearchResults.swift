//
//  SearchResults.swift
//  RTGMessageCenter
//
//  Created by Kyle Watson on 3/25/24.
//

import SwiftUI

struct SearchResults: View {
    let emailAddress: String

    var body: some View {
        Group {
            Text("")
        }
        .task(priority: .userInitiated) {
            // fetch results for emailAddress
        }
    }

}

#Preview {
    SearchResults(emailAddress: "")
}
