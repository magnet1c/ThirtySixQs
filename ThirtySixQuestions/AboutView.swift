//
//  AboutView.swift
//  ThirtySixQuestions
//
//  Created by Andrew Davis on 10/08/2024.
//

import SwiftUI

struct AboutView: View {
    
    @Environment(\.dismiss) var dismiss

    let aboutText = """
    This is a long block of text. It could be a full article, a novel, or any other lengthy content that you want to display.
    
    You can add as much text here as you want. This will be contained within a scrollable view, so the user can scroll through it even if it doesn't fit on the screen at once.

    Continue adding more content as needed. SwiftUI's ScrollView will handle the scrolling behavior for you.
    
    ...
    """

    var body: some View {
        VStack {
            navigationBar
            scrollingText
                .padding([.leading, .trailing], 16)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.yellow)
    }
}

// MARK: - Views

private extension AboutView {
    
    var navigationBar: some View {
        ZStack {
            Text("About")
                .font(.titleFont)
                .frame(height: 44)
            HStack {
                CloseButton {
                    dismiss()
                }
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    var scrollingText: some View {
        ScrollView {
            Text(aboutText)
                .font(.bodyFont)
        }
    }
}

#Preview {
    AboutView()
}
