//
//  ContentView.swift
//  RTGMessageCenter
//
//  Created by Kyle Watson on 3/25/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("RTG-LOGO")
            Text("Message Center")
                .font(Font.custom("Poppins", size: 24))
            EmailSearch()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
