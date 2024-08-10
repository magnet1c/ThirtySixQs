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
            IconImage()
                .frame(width: 44, height: 44)
                .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .foregroundStyle(.primary)
    }
}

struct IconImage: View {

    var size: CGFloat = 26
    var weight: Font.Weight = .medium

    var body: some View {
        Image(systemName: "xmark.circle.fill")
            .font(.system(size: size, weight: weight))
            .frame(width: 8, height: 8)
    }
}

#Preview {
    CloseButton(action: {})
}
