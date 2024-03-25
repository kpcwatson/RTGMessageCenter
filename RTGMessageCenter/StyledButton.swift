//
//  StyledButton.swift
//  RTGMessageCenter
//
//  Created by Kyle Watson on 3/25/24.
//

import SwiftUI

struct StyledButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(title) {
            action()
        }
        .font(Font.custom("Poppins", size: 16))
        .fontWeight(.medium)
        .frame(maxWidth: .infinity, minHeight: 44.0)
        .foregroundStyle(.white)
        .background(Color("RTGBlue"))
        .clipShape(RoundedRectangle(cornerRadius: 44.0))
    }
}

#Preview {
    StyledButton(title: "Search") {
        //
    }
}
