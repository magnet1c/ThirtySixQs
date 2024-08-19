//
//  TextButton.swift
//  ThirtySixQuestions
//
//  Created by Andrew Davis on 17/08/2024.
//

import SwiftUI

struct TextButton: View {
    
    let title: String
    let icon: Image?
    var fullWidth: Bool = false
    let action: Action

    var body: some View {
        Button(action: action) {
            HStack {
                icon
                    .font(.buttonFont)
                    .foregroundColor(.black)
                Text(title)
                    .font(.buttonFont)
                    .foregroundColor(.black)
                    
            }
            .padding([.leading, .trailing], .large)
            .padding([.top, .bottom], .medium)
            
                .if(fullWidth) { view in
                    view.frame(maxWidth: .infinity)
                }
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.white.opacity(0.64), Color.white.opacity(0.85)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
        }
        .overlay(
            Capsule()
                .stroke(Color.white, lineWidth: 1)
        )
        .clipShape(Capsule())
    }
}

#Preview {
    TextButton(title: "START", icon: nil, fullWidth: false, action: {})
}

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, apply: (Self) -> Content) -> some View {
        if condition {
            apply(self)
        } else {
            self
        }
    }
}
