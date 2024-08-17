//
//  QuizInstructionsView.swift
//  ThirtySixQuestions
//
//  Created by Andrew Davis on 13/08/2024.
//

import SwiftUI

struct QuizInstructionsView: View {
    
    @State private var startQuiz = false

    private let hapticsManager = HapticsManager()

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
            .navigationDestination(isPresented: $startQuiz) {
                QuizView()
            }
        }
    }
}

// MARK: - Views

private extension QuizInstructionsView {
    
    var titleLabel: some View {
        Text("Instructions")
            .foregroundStyle(.black)
            .font(.titleFont)
    }
    
    var instructionsLabel: some View {
        Text("Sit opposite your partner with your device between you. Take turns reading one question aloud to your partner, then both of you answer.\n\nThere is no time limit, be honest and truthful.")
            .foregroundStyle(.black)
            .font(.bodyFont)
            .multilineTextAlignment(.center)
    }
    
    var startButton: some View {
        TextButton(title: "WE'RE READY") {
            hapticsManager.generateSoftHaptic()
            startQuiz.toggle()
        }
//        NavigationLink(destination: QuizView()) {
//            Text("WE'RE READY")
//                .font(.buttonFont)
//                .foregroundColor(.black)
//                .padding([.leading, .trailing], .large)
//                .padding([.top, .bottom], .medium)
//                .background(Color.white.opacity(0.75))
//                .clipShape(Capsule())
//                .shadow(radius: 5)
//        }
    }
}

#Preview {
    QuizInstructionsView()
}
