//
//  PoppinsFonts.swift
//  RTGMessageCenter
//
//  Created by Kyle Watson on 3/25/24.
//

import SwiftUI

extension Font {
    struct Poppins {
        static let header: Font = {
            return Font.custom("Poppins", size: 24)
        }()

        static let body: Font = {
            return Font.custom("Poppins", size: 16)
        }()

        static let callout: Font = {
            return Font.custom("Poppins", size: 14)
        }()
    }
}
