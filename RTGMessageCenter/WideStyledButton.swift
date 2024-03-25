//
//  WideStyledButton.swift
//  RTGMessageCenter
//
//  Created by Kyle Watson on 3/25/24.
//

import SwiftUI

struct WideStyledButton: View {
    @Environment(\.isEnabled) private var isEnabled: Bool

    let title: String
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Spacer()
                Text(title)
                Spacer()
            }
        }
        .font(.Poppins.body)
        .fontWeight(.medium)
        .frame(height: 44)
        .frame(maxWidth: .infinity)
        .foregroundStyle(isEnabled ? .white : .secondary)
        .background(isEnabled ? Color("RTGBlue") : .gray)
        .clipShape(RoundedRectangle(cornerRadius: 44.0))
        .contentShape(Rectangle())
    }
}

#Preview {
    WideStyledButton(title: "Search") {
        //
    }
}
