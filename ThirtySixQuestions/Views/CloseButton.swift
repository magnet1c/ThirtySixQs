//
//  CloseButton.swift
//  ThirtySixQuestions
//
//  Created by Andrew Davis on 10/08/2024.
//

import SwiftUI

typealias Action = () -> Void

struct CloseButton: View {

    let action: Action

    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .frame(width: 36, height: 36)
                    .foregroundStyle(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.white.opacity(0.7), Color.white.opacity(0.9)]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                IconImage(icon: .close, size: 16, weight: .heavy)
                    .foregroundStyle(Color.black)
            }
        }
        .overlay(
            Circle()
                .stroke(Color.white, lineWidth: 1)
        )
        .buttonStyle(PlainButtonStyle())
    }
}

enum Icon: String {
    case close = "xmark"
    case back = "arrow.backward"
}

struct IconImage: View {

    let icon: Icon
    var size: CGFloat = 16
    var weight: Font.Weight = .heavy

    var body: some View {
        Image(systemName: icon.rawValue)
            .font(.system(size: size, weight: weight))
            .frame(width: 8, height: 8)
    }
}

#Preview {
    CloseButton(action: {})
}
