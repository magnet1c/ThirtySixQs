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
                    .foregroundStyle(Color.white.opacity(0.75))
                    .shadow(radius: 5)
                IconImage(size: 16, weight: .heavy)
                    .foregroundStyle(Color.black)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct IconImage: View {

    var size: CGFloat = 26
    var weight: Font.Weight = .medium

    var body: some View {
        Image(systemName: "xmark")
            .font(.system(size: size, weight: weight))
            .frame(width: 8, height: 8)
    }
}

#Preview {
    CloseButton(action: {})
}
