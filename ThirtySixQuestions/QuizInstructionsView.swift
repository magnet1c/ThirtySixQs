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
            ZStack {
                blurryBackgroundView
                VStack(spacing: .medium) {
                    titleLabel
                    instructionsLabel
                    Spacer()
                        .frame(height: .xxSmall)
                    startButton
                }
                .padding([.leading, .trailing], .xxLarge)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .background(Color.background)
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
    }
    
    var blurryBackgroundView: some View {
        ZStack {
            Circle()
                .fill(Color.accent1)
                .frame(width: 370, height: 340)
                .opacity(0.6)
                .offset(x: -110)
                .offset(y: 20)
                .rotationEffect(.degrees(45))
                .blur(radius: 90)
            Circle()
                .fill(Color.accent2)
                .frame(width: 420, height: 400)
                .opacity(0.9)
                .offset(x: 150)
                .offset(y: -80)
                .rotationEffect(.degrees(90))
                .blur(radius: 90)
            VisualEffectView(effect: UIBlurEffect(style: .light))
                .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    QuizInstructionsView()
}
