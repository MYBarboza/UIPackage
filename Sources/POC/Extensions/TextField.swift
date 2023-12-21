//
//  TextField.swift
//  UserProfile
//
//  Created by José leoncio Quispe rodriguez on 18/12/23.
//

import Foundation
import SwiftUI

struct SingleLineTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.blue, lineWidth: 1)
            )
            .padding(.horizontal, 10)
    }
}
