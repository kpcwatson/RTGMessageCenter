//
//  StyledButton.swift
//  RTGMessageCenter
//
//  Created by Kyle Watson on 3/25/24.
//

import SwiftUI

struct StyledButton: View {
    @Environment(\.isEnabled) private var isEnabled: Bool

    let title: String
    let action: () -> Void

    var body: some View {
        Button(title) {
            action()
        }
        .font(Font.custom("Poppins", size: 16))
        .fontWeight(.medium)
        .frame(maxWidth: .infinity, minHeight: 44.0)
        .foregroundStyle(isEnabled ? .white : .secondary)
        .background(isEnabled ? Color("RTGBlue") : .gray)
        .clipShape(RoundedRectangle(cornerRadius: 44.0))
    }
}

#Preview {
    StyledButton(title: "Search") {
        //
    }
}
