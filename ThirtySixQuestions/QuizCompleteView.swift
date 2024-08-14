//
//  QuizCompleteView.swift
//  ThirtySixQuestions
//
//  Created by Andrew Davis on 14/08/2024.
//

import SwiftUI

struct QuizCompleteView: View {

    var body: some View {
        VStack(spacing: .medium) {
            titleLabel
            instructionsLabel
            Spacer()
                .frame(height: .small)
            startTimeButton
            skipButton
        }
        .padding(.xLarge)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

// MARK: - Views

private extension QuizCompleteView {
    
    var titleLabel: some View {
        Text("Well Done")
            .font(.title)
    }
    
    var instructionsLabel: some View {
        Text("You've reached the end of the questions. The final test is tp stare into your partners eyes for four minutes. It's important to finish with this step. Some people have described this step as thrilling and terrifying. Good luck...")
            .font(.bodyFont)
            .multilineTextAlignment(.center)
    }

    var startTimeButton: some View {
        Button(action: didTapStartTimer) {
            Text("START TIMER")
                .font(.headline)
                .foregroundColor(.black)
                .padding([.leading, .trailing], .medium)
                .frame(height: 48)
                .background(Color.white.opacity(0.75))
                
        }
        .buttonStyle(PlainButtonStyle())
        .clipShape(Capsule())
        .shadow(radius: 5)
    }
    
    var skipButton: some View {
        Button(action: didTapSkip) {
            Text("SKIP")
                .font(.headline)
                .foregroundColor(.black)
                .padding([.leading, .trailing], .medium)
                .frame(height: 48)
                .background(Color.white.opacity(0.75))
                
        }
        .buttonStyle(PlainButtonStyle())
        .clipShape(Capsule())
        .shadow(radius: 5)
    }
}

// MARK: - Actions

private extension QuizCompleteView {

    func didTapStartTimer() {
        print("start timer")
    }
    
    func didTapSkip() {
        guard let window = UIApplication.shared.windows.first else { return }
        window.rootViewController?.dismiss(animated: true, completion: nil)
    }
}

#Preview {
    QuizCompleteView()
}
