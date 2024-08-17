//
//  QuizInstructionsView.swift
//  ThirtySixQuestions
//
//  Created by Andrew Davis on 13/08/2024.
//

import SwiftUI

struct QuizInstructionsView: View {
    
    var body: some View {
        NavigationStack {
            VStack(spacing: .medium) {
                titleLabel
                instructionsLabel
                Spacer()
                    .frame(height: .small)
                startButton
            }
            .padding(.xLarge)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.green)
        }
    }
}

// MARK: - Views

private extension QuizInstructionsView {
    
    var titleLabel: some View {
        Text("Instructions")
            .font(.title)
    }
    
    var instructionsLabel: some View {
        Text("Sit opposite your partner with your device between you. Take turns reading one question aloud to your partner, then both of you answer. There is no time limit, be honest and truthful.")
            .font(.bodyFont)
            .multilineTextAlignment(.center)
    }
    
    var startButton: some View {
        NavigationLink(destination: QuizView()) {
            Text("WE'RE READY")
                .font(.headline)
                .foregroundColor(.black)
                .padding()
                .background(Color.white.opacity(0.75))
                .clipShape(Capsule())
                .shadow(radius: 5)
        }
    }
}

#Preview {
    QuizInstructionsView()
}
